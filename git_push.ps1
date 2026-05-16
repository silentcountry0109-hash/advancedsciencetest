# ============================================================
# 國中理化資優鑑測題型練習 教用網站 - GitHub Push 腳本
# ============================================================
# 使用方式:
#   1. 在檔案總管打開 website-repo 資料夾
#   2. Shift + 右鍵 > "在此處開啟 PowerShell 視窗"
#      (或在 PowerShell 中 cd 到此資料夾)
#   3. 執行: .\git_push.ps1
#   4. 若 PowerShell 拒絕執行,先跑:
#         Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# ============================================================

$RemoteUrl = "https://github.com/silentcountry0109-hash/advancedsciencetest.git"
$Branch    = "main"
$UserName  = "Jason"
$UserEmail = "silentcountry0109@gmail.com"

Write-Host "==> 切到 website-repo 目錄" -ForegroundColor Cyan
Set-Location $PSScriptRoot

# 清掉可能的殘留 .git 目錄
if (Test-Path .git) {
    Write-Host "==> 偵測到既有 .git,移除中..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force .git
}

Write-Host "==> git init (branch: $Branch)" -ForegroundColor Cyan
git init -b $Branch
if ($LASTEXITCODE -ne 0) { Write-Host "git init 失敗" -ForegroundColor Red; exit 1 }

git config user.name  $UserName
git config user.email $UserEmail

Write-Host "==> 設定 Git LFS 不需要 (檔案皆 <50MB)" -ForegroundColor Cyan

Write-Host "==> git add ." -ForegroundColor Cyan
git add -A

Write-Host "==> 待提交檔案數:" -ForegroundColor Cyan
(git status --short | Measure-Object).Count

Write-Host "==> git commit" -ForegroundColor Cyan
git commit -m "init: 國中理化資優鑑測題型練習 教用詳解網站

- 18 章 62 頁教用內容(JPG 內嵌)
- 響應式設計,支援桌機與手機
- 典陸 brand chrome 頁首頁尾
- 尤瑞卡科學出品"
if ($LASTEXITCODE -ne 0) { Write-Host "commit 失敗" -ForegroundColor Red; exit 1 }

Write-Host "==> 加 remote: $RemoteUrl" -ForegroundColor Cyan
git remote add origin $RemoteUrl 2>&1 | Out-Null
# 若 origin 已存在則改 URL
git remote set-url origin $RemoteUrl

Write-Host "==> git push -u origin $Branch" -ForegroundColor Cyan
Write-Host "    (若是第一次 push,瀏覽器會彈出 GitHub 登入視窗請完成授權)" -ForegroundColor DarkGray
git push -u origin $Branch
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "如果 push 失敗:" -ForegroundColor Yellow
    Write-Host "  1. 確認 GitHub 已登入 (git credential manager 應自動跳視窗)"
    Write-Host "  2. 若 remote 上已有檔案需 force push:  git push -u origin $Branch --force"
    exit 1
}

Write-Host ""
Write-Host "==> 完成!" -ForegroundColor Green
Write-Host "    啟用 GitHub Pages:"
Write-Host "    1. 前往 https://github.com/silentcountry0109-hash/advancedsciencetest/settings/pages"
Write-Host "    2. Source: Deploy from a branch"
Write-Host "    3. Branch: $Branch  /  Folder: / (root)  > Save"
Write-Host "    4. 約 1-2 分鐘後從 https://silentcountry0109-hash.github.io/advancedsciencetest/ 開啟"
