///|
test {
  let url = "https://github.com/xxxxxx/xxxxxx.git"
  let token = "ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxx" // ⚠️ 替换为实际 Token
  let repo_dir = "repo"

  // 克隆
  println("🚀 Cloning repo...")
  let repo = git_clone(url, repo_dir)
  println("✅ Cloned")

  //日期目录
  let date_folder = "repo/2025-10-15"
  let _ = mkdir_p(date_folder)

  //写文件
  let file_path = "repo/2025-10-15/test.md"
  let content = "# Test Review\n\n- Generated from MoonBit + libgit2"
  let _ = write_file(file_path, content)
  println("✅ File written")

  // 添加 + 提交 + 推送
  let add_ok = git_add(repo, "2025-10-15/test.md")
  if add_ok == 0 {
    println("✅ Added file")
    let commit_ok = git_commit(repo, "Add new review via MoonBit")
    if commit_ok == 0 {
      println("✅ Committed")
      let push_ok = git_push(repo, "origin", token)
      if push_ok == 0 {
        println("✅ Pushed to GitHub")
      } else {
        println("❌ Push failed, code=\{push_ok}")
      }
    }
  } else {
    println("❌ Add failed")
  }
  println("✅ Repository freed")
  println("✨ Done.")
}
