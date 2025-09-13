#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "Function.hpp"
#include "GlobalVariable.hpp"
#include "Instruction.hpp"
#include "LICM.hpp"
#include "PassManager.hpp"
#include <cstddef>
#include <memory>
#include <vector>

/**
 * @brief 循环不变式外提Pass的主入口函数
 * 
 */
void LoopInvariantCodeMotion::run() {

    loop_detection_ = std::make_unique<LoopDetection>(m_);
    loop_detection_->run();
    func_info_ = std::make_unique<FuncInfo>(m_);
    func_info_->run();
    for (auto &loop : loop_detection_->get_loops()) {
        is_loop_done_[loop] = false;
    }

    for (auto &loop : loop_detection_->get_loops()) {
        traverse_loop(loop);
    }
}

/**
 * @brief 遍历循环及其子循环
 * @param loop 当前要处理的循环
 * 
 */
void LoopInvariantCodeMotion::traverse_loop(std::shared_ptr<Loop> loop) {
    if (is_loop_done_[loop]) {
        return;
    }
    is_loop_done_[loop] = true;
    for (auto &sub_loop : loop->get_sub_loops()) {
        traverse_loop(sub_loop);
    }
    //if (!loop->get_sub_loops().empty()) return;
    run_on_loop(loop);
}

// TODO: 实现collect_loop_info函数
// 1. 遍历当前循环及其子循环的所有指令
// 2. 收集所有指令到loop_instructions中
// 3. 检查store指令是否修改了全局变量，如果是则添加到updated_global中
// 4. 检查是否包含非纯函数调用，如果有则设置contains_impure_call为true
void LoopInvariantCodeMotion::collect_loop_info(
    std::shared_ptr<Loop> loop,
    std::set<Value *> &loop_instructions,
    std::set<Value *> &updated_global,
    bool &contains_impure_call) {
    for (auto &block : loop->get_blocks()) {
        for (auto &inst : block->get_instructions()) {
            loop_instructions.insert(&inst);
            if (inst.is_store()) {
                auto *lval = dynamic_cast<StoreInst *>(&inst)->get_lval();
                if (dynamic_cast<GlobalVariable *>(lval) != nullptr) {
                    updated_global.insert(lval);
                }    
            }
            if (inst.is_call()) {
                auto *call = dynamic_cast<CallInst *>(&inst);
                auto *func = dynamic_cast<Function *>(call->get_operand(0));
                if (!(func_info_->is_pure_function(func))) {
                    contains_impure_call = true;
                }
            } 
        }

    }
    //throw std::runtime_error("Lab4: 你有一个TODO需要完成！");
}

/**
 * @brief 对单个循环执行不变式外提优化
 * @param loop 要优化的循环
 * 
 */
void LoopInvariantCodeMotion::run_on_loop(std::shared_ptr<Loop> loop) {
    std::set<Value *> loop_instructions;
    std::set<Value *> updated_global;
    bool contains_impure_call = false;
    collect_loop_info(loop, loop_instructions, updated_global, contains_impure_call);

    std::vector<Value *> loop_invariant;


    // TODO: 识别循环不变式指令
    //
    // - 如果指令已被标记为不变式则跳过
    // - 跳过 store、ret、br、phi 等指令与非纯函数调用
    // - 特殊处理全局变量的 load 指令
    // - 检查指令的所有操作数是否都是循环不变的
    // - 如果有新的不变式被添加则注意更新 changed 标志，继续迭代

    bool changed;
    do {
        changed = false;
        for (auto &inst_ : loop_instructions) {
            auto *inst = static_cast<Instruction *>(inst_);
            auto id = std::find(loop_invariant.begin(), loop_invariant.end(), inst);
            if (id != loop_invariant.end()) continue;
            if (inst->is_store() || inst->is_ret() || inst->is_br() || inst->is_phi()) continue;
            if (inst->is_call()){
                auto *call = dynamic_cast<CallInst *>(inst);
                auto *func = dynamic_cast<Function *>(call->get_operand(0));
                if (!(func_info_->is_pure_function(func))) {
                    continue;
                }
            }
            if (inst->is_load()) {
                auto *op = dynamic_cast<LoadInst *>(inst)->get_operand(0);
                if (dynamic_cast<GlobalVariable *>(op) != nullptr) {
                    if (updated_global.find(op) == updated_global.end()) { 
                        loop_invariant.push_back(inst);
                        changed = true;
                    }
                    continue;
                }
            }
            bool invariant = true;
            for (auto &op : inst->get_operands()) {
                auto id = std::find(loop_invariant.begin(), loop_invariant.end(), op);
                if (!(id != loop_invariant.end() || dynamic_cast<Constant *>(op) != nullptr || loop_instructions.find(op) == loop_instructions.end())) {
                    invariant = false;
                    break;
                }
            }
            if (invariant) {
                loop_invariant.push_back(inst);
                changed = true;
            }
        }
        //throw std::runtime_error("Lab4: 你有一个TODO需要完成！");
    } while (changed);

    if (loop->get_preheader() == nullptr) {
        loop->set_preheader(
            BasicBlock::create(m_, "", loop->get_header()->get_parent()));
    }
   /* 
    if (!loop->get_sub_loops().empty()) {
        return;
        assert(loop_invariant.empty());
    }
    */

    if (loop_invariant.empty())
        return;
    
    // insert preheader
    auto preheader = loop->get_preheader();

    // TODO: 更新 phi 指令
    for (auto &phi_inst_ : loop->get_header()->get_instructions()) {
        if (phi_inst_.get_instr_type() != Instruction::phi)
            break;
        auto *phi_inst = dynamic_cast<PhiInst *>(&phi_inst_);
        auto *preheader_phi = PhiInst::create_phi(phi_inst->get_type(), preheader);
        auto &latches = loop->get_latches();
        for (auto &phi_pair : phi_inst->get_phi_pairs()) {
            if (latches.find(phi_pair.second) == latches.end()) {
                preheader_phi->add_phi_pair_operand(phi_pair.first, phi_pair.second);
                phi_inst->remove_phi_operand(phi_pair.second);
            }
        }
        if (preheader_phi->get_num_operand() != 0) {
            preheader->add_instr_begin(preheader_phi);
            phi_inst->add_phi_pair_operand(preheader_phi, preheader);
        }
        //throw std::runtime_error("Lab4: 你有一个TODO需要完成！");
    }

    // TODO: 用跳转指令重构控制流图 
    // 将所有非 latch 的 header 前驱块的跳转指向 preheader
    // 并将 preheader 的跳转指向 header
    // 注意这里需要更新前驱块的后继和后继的前驱
    std::vector<BasicBlock *> pred_to_remove;
    auto &latches = loop->get_latches();
    for (auto &pred : loop->get_header()->get_pre_basic_blocks()) {
        //throw std::runtime_error("Lab4: 你有一个TODO需要完成！");
        if (latches.find(pred) != latches.end()) continue;
        pred_to_remove.push_back(pred);
        auto *br = dynamic_cast<BranchInst *>(pred->get_terminator());
        assert(br);
        for (unsigned int i = 0; i < br->get_num_operand(); i++) {
            if (br->get_operand(i) == loop->get_header()) {
                br->set_operand(i, preheader);
                break;
            }
        }
        pred->remove_succ_basic_block(loop->get_header());
        pred->add_succ_basic_block(preheader);
        preheader->add_pre_basic_block(pred);
    }


    for (auto &pred : pred_to_remove) {
        loop->get_header()->remove_pre_basic_block(pred);
    }

    // TODO: 外提循环不变指令
    for (auto &inst_ : loop_invariant) {
        auto *inst = dynamic_cast<Instruction *>(inst_);
        inst->get_parent()->remove_instr(inst);
        inst->set_parent(preheader);
        //assert(inst->get_instr_type() != Instruction::ret && inst->get_instr_type() != Instruction::br);
        preheader->add_instruction(inst);
    }
    //throw std::runtime_error("Lab4: 你有一个TODO需要完成！");
    //preheader->get_terminator();
    //std::cerr << "hello" << std::endl;

    // insert preheader br to header
    BranchInst::create_br(loop->get_header(), preheader);

    // insert preheader to parent loop
    if (loop->get_parent() != nullptr) {
        loop->get_parent()->add_block(preheader);
    }
}

