# MoonBit Git Automation

🚀 **MoonBit + libgit2 自动化 Git 操作示例**

本项目演示如何使用 **MoonBit** 调用 **libgit2** 完成完整的 Git 工作流，包括：

- 克隆远程仓库
- 创建文件夹与写入文件
- 添加文件到索引
- 提交改动
- 推送到远程仓库（支持 GitHub Token 认证）
- 安全释放仓库指针

---

## 功能

1. `git_clone(url, workdir)`  
   克隆远程仓库到指定目录。

2. `mkdir_p(path)`  
   创建多级目录。

3. `write_file(path, content)`  
   写入文本文件。

4. `git_add(repo, filepath)`  
   添加文件到 Git 索引。

5. `git_commit(repo, message)`  
   提交改动。

6. `git_push(repo, username, token)`  
   推送到远程仓库，支持 Token 验证。

7. `git_free(repo)`  
   安全释放仓库对象。

---

## 使用示例

```moon
let url = "https://github.com/xuxubo/code-review.git"
let token = "ghp_xxxxxxx"  // ⚠️ 替换为实际 Token
let username = "xuxubo"
let repo_dir = "repo"

// 克隆仓库
let repo = git_clone(url, repo_dir)

// 创建日期目录并写入文件
let date_folder = "repo/2025-10-15"
let _ = mkdir_p(date_folder)
let file_path = "repo/2025-10-15/test.md"
let content = "# Test Review\n\n- Generated from MoonBit + libgit2"
let _ = write_file(file_path, content)

// Git 操作
let _ = git_add(repo, "2025-10-15/test.md")
let _ = git_commit(repo, "Add new review via MoonBit")
let push_res = git_push(repo, username, token)
println("Push result: \{push_res}")

// 释放仓库
git_free(repo)


# 注意事项与环境依赖

## 注意事项

- **分支**：默认推送 `main` 分支，如仓库默认分支为 `master` 请修改 `mb_git_push` 中的 refspec。
- **凭证**：仅使用 GitHub Token（无需密码）。
- **目录**：`git_clone` 目标目录必须不存在或为空，否则会报错。
- **安全释放**：务必在完成操作后调用 `git_free(repo)`，避免内存泄漏。

## 环境依赖

- MoonBit >= 0.6.x
- libgit2 >= 1.6
- GCC / Clang
