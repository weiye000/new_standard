# 项目智能体说明：电工杯 A 题

## 编码要求

读取文本文件时，显式设置输出编码为 UTF-8，并使用 UTF-8 解码文件内容。

PowerShell 读取文本前应设置：

```powershell
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
```

读取文本文件使用 `Get-Content -Encoding UTF8`。

## 核心使命

本工作区用于配合 Codex 完成电工杯数学建模 A 题。Codex 默认主动推进数据整理、建模、实验、论文初稿和支撑材料，但采用“自动推进到关卡，关卡暂停确认”的控制方式。

凡是请求涉及电工杯、数学建模、A 题、论文、建模、数据处理、竞赛提交或继续推进，必须先读取：

```text
.codex/skills/eecup-autopilot/SKILL.md
```

具体流程以该 skill 为准。

## 必须暂停的关卡

以下节点必须暂停，不得自行跨过：

- 题意拆解完成后：先公开调研，再给出模型候选方案。
- 模型路线选择前：在 `00_problem/model_options.md` 中详细比较每个方案的优劣、风险、实现难度、验证方式和论文表达价值，等待用户选择。
- 模型效果异常时：在 `06_management/MODEL_ISSUE_REPORT.md` 中给出恢复方案，等待用户选择。
- 每个大阶段结束时：更新 `06_management/PHASE_REVIEW.md`，确保清除上下文后仍能恢复。
- 最终提交、身份信息、联网下载、付费服务、破坏性操作或覆盖用户成果前。

## 启动必读文件

每次新会话或用户说“继续”时，按顺序读取：

```text
AGENTS.md
.codex/skills/eecup-autopilot/SKILL.md
06_management/PROJECT_STATE.md
06_management/HANDOFF.md
06_management/PHASE_REVIEW.md
06_management/risk_list.md
06_management/decision_log.md
00_problem/model_options.md
04_paper/paper_draft.md
```

如果某些文件不存在，先创建模板，再继续。

## 必须维护的状态文件

```text
06_management/PROJECT_STATE.md
06_management/HANDOFF.md
06_management/PHASE_REVIEW.md
06_management/decision_log.md
06_management/experiment_log.csv
06_management/risk_list.md
06_management/checklists.md
00_problem/research_notes.md
00_problem/model_options.md
04_paper/paper_draft.md
```

每完成一个实质工作块，都要更新 `PROJECT_STATE.md` 和 `HANDOFF.md`。每完成一个大阶段，都要更新 `PHASE_REVIEW.md` 并暂停。

## 工作区结构

```text
00_problem/            官方题面、题意拆解、调研记录、模型候选方案
01_data/raw/           原始数据，禁止原地修改
01_data/processed/     清洗后和派生数据
02_src/                可复现实验代码
03_results/figures/    生成的图
03_results/tables/     生成的表和指标
04_paper/              Markdown 论文初稿、论文源码和编译产物
05_support/            最终支撑材料和说明
06_management/         状态、决策、实验、风险、清单和阶段交接
```

## 论文同步写作

从题意拆解阶段开始维护：

```text
04_paper/paper_draft.md
```

论文初稿中的每个数字结论必须标注来源文件或“待生成”。不得编造结果、引用或结论。

