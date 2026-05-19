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

## Git 版本控制与多模型隔离试验规则

### Git 保存纪律

- 开始任何实质工作前，先检查当前工作区是否已经是 Git 仓库；若不是，先初始化仓库并说明。
- 每完成一个实质工作块或阶段关卡，必须先更新 `PROJECT_STATE.md` 和 `HANDOFF.md`，必要时更新 `PHASE_REVIEW.md`、`decision_log.md`、`experiment_log.csv` 等状态文件，然后检查 `git status --short`。
- 若存在重要进度，必须创建本地提交。重要进度包括：题意拆解、调研记录、模型方案、数据处理脚本、模型代码、实验结果、图表、论文草稿、支撑材料或项目规则变更。
- 提交信息使用清晰前缀，例如 `docs:`、`data:`、`model:`、`paper:`、`results:`、`chore:`。提交前确认不包含凭据、身份信息、无关大文件或不应公开的敏感内容。
- 切换分支、尝试新模型路线或整理最终结果前，必须保证当前重要进度已提交，或明确说明尚未提交的内容和原因。
- 本工作流只要求本地提交，不主动考虑远程推送；如用户另行明确要求推送，再作为单独任务处理。
- 禁止使用会覆盖或破坏用户成果的 Git 操作，例如 `git reset --hard`、删除分支、回滚未确认的用户改动；除非用户明确要求并确认风险。

### 多模型隔离代码顺序试验

- 初始候选模型必须先写入 `00_problem/model_options.md` 并暂停，等待用户选择；不得为了试验方便绕过模型路线选择关卡。
- 基准模型是统一评价底座，不占用候选路线名额；至少 3 个候选路线必须在调研选型关卡中确定。
- `00_problem/model_options.md` 必须写清路线执行方式：单路线推进，或多路线顺序隔离比较；多路线顺序隔离比较还要列出被选入比较的路线和试验顺序。
- 开始多模型顺序试验前，必须先完成并提交统一基准模型、数据版本、评价指标、随机种子和验证切分。
- 多模型比较不默认为每条候选路线创建 Git 分支；每条候选路线在独立代码目录中实现，例如 `02_src/models/<model_id>/`，共享数据处理、基准模型和评价脚手架放在 `02_src/common/`、`02_src/baseline/` 和 `02_src/evaluation/`。
- 每次只推进一个候选模型。该模型完成或失败后，必须保存标准结果包并本地提交，再进入下一条已获用户确认的路线。
- 每个候选模型的标准结果包保存到 `03_results/models/<model_id>/`，至少包含 `metrics.csv`、`summary.md` 和必要图表；失败模型也必须写明失败原因、已尝试内容和是否放弃。
- 各候选模型必须使用一致的数据版本、评价指标、随机种子和验证切分；差异必须记录在 `06_management/experiment_log.csv` 或对应说明文件中。
- 单个候选模型失败时，若不影响统一数据、指标和约束口径，可记录失败并继续下一条预先批准路线；若暴露数据、指标或约束的系统性问题，则触发 `06_management/MODEL_ISSUE_REPORT.md` 并暂停。
- 最终选择模型前，应整理统一比较表，优先保存到 `03_results/tables/model_comparison.csv`；所有被选入比较的路线都必须有可复现实验结果，或有明确失败原因与异常记录，不得只展示成功模型。
- 最终选择前必须更新 `00_problem/model_options.md`、`06_management/decision_log.md` 和 `04_paper/paper_draft.md`，然后暂停等待用户确认。

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
