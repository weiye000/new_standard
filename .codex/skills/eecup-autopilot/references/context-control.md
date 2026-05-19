# 上下文控制

## 唯一事实来源

聊天是临时的，文件才是记忆。

`06_management/PROJECT_STATE.md` 是新会话恢复项目的精简状态。详细内容放入对应专题文件。

每次新会话至少读取：

```text
AGENTS.md
.codex/skills/eecup-autopilot/SKILL.md
06_management/PROJECT_STATE.md
06_management/HANDOFF.md
06_management/PHASE_REVIEW.md
06_management/risk_list.md
00_problem/model_options.md
04_paper/paper_draft.md
```

## 更新节奏

以下情况必须更新状态：

- 读取官方题面后；
- 完成题意拆解后；
- 创建或修改模型后；
- 生成表格或图后；
- 起草或修改论文段落后；
- 发现重大风险后；
- 结束一个工作块前。
- 每个大阶段暂停前。

## 交接格式

`HANDOFF.md` 必须包含：

- 上一个已完成动作；
- 当前最佳模型或结果；
- 修改过的文件；
- 已运行的验证；
- 未解决阻塞；
- 下一步三个安全动作。

`PHASE_REVIEW.md` 必须包含：

- 阶段名称；
- 本阶段结论；
- 修改文件；
- 验证证据；
- 尚未解决的问题；
- 需要用户选择的事项；
- 清上下文后继续所需的最小信息。

## 压缩规则

不要把原始数据、完整日志或长篇论文草稿粘贴到聊天中。保存到文件，然后摘要说明。如果文件变得很大，创建一个精简摘要文件并指向源路径。

阶段暂停后，下一轮可以清上下文，只要上述启动必读文件完整即可恢复。

## 决策日志

每个非显然假设或建模选择都写入 `decision_log.md`，包括：

- 时间；
- 决策；
- 理由；
- 考虑过的替代方案；
- 对结果或论文的影响。
