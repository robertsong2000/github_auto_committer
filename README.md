# GitHub 自动提交工具

这是一个用于自动化本地目录首次提交并推送到 GitHub 的脚本。

## 工程简介

本工程旨在简化将本地项目首次上传到 GitHub 的流程。通过一条命令，自动完成远程仓库创建、本地仓库初始化、首次提交及推送，适合需要频繁新建仓库或批量上传项目的开发者。

## 主要文件说明

- `create_repo.sh`：主脚本，自动化整个流程。
- `config.ini.example`：GitHub 配置示例文件，需复制为 `config.ini` 并填写个人信息。
- `config.ini`：实际配置文件（**请勿提交到仓库**）。
- `.gitignore`：忽略配置文件和常见临时文件。
- `README.md`：项目说明文档。

## 工作流程

1. **准备配置**  
   复制 `config.ini.example` 为 `config.ini`，填写 GitHub 用户名和 Token。

2. **执行脚本**  
   运行 `create_repo.sh <本地目录路径> <GitHub仓库名>`，脚本将自动：
   - 检查参数和目录
   - 读取配置
   - 通过 GitHub API 创建远程仓库
   - 初始化本地 Git 仓库
   - 添加所有文件并首次提交
   - 配置远程仓库并推送到 `main` 分支

3. **完成**  
   本地项目已上传至 GitHub，新仓库地址会在终端输出。

## 适用场景

- 快速将本地项目首次上传到 GitHub
- 批量自动化初始化多个仓库
- 教学、脚本化 DevOps 流程

## 功能

- 检查本地目录是否存在
- 通过 GitHub API 创建新的远程仓库
- 初始化本地 Git 仓库
- 添加所有文件并创建首次提交
- 配置远程仓库并推送到 GitHub 的 `main` 分支

## 使用方法

### 1. 配置 GitHub 凭据

首先，你需要创建一个 `config.ini` 文件来存储你的 GitHub 用户名和个人访问令牌（Personal Access Token）。

复制 `config.ini.example` 文件并重命名为 `config.ini`：

```bash
cp config.ini.example config.ini
```

然后编辑 `config.ini` 文件，填入你的 GitHub 用户名和令牌：

```ini
# GitHub配置
GITHUB_USERNAME=你的GitHub用户名
GITHUB_TOKEN=你的GitHub令牌
```

**注意：** `config.ini` 文件已被 `.gitignore` 排除，不会被提交到 Git 仓库，以保护你的敏感信息。

### 2. 运行脚本

确保 `create_repo.sh` 脚本具有执行权限：

```bash
chmod +x create_repo.sh
```

然后运行脚本，提供本地目录路径和 GitHub 仓库名作为参数：

```bash
./create_repo.sh <本地目录路径> <GitHub仓库名>
```

**示例：**

```bash
./create_repo.sh /Users/youruser/my_project my-new-github-repo
```

脚本将自动完成仓库的创建、初始化和首次推送。

## 错误处理

脚本包含了基本的错误处理，例如：

- 参数数量检查
- 本地目录是否存在检查
- 配置文件是否存在及凭据是否配置检查
- GitHub 仓库创建失败检查

如果遇到问题，请根据错误信息进行排查。

## 贡献

欢迎提交 Pull Request 或报告 Bug。