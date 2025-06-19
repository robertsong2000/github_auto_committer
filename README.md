# GitHub 自动提交工具

这是一个用于自动化本地目录首次提交并推送到 GitHub 的脚本。

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