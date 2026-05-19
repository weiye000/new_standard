# 项目状态

## 当前目标
使用项目级 `AGENTS.md` 和本地 `eecup-autopilot` skill，准备并运行近乎全自动的电工杯 A 题流程。

## 官方文件
- 题面：待提供，请放入 `00_problem/`
- 原始数据：待提供，请放入 `01_data/raw/`

## 题意拆解
待完成。

## 当前最佳模型
待完成。

## 关键结果
自动驾驶基础设施已安装：
- `AGENTS.md`
- `.codex/skills/eecup-autopilot/SKILL.md`
- `06_management/` 下的项目管理模板
- 从 `00_problem/` 到 `05_support/` 的竞赛工作目录
- 三类关卡：题意调研与模型方案选择、模型效果异常暂停、大阶段结束暂停
- 论文模板检查关卡：官方模板优先；无官方模板时按论文规范排版；第三方 LaTeX 模板仅参考
- 读题行为规范：`references/problem-reading.md`
- Markdown 论文同步初稿：`04_paper/paper_draft.md`
- Git 保存纪律和多模型分支试验规则已写入 `AGENTS.md` 与 `eecup-autopilot` skill：重要进度本地提交，不主动考虑远程推送，多模型路线用独立分支试验并统一比较。

## 未解决风险
- 官方题面和数据尚未加载。
- 当前 skill 是项目本地 skill。后续 Codex 会通过 `AGENTS.md` 使用它；如需全局发现，可另行复制到 Codex skills 目录。

## 下一步三个动作
1. 读取官方 A 题题面。
2. 检查题包、官网和论文规范是否提供官方模板，并记录排版路线。
3. 按 `problem-reading.md` 创建 `00_problem/problem_decomposition.md`，同步更新 `04_paper/paper_draft.md`。

## 重要路径
- `00_problem/`
- `01_data/raw/`
- `02_src/`
- `03_results/`
- `04_paper/`
- `06_management/`
- `00_problem/research_notes.md`
- `00_problem/model_options.md`
- `04_paper/paper_draft.md`
- `06_management/PHASE_REVIEW.md`
- `06_management/MODEL_ISSUE_REPORT.md`

