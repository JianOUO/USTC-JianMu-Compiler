#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "Function.hpp"
#include "IRBuilder.hpp"
#include "Module.hpp"
#include "Type.hpp"

#include <iostream>
#include <memory>

// 定义一个从常数值获取/创建 ConstantInt 类实例化的宏，方便多次调用
#define CONST_INT(num) ConstantInt::get(num, module)

// 定义一个从常数值获取/创建 ConstantFP 类实例化的宏，方便多次调用
#define CONST_FP(num) ConstantFP::get(num, module)
int main() {
    auto module = new Module();
    auto builder = new IRBuilder(nullptr, module);
    Type *Int32Type = module->get_int32_type();
    auto mainFunType = FunctionType::get(Int32Type, {});
    auto mainFun = Function::create(mainFunType, "main", module);
    auto bb = BasicBlock::create(module, "entry", mainFun);
    builder->set_insert_point(bb);
    auto aAlloca = builder->create_alloca(Int32Type);
    auto iAlloca = builder->create_alloca(Int32Type);
    builder->create_store(CONST_INT(10), aAlloca);
    builder->create_store(CONST_INT(0), iAlloca);
    auto cmpBB = BasicBlock::create(module, "cmpBB", mainFun);
    auto trueBB = BasicBlock::create(module, "trueBB", mainFun);
    auto retBB = BasicBlock::create(module, "retBB", mainFun);
    builder->create_br(cmpBB);
    builder->set_insert_point(cmpBB);
    auto aLoad = builder->create_load(aAlloca);
    auto iLoad = builder->create_load(iAlloca);
    auto icmp = builder->create_icmp_lt(iLoad, CONST_INT(10));
    builder->create_cond_br(icmp, trueBB, retBB);
    builder->set_insert_point(trueBB);
    auto add = builder->create_iadd(iLoad, CONST_INT(1));
    builder->create_store(add, iAlloca);
    add = builder->create_iadd(aLoad, add);
    builder->create_store(add, aAlloca);
    builder->create_br(cmpBB);
    builder->set_insert_point(retBB);
    builder->create_ret(aLoad);
    std::cout << module->print();
    delete module;
    return 0;
}
