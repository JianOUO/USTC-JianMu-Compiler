#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "Function.hpp"
#include "IRBuilder.hpp"
#include "Module.hpp"
#include "Type.hpp"

#include <iostream>
#include <memory>

// 定义一个从常数值获取/创建 ConstantInt 类实例化的宏，方便多次调用
#define CONST_INT(num) \
    ConstantInt::get(num, module)

// 定义一个从常数值获取/创建 ConstantFP 类实例化的宏，方便多次调用
#define CONST_FP(num) \
    ConstantFP::get(num, module)

int main() {
    auto module = new Module();
    auto builder = new IRBuilder(nullptr, module);
    Type *Int32Type = module->get_int32_type();
    auto FunMain = Function::create(FunctionType::get(Int32Type, {}), "main", module);
    auto bb = BasicBlock::create(module, "entry", FunMain);
    builder->set_insert_point(bb);
    auto retAlloca = builder->create_alloca(Int32Type);
    builder->create_store(CONST_INT(0), retAlloca);
    auto *arrayType = ArrayType::get(Int32Type, 10);
    auto apAlloca = builder->create_alloca(arrayType);   
    auto a0GEP = builder->create_gep(apAlloca, {CONST_INT(0), CONST_INT(0)});
    builder->create_store(CONST_INT(10), a0GEP);
    auto a0Load = builder->create_load(a0GEP);
    auto imul = builder->create_imul(a0Load, CONST_INT(2));
    auto a1GEP = builder->create_gep(apAlloca, {CONST_INT(0), CONST_INT(1)});
    builder->create_store(imul, a1GEP);
    auto a1Load = builder->create_load(a1GEP);
    builder->create_store(a1Load, retAlloca);
    builder->create_ret(a1Load); 
    std::cout << module->print();
    delete module;
    return 0;
}