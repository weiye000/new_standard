# 电工杯 A 题工作区说明

这个工作区用于配合 Codex 完成电工杯数学建模 A 题。整体思路不是让 Codex 一路无脑跑到底，而是：

```text
自动推进常规任务 -> 到关键关卡暂停 -> 给出方案优劣 -> 由你选择 -> 再继续执行
```

## 你需要怎么用

比赛开始后：

1. 把官方 A 题题面放入 `00_problem/`。
2. 把原始数据放入 `01_data/raw/`。
3. 如果题包或官网提供了论文模板，也放入 `04_paper/` 或在对话中说明模板位置。
4. 对 Codex 说：

```text
继续电工杯 A 题工作，按项目流程推进。
```

之后每次重新开启对话，Codex 会先读取状态文件，再继续推进。

## 工作流程

1. **接收材料**
   - 检查题面和数据是否齐全。
   - 缺文件时只要求你补文件，不编造题意。

2. **论文模板检查**
   - 先检查题包、官网通知和论文规范是否提供官方 Word/LaTeX/格式模板。
   - 有官方模板时，最终稿严格使用官方模板。
   - 没有官方模板时，按电工杯论文规范自行排版，默认优先生成 PDF。
   - 非官方 LaTeX 模板只能作为参考，不能当作官方依据。

3. **题意拆解**
   - 必须先按 `.codex/skills/eecup-autopilot/references/problem-reading.md` 的读题规范执行。
   - 解析每个小问的输入、输出、约束、评价指标和风险。
   - 更新 `00_problem/problem_decomposition.md`。
   - 同步更新 `04_paper/paper_draft.md`。
   - 阶段结束暂停。

4. **调研与模型方案选择**
   - 联网调研公开资料、官方规则、相关模型和工程背景。
   - 更新 `00_problem/research_notes.md`。
   - 在 `00_problem/model_options.md` 中给出多个模型方案。
   - 每个方案必须写清优点、缺点、风险、实现难度、验证方式和论文表达价值。
   - 等你选择后，才进入主模型实现。

5. **基准模型**
   - 先做简单、透明、可复现的 baseline。
   - 保存代码、指标、表格和论文片段。
   - 阶段结束暂停。

6. **主模型与改进**
   - 按你选择的路线实现。
   - 与基准模型比较。
   - 如果效果不好，写 `06_management/MODEL_ISSUE_REPORT.md`，列出恢复方案并暂停。

7. **验证分析**
   - 做鲁棒性、灵敏度、误差分析或场景分析。
   - 所有关键结果必须能追溯到代码或结果文件。
   - 阶段结束暂停。

8. **论文整理**
   - 持续完善 `04_paper/paper_draft.md`。
   - 数字结论必须标注来源路径或写“待生成”。
   - 形成正式论文源码或提交稿。

9. **支撑材料**
   - 整理代码、必要数据、结果表、图和运行说明。
   - 最终提交前必须由你确认。

## 比赛开始后的模板处理流程

1. 先查官方题包、官网通知和论文规范中是否有 Word、LaTeX 或其他格式模板。
2. 若有官方模板，`paper_draft.md` 只作为内容母稿，最终稿迁移到官方模板。
3. 若没有官方模板，按电工杯论文规范排版，默认优先生成 PDF。
4. 第三方 LaTeX 模板只作为排版参考，不作为官方依据。
5. 模板选择结论记录到 `PHASE_REVIEW.md` 和 `paper_draft.md` 的“排版与模板状态”。

## 关键文档作用

| 文件 | 作用 |
|---|---|
| `AGENTS.md` | 项目级硬规则，规定 Codex 必须如何启动、暂停和维护状态。 |
| `.codex/skills/eecup-autopilot/SKILL.md` | 电工杯自动驾驶 skill，定义具体阶段、关卡和质量门槛。 |
| `06_management/PROJECT_STATE.md` | 当前项目总状态，新会话恢复时最重要。 |
| `06_management/HANDOFF.md` | 上一次完成了什么、改了什么、下一步做什么。 |
| `06_management/PHASE_REVIEW.md` | 每个大阶段结束后的审查和交接，支持清上下文后继续。 |
| `06_management/decision_log.md` | 记录关键建模选择和假设。 |
| `06_management/experiment_log.csv` | 记录实验脚本、模型、数据版本、指标和结果路径。 |
| `06_management/risk_list.md` | 记录当前风险和缓解措施。 |
| `06_management/checklists.md` | 建模前、论文冻结前、提交前检查清单。 |
| `06_management/MODEL_ISSUE_REPORT.md` | 模型效果不好时使用，列出恢复方案优劣，等待你选择。 |
| `00_problem/problem_decomposition.md` | 题意拆解表，记录输入、输出、约束、指标、单位、误读点和需确认问题。 |
| `00_problem/research_notes.md` | 公开资料、规则、工程背景和参考方法调研记录。 |
| `00_problem/model_options.md` | 模型候选方案对比表，主模型实现前必须先让你选。 |
| `04_paper/paper_draft.md` | Markdown 论文初稿，持续同步题意、模型、结果和验证。 |

## 目录作用

| 目录 | 作用 |
|---|---|
| `00_problem/` | 题面、题意拆解、调研记录、模型方案。 |
| `01_data/raw/` | 原始数据，只读保存。 |
| `01_data/processed/` | 清洗后数据和派生数据。 |
| `02_src/` | 可复现实验代码。 |
| `03_results/figures/` | 生成的图。 |
| `03_results/tables/` | 生成的表和指标。 |
| `04_paper/` | Markdown 初稿、论文源码和编译产物。 |
| `05_support/` | 支撑材料和运行说明。 |
| `06_management/` | 状态、决策、实验、风险、阶段交接。 |

## 清上下文后如何继续

新会话中只需要说：

```text
继续电工杯 A 题工作。
```

Codex 应先读取：

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

如果它没有这样做，你可以直接提醒：

```text
先按 README 和 AGENTS.md 重新加载项目状态。
```
