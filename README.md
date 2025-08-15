## 提交规范与代码检查

为了保证项目整洁和可维护性，每次提交请遵循以下规范：

### 1. 提交消息格式


类型说明：

| 类型      | 说明 |
|-----------|------|
| feat      | 新功能 |
| fix       | 修复 bug |
| docs      | 文档修改 |
| style     | 格式修改（不影响逻辑，例如缩进、空格） |
| refactor  | 代码重构 |
| test      | 添加/修改测试 |
| chore     | 构建/工具/依赖相关修改 |

示例：

```bash
git add python/automation/data_cleaner.py
git commit -m "feat(automation): 添加数据清理脚本"
git commit -m "fix(shell/backup): 修复备份脚本路径错误"
git commit -m "docs: 更新 README.md 提交规范"


2. Python 代码检查

使用 ruff 工具进行 Python 代码检查和格式规范：

安装：

pip install ruff


检查整个项目：

ruff check python/


自动修复可修复的问题：

ruff check python/ --fix

ruff 会检查：

PEP8 风格

未使用的导入或变量

语法错误、潜在 bug

格式问题（缩进、空格等）

⚡ 作用类似 flake8 + isort + black 的组合，速度快且轻量级。