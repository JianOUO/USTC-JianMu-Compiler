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
    std::vector<Type *> Int(1, Int32Type);
    auto calleeFunTy = FunctionType::get(Int32Type, Int);
    auto calleeFun = Function::create(calleeFunTy, "callee", module);
    auto bb = BasicBlock::create(module, "entry", calleeFun);
    builder->set_insert_point(bb);
    auto aAlloc = builder->create_alloca(Int32Type);
    auto &arg = calleeFun->get_args().front();
    builder->create_store(&arg, aAlloc);
    auto aLoad = builder->create_load(aAlloc);
    auto imul = builder->create_imul(CONST_INT(2), aLoad);
    builder->create_ret(imul);

    auto mainFun = Function::create(FunctionType::get(Int32Type, {}), "main", module);
    bb = BasicBlock::create(module, "entry", mainFun);
    builder->set_insert_point(bb);
    auto call = builder->create_call(calleeFun, {CONST_INT(110)});
    builder->create_ret(call);
    std::cout << module->print();
    delete module;
    return 0;
}