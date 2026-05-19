---
name: eecup-autopilot
description: 用于电工杯或大学生数学建模竞赛任务，尤其是 A 题自动化流程、题意分析、模型调研与方案选择、模型效果异常处理、论文同步写作、阶段暂停交接、支撑材料、上下文防溢出，以及用户要求继续推进竞赛工作的场景。
---

# 电工杯自动驾驶

## 概述

运行一个可暂停、可恢复、可复现的电工杯 A 题工作流。常规任务自动推进；题意理解、模型路线、模型异常和阶段切换必须停下来让用户选择或确认。

## 启动协议

1. 读取文本前设置 UTF-8。
2. 读取 `AGENTS.md`。
3. 读取 `06_management/PROJECT_STATE.md`、`HANDOFF.md`、`PHASE_REVIEW.md`、`risk_list.md`、`decision_log.md`。
4. 读取 `00_problem/model_options.md` 和 `04_paper/paper_draft.md`。
5. 缺文件则用模板补齐；缺官方题面或数据则只索要这些文件。
6. 根据阶段驱动表继续。

## 阶段驱动

| 阶段 | 触发条件 | 产物 | 是否暂停 |
|---|---|---|---|
| 接收材料 | 题面或数据缺失 | 工作区骨架、缺失文件说明 | 是 |
| 模板检查 | 题包/通知已获取但论文模板状态未确认 | 官方模板检查结论、排版路线 | 是 |
| 题意拆解 | 题面已存在但任务表缺失或未按读题规范拆解 | `problem_decomposition.md`、`paper_draft.md` 初稿 | 是 |
| 调研选型 | 题意拆解完成但模型路线未确认 | `research_notes.md`、`model_options.md` | 是 |
| 基准模型 | 路线已确认但无可运行基准 | 基准脚本、首批指标、论文片段 | 是 |
| 主模型 | 基准完成但主结果不足 | 改进模型、对比结果 | 异常时暂停 |
| 验证分析 | 主结果存在但证据不足 | 鲁棒性、灵敏度、误差分析 | 是 |
| 论文整理 | 验证结果存在但论文不完整 | `paper_draft.md`、图表资产 | 是 |
| 支撑材料 | 论文基本成形 | 复现说明、支撑材料清单 | 是 |

## 方案选择规则

凡是需要用户选择，必须给出多个方案，并详细说明：

- 方案目标；
- 核心方法；
- 优点；
- 缺点；
- 风险；
- 实现难度；
- 验证方式；
- 对论文表达的价值；
- 推荐顺序与理由。

不得只给一个推荐项，也不得只说“建议选择 X”。

## 论文模板检查关卡

比赛开始并拿到题包、通知或官网链接后，先确认是否提供官方 Word、LaTeX 或格式模板：

- 若有官方模板，严格以官方模板为最终排版依据，并将 `04_paper/paper_draft.md` 迁移进去。
- 若无官方模板，按电工杯论文规范自行排版，优先输出 PDF；是否使用 LaTeX 由环境和用户选择决定。
- 非官方 LaTeX 模板只作排版参考，不能作为官方格式依据。
- 模板检查结论写入 `06_management/PHASE_REVIEW.md` 和 `04_paper/paper_draft.md` 的“排版与模板状态”。

## 题意拆解关卡

读取官方题面后，必须先读取 `references/problem-reading.md`。题意拆解阶段只做理解和拆解，不直接选择主模型。

必须创建或更新：

```text
00_problem/problem_decomposition.md
04_paper/paper_draft.md
06_management/PHASE_REVIEW.md
```

完成后暂停。若存在高影响歧义，必须列出可选解释、各自后果和推荐解释，让用户确认。

## 模型路线关卡

主模型实现前必须读取 `references/research-and-choice.md`，并更新：

```text
00_problem/research_notes.md
00_problem/model_options.md
04_paper/paper_draft.md
```

完成后暂停，等待用户选择模型路线。允许做数据概览和极小型可行性试验，但不得锁定主模型。

## 模型异常关卡

出现以下情况时读取 `references/model-recovery.md`，写 `MODEL_ISSUE_REPORT.md` 并暂停：

- 主模型不优于基准，或提升不足以支撑论文；
- 约束违反、结果不稳定、不可解释或不可复现；
- 运行成本过高，影响后续实验和论文整理；
- 结果与工程常识或题面约束冲突。

## 按需读取参考文件

- `references/operating-loop.md`：阶段关卡和工作块规则。
- `references/problem-reading.md`：读题行为规范和题意拆解要求。
- `references/research-and-choice.md`：调研与方案选择。
- `references/modeling-playbook.md`：建模和验证要点。
- `references/model-recovery.md`：模型异常诊断与恢复方案。
- `references/paper-playbook.md`：Markdown 论文初稿和论文质量门槛。
- `references/context-control.md`：上下文恢复和状态文件纪律。

## 质量门槛

声称阶段完成前必须确认：

- 当前阶段产物已写入文件；
- `PROJECT_STATE.md`、`HANDOFF.md` 已更新；
- 大阶段结束时 `PHASE_REVIEW.md` 已更新；
- `paper_draft.md` 已同步当前可写入论文的内容；
- 结果文件、图表、脚本路径能对应；
- 模型方案或异常恢复方案已充分比较优劣。

## 初始化

如果工作区骨架缺失，运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\.codex\skills\eecup-autopilot\scripts\bootstrap_project.ps1
```

脚本只创建缺失目录和模板，不覆盖已有文件。
