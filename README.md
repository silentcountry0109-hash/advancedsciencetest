# 國中理化資優鑑測題型練習 ‧ 教用詳解

**尤瑞卡科學 出品 | 典陸教育集團**

收錄 6 冊共 18 章國中理化資優鑑測題型完整教用 PDF,提供線上瀏覽。

## 內容

| 冊次 | 年級 | 章節數 |
|------|------|--------|
| 第三冊 | 8 上 | 6 章 |
| 第四冊 | 8 下 | 6 章 |
| 第五冊 | 9 上 | 4 章 |
| 第六冊 | 9 下 | 2 章 |

## 部署 (GitHub Pages)

```bash
# 1. 在 GitHub 新建 repo (例: yureka-physics-teacher)
# 2. 在本資料夾初始化 git
cd website-repo
git init
git add .
git commit -m "init: 國中理化資優鑑測題型練習 教用詳解網站"
git branch -M main
git remote add origin https://github.com/<your-username>/<repo>.git
git push -u origin main

# 3. 進入 repo Settings > Pages
#    Branch: main / (root) > Save
# 4. 約 1-2 分鐘後即可從 https://<username>.github.io/<repo>/ 存取
```

## 檔案結構

```
website-repo/
├── index.html        # 主頁(sidebar + 圖片內嵌)
├── pages/            # 各章節 JPG 頁面(每頁約 200-300 KB)
├── pdfs/             # 原始教用 PDF (備份保留)
└── README.md
```

## 技術細節

- 純 HTML/CSS/JS,無建構步驟、無依賴
- **PDF 已預先轉成 150 DPI JPG 頁面圖**,以 `<img>` 直接內嵌——不使用 PDF 檢視器,行動裝置體驗與桌機一致
- 圖片以 `loading="lazy"` 延遲載入,首屏快
- 手機版:漢堡選單收合 sidebar、響應式版面、`100dvh` 動態視窗高度、iOS safe-area 支援
- localStorage 記住最後檢閱章節
- 字型: Noto Serif TC + Noto Sans TC (Google Fonts CDN)
- 響應式斷點: ≥880px 雙欄、<880px sidebar 收合、<480px 進一步壓縮 brand
- 重新生成頁面圖: `pdftoppm -r 150 -jpeg -jpegopt quality=85 <pdf> <out>/page`

---
© 尤瑞卡科學 ‧ 典陸教育集團
