#include "cminusf_builder.hpp"

#define CONST_FP(num) ConstantFP::get((float)num, module.get())
#define CONST_INT(num) ConstantInt::get(num, module.get())

// types
Type *VOID_T;
Type *INT1_T;
Type *INT32_T;
Type *INT32PTR_T;
Type *FLOAT_T;
Type *FLOATPTR_T;

/*
 * use CMinusfBuilder::Scope to construct scopes
 * scope.enter: enter a new scope
 * scope.exit: exit current scope
 * scope.push: add a new binding to current scope
 * scope.find: find and return the value bound to the name
 */

Value* CminusfBuilder::visit(ASTProgram &node) {
    VOID_T = module->get_void_type();
    INT1_T = module->get_int1_type();
    INT32_T = module->get_int32_type();
    INT32PTR_T = module->get_int32_ptr_type();
    FLOAT_T = module->get_float_type();
    FLOATPTR_T = module->get_float_ptr_type();

    Value *ret_val = nullptr;
    for (auto &decl : node.declarations) {
        ret_val = decl->accept(*this);
    }
    return ret_val;
}

Value* CminusfBuilder::visit(ASTNum &node) {
    // TODO: This function is empty now.
    // Add some code here.
    if (node.type == TYPE_INT) {
        context.val = CONST_INT(node.i_val);
    } else {
        context.val = CONST_FP(node.f_val);
    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTVarDeclaration &node) {
    // TODO: This function is empty now.
    // Add some code here.
    Type *var_ty;
    if (node.type == TYPE_INT) {
        if (node.num) {
            assert(node.num->type == TYPE_INT && "array index should be INT");
            assert(node.num->i_val > 0 && "array size should greater than 0");
            var_ty = module->get_array_type(INT32_T, node.num->i_val);
        } else {
            var_ty = INT32_T;
        }
    } else if (node.type == TYPE_FLOAT) {
        if (node.num) {
            assert(node.num->type == TYPE_INT && "array index should be INT");
            assert(node.num->i_val > 0 && "array size should greater than 0");
            var_ty = module->get_array_type(FLOAT_T, node.num->i_val);
        } else {
            var_ty = FLOAT_T;
        }
    }
    if (scope.in_global()) {
        auto init = ConstantZero::get(var_ty, module.get());
        auto global_var = GlobalVariable::create(node.id, module.get(), var_ty, false, init);
        assert(scope.push(node.id, global_var) && "names conflict in scope"); 
    } else {
        auto alloca = builder->create_alloca(var_ty);  
        assert(scope.push(node.id, alloca) && "names conflict in scope");
    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTFunDeclaration &node) {
    FunctionType *fun_type;
    Type *ret_type;
    std::vector<Type *> param_types;
    if (node.type == TYPE_INT)
        ret_type = INT32_T;
    else if (node.type == TYPE_FLOAT)
        ret_type = FLOAT_T;
    else
        ret_type = VOID_T;

    for (auto &param : node.params) {
        // TODO: Please accomplish param_types.
        if (param->type == TYPE_FLOAT) {
            if (param->isarray) {
                param_types.push_back(FLOATPTR_T);
            } else {
                param_types.push_back(FLOAT_T);
            }
        } else if (param->type == TYPE_INT) {
            if (param->isarray) {
                param_types.push_back(INT32PTR_T);
            } else {
                param_types.push_back(INT32_T);
            }
        } else {
            assert(false && "function param type can not be void");
        }
    }

    fun_type = FunctionType::get(ret_type, param_types);
    auto func = Function::create(fun_type, node.id, module.get());
    assert(scope.push(node.id, func) && "names conflict in scope");
    context.func = func;
    auto funBB = BasicBlock::create(module.get(), "entry", func);
    builder->set_insert_point(funBB);
    scope.enter();
    std::vector<Value *> args;
    for (auto &arg : func->get_args()) {
        args.push_back(&arg);
    }
    for (unsigned int i = 0; i < node.params.size(); ++i) {
        // TODO: You need to deal with params and store them in the scope.
        auto alloca = builder->create_alloca(param_types[i]);
        builder->create_store(args[i], alloca);
        assert(scope.push(node.params[i]->id, alloca) && "names conflict in scope");
    }
    context.is_function_CompStmt = true;
    node.compound_stmt->accept(*this);
    if (not builder->get_insert_block()->is_terminated()) 
    {
        if (context.func->get_return_type()->is_void_type())
            builder->create_void_ret();
        else if (context.func->get_return_type()->is_float_type())
            builder->create_ret(CONST_FP(0.));
        else
            builder->create_ret(CONST_INT(0));
    }
    scope.exit();
    return nullptr;
}

Value* CminusfBuilder::visit(ASTParam &node) {
    // TODO: This function is empty now.
    // Add some code here.
    return nullptr;
}

Value* CminusfBuilder::visit(ASTCompoundStmt &node) {
    // TODO: This function is not complete.
    // You may need to add some code here
    // to deal with complex statements. 
    bool is_function_CompStmt = false;
    if (context.is_function_CompStmt) {
        context.is_function_CompStmt = false;
        is_function_CompStmt = true;
    } else {
        scope.enter();
    } 
    for (auto &decl : node.local_declarations) {
        decl->accept(*this);
    }
    for (auto &stmt : node.statement_list) {
        stmt->accept(*this);
        if (builder->get_insert_block()->is_terminated())
            break;
    }

    if (!is_function_CompStmt) {
        scope.exit();
    }

    return nullptr;
}

Value* CminusfBuilder::visit(ASTExpressionStmt &node) {
    // TODO: This function is empty now.
    // Add some code here.
    if (node.expression) {
        node.expression->accept(*this);
    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTSelectionStmt &node) {
    // TODO: This function is empty now.
    // Add some code here.
    node.expression->accept(*this);
    auto cond = context.val;
    if (cond->get_type()->is_float_type()) {
        cond = builder->create_fcmp_ne(cond, CONST_FP(0));
    } else if (cond->get_type()->is_int32_type()) {
        cond = builder->create_icmp_ne(cond, CONST_INT(0));
    }
    assert(cond->get_type()->is_int1_type() && "cond is not int1");
    auto trueBB = BasicBlock::create(module.get(), "", context.func);
    auto falseBB = BasicBlock::create(module.get(), "", context.func);
    builder->create_cond_br(cond, trueBB, falseBB);
    builder->set_insert_point(trueBB);
    node.if_statement->accept(*this);
    if (node.else_statement) {
        auto nextBB = BasicBlock::create(module.get(), "", context.func);
        if (!builder->get_insert_block()->is_terminated()) {
            builder->create_br(nextBB);
        }
        builder->set_insert_point(falseBB);
        node.else_statement->accept(*this);
        if (!builder->get_insert_block()->is_terminated()) {
            builder->create_br(nextBB);
        }
        builder->set_insert_point(nextBB); 
    } else {
        if (!builder->get_insert_block()->is_terminated()) {
            builder->create_br(falseBB);
        }
        builder->set_insert_point(falseBB);
    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTIterationStmt &node) {
    // TODO: This function is empty now.
    // Add some code here.
    auto whileBB = BasicBlock::create(module.get(), "", context.func);
    auto trueBB = BasicBlock::create(module.get(), "", context.func);
    auto falseBB = BasicBlock::create(module.get(), "", context.func);
    builder->create_br(whileBB);
    builder->set_insert_point(whileBB);
    node.expression->accept(*this);
    auto cond = context.val;
    if (cond->get_type()->is_float_type()) {
        cond = builder->create_fcmp_ne(cond, CONST_FP(0));
    } else if (cond->get_type()->is_int32_type()) {
        cond = builder->create_icmp_ne(cond, CONST_INT(0));
    }
    assert(cond->get_type()->is_int1_type() && "cond is not int1");
    builder->create_cond_br(cond, trueBB, falseBB);
    builder->set_insert_point(trueBB);
    node.statement->accept(*this);
    if (!builder->get_insert_block()->is_terminated()) {
        builder->create_br(whileBB);
    }
    builder->set_insert_point(falseBB);
    return nullptr;
}

Value* CminusfBuilder::visit(ASTReturnStmt &node) {
    if (node.expression == nullptr) {
        builder->create_void_ret();
        return nullptr;
    } else {
        // TODO: The given code is incomplete.
        // You need to solve other return cases (e.g. return an integer).
        node.expression->accept(*this);
        auto val = context.val;
        auto ret_ty = context.func->get_return_type();
        auto val_ty = val->get_type();
        if (ret_ty->is_int32_type() && val_ty->is_int1_type()) {
            val = builder->create_zext(val, ret_ty);
        } else if (ret_ty->is_float_type() && val_ty->is_integer_type()) {
            val = builder->create_sitofp(val, ret_ty);
        } else if (ret_ty->is_integer_type() && val_ty->is_float_type()) {
            val = builder->create_fptosi(val, ret_ty);
        }
        builder->create_ret(val);
    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTVar &node) {
    // TODO: This function is empty now.
    // Add some code here.
    Value *ptr = scope.find(node.id);
    if (node.expression) {
        node.expression->accept(*this);
        auto index = context.val;
        if (index->get_type()->is_float_type()) {
            index = builder->create_fptosi(index, INT32_T);
        } else if (index->get_type()->is_int1_type()) {
            index = builder->create_zext(index, INT32_T);
        }
        assert(index->get_type()->is_int32_type() && "array index is not int32");
        auto trueBB = BasicBlock::create(module.get(), "", context.func);
        auto falseBB = BasicBlock::create(module.get(), "", context.func);
        auto cond = builder->create_icmp_lt(index, CONST_INT(0));
        builder->create_cond_br(cond, trueBB, falseBB);
        builder->set_insert_point(trueBB);
        builder->create_call(scope.find("neg_idx_except"), {});
        builder->create_br(falseBB);
        builder->set_insert_point(falseBB);
        if (ptr->get_type()->get_pointer_element_type()->is_pointer_type()) {
            ptr = builder->create_load(ptr);
            auto gep = builder->create_gep(ptr, {index});
            context.val = builder->create_load(gep);
        } else {
            auto gep = builder->create_gep(ptr, {CONST_INT(0), index}); 
            context.val = builder->create_load(gep);
        }
    } else if (ptr->get_type()->get_pointer_element_type()->is_array_type()) {
        context.val = builder->create_gep(ptr, {CONST_INT(0), CONST_INT(0)});
    } else {
        context.val = builder->create_load(ptr);
    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTAssignExpression &node) {
    // TODO: This function is empty now.
    // Add some code here.
    Type *target_ty;
    Value *ptr = scope.find(node.var->id);
    Value *gep = ptr;
    auto isAllocaInst = dynamic_cast<AllocaInst *>(ptr);
    auto isGlobalVariable = dynamic_cast<GlobalVariable *>(ptr);
    assert((isAllocaInst || isGlobalVariable) && "ptr is not AllocaInst or GlobalVar");
    if (node.var->expression) {
        node.var->expression->accept(*this);
        auto index = context.val;
        if (ptr->get_type()->get_pointer_element_type()->is_pointer_type()) {
            ptr = builder->create_load(ptr);
            gep = builder->create_gep(ptr, {index});
        } else {
            gep = builder->create_gep(ptr, {CONST_INT(0), index});
        }
        target_ty = static_cast<GetElementPtrInst *>(gep)->get_element_type();
    } else {
        if (isAllocaInst) target_ty = isAllocaInst->get_alloca_type();
        else target_ty = isGlobalVariable->get_type();
    } 
    node.expression->accept(*this);
    auto val = context.val;
    auto val_ty = val->get_type();
    if (target_ty->is_int32_type() && val_ty->is_int1_type()) {
        val = builder->create_zext(val, target_ty);
    } else if (target_ty->is_float_type() && val_ty->is_integer_type()) {
        val = builder->create_sitofp(val, target_ty);
    } else if (target_ty->is_integer_type() && val_ty->is_float_type()) {
        val = builder->create_fptosi(val, target_ty);
    }
    builder->create_store(val, gep);
    return nullptr;
}

Value* CminusfBuilder::visit(ASTSimpleExpression &node) {
    // TODO: This function is empty now.
    // Add some code here.
    node.additive_expression_l->accept(*this);
    if (node.additive_expression_r) {
        auto lval = context.val;
        node.additive_expression_r->accept(*this);
        auto rval = context.val;
        auto lty = lval->get_type();
        auto rty = rval->get_type();
        bool is_float = rty->is_float_type() || lty->is_float_type();
        bool is_int1 = rty->is_int1_type() || lty->is_int1_type();
        if (is_float) {
            if (!rty->is_float_type()) rval = builder->create_sitofp(rval, FLOAT_T);
            if (!lty->is_float_type()) lval = builder->create_sitofp(lval, FLOAT_T);
        } 
        else if (is_int1) {
            if (rty->is_int1_type()) rval = builder->create_zext(rval, INT32_T);
            if (lty->is_int1_type()) lval = builder->create_zext(lval, INT32_T);
            assert(lval->get_type()->is_int32_type() && rval->get_type()->is_int32_type());
        }
        
        switch (node.op) {
            case OP_LE: 
                if (is_float) {
                    context.val = builder->create_fcmp_le(lval, rval);
                } else {
                    assert(lval->get_type()->is_int32_type() && rval->get_type()->is_int32_type());
                    context.val = builder->create_icmp_le(lval, rval);
                }
                break;
            case OP_LT: 
                if (is_float) { 
                    context.val = builder->create_fcmp_lt(lval, rval);
                } else {
                    assert(lval->get_type()->is_int32_type() && rval->get_type()->is_int32_type());
                    context.val = builder->create_icmp_lt(lval, rval);
                }
                break;
            case OP_GT:
                if (is_float) { 
                    context.val = builder->create_fcmp_gt(lval, rval);
                } else {
                    assert(lval->get_type()->is_int32_type() && rval->get_type()->is_int32_type());
                    context.val = builder->create_icmp_gt(lval, rval);
                }
                break;
            case OP_GE: 
                if (is_float) { 
                    context.val = builder->create_fcmp_ge(lval, rval);
                } else {
                    assert(lval->get_type()->is_int32_type() && rval->get_type()->is_int32_type());
                    context.val = builder->create_icmp_ge(lval, rval);
                }
                break;
            case OP_EQ:
                if (is_float) {
                    context.val = builder->create_fcmp_eq(lval, rval);
                } else {
                    assert(lval->get_type()->is_int32_type() && rval->get_type()->is_int32_type());
                    context.val = builder->create_icmp_eq(lval, rval);
                }
                break;
            case OP_NEQ: 
                if (is_float) {
                    context.val = builder->create_fcmp_ne(lval, rval);
                } else { 
                    assert(lval->get_type()->is_int32_type() && rval->get_type()->is_int32_type());
                    context.val = builder->create_icmp_ne(lval, rval);
                }
                break;
        }
    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTAdditiveExpression &node) {
    // TODO: This function is empty now.
    // Add some code here.
    node.term->accept(*this);
    if (node.additive_expression) {
        auto rval = context.val;
        node.additive_expression->accept(*this);
        auto lval = context.val;
        auto rty = rval->get_type();
        auto lty = lval->get_type();
        bool is_float = rty->is_float_type() || lty->is_float_type();
        if (is_float) {
            if (!rty->is_float_type()) rval = builder->create_sitofp(rval, FLOAT_T);
            if (!lty->is_float_type()) lval = builder->create_sitofp(lval, FLOAT_T);
        }
        switch (node.op) {
            case OP_PLUS: {
                if (is_float) context.val = builder->create_fadd(lval, rval);
                else context.val = builder->create_iadd(lval, rval);
                break;
            }
            case OP_MINUS: {
                if (is_float) context.val = builder->create_fsub(lval, rval);
                else context.val = builder->create_isub(lval, rval);
                break;
            }
        }
    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTTerm &node) {
    // TODO: This function is empty now.
    // Add some code here.
    node.factor->accept(*this);
    if (node.term) {
        auto rval = context.val;
        node.term->accept(*this);
        auto lval = context.val; 
        auto rty = rval->get_type();
        auto lty = lval->get_type();
        bool is_float = rty->is_float_type() || lty->is_float_type();
        if (is_float) {
            if (!rty->is_float_type()) rval = builder->create_sitofp(rval, FLOAT_T);
            if (!lty->is_float_type()) lval = builder->create_sitofp(lval, FLOAT_T);
        }
        switch (node.op) {
            case OP_MUL: {
                if (is_float) context.val = builder->create_fmul(lval, rval);
                else context.val = builder->create_imul(lval, rval);
                break;
            }
            case OP_DIV: {
                if (is_float) context.val = builder->create_fdiv(lval, rval);
                else context.val = builder->create_isdiv(lval, rval);
                break;
            }
        }
    } 
    return nullptr;
}

Value* CminusfBuilder::visit(ASTCall &node) {
    // TODO: This function is empty now.
    // Add some code here.
    auto func = dynamic_cast<Function *>(scope.find(node.id));
    assert(func && "Not a function");
    assert((func->get_num_of_args() == node.args.size()) && "Wrong number of args");
    std::vector<Value *> args;
    auto func_type = static_cast<FunctionType *>(func->get_type());
    for (std::size_t i = 0; i < node.args.size(); i++) {
        node.args[i]->accept(*this);
        auto val = context.val;
        auto val_ty = val->get_type();
        auto func_param_ty = func_type->get_param_type(i);
        if (func_param_ty->is_float_type() && val_ty->is_integer_type()) {
            val = builder->create_sitofp(val, func_param_ty);
        } else if (func_param_ty->is_integer_type() && val_ty->is_float_type()) {
            val = builder->create_fptosi(val, func_param_ty);
        } else if (func_param_ty->is_int32_type() && val_ty->is_int1_type()) {
            val = builder->create_zext(val, func_param_ty);
        }
        args.push_back(val);
    }
    context.val = builder->create_call(func, args);
    return nullptr;
}
