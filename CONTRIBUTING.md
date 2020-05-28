# 貢獻指南

歡迎GMT中文用戶參與到GMT中文手冊的維護與更新中。

## 維護與更新

手冊的維護主要包括幾個方面：

- 修正錯別字、語句不通等
- 修正文件中的錯誤或不清晰的描述
- 修正reST文件語法錯誤導致的顯示問題
- 調整章節結構，使得文件條理更清晰
- 翻譯整理更多模塊的文件
- 增加示例與入門教程

可以通過如下幾種方式參與文件的維護：

1. 通過 GitHub 修改文件源碼並提交 Pull Request
2. 在 GitHub 上提交 Issue
3. 在網頁底部評論區留言
4. 發送相關建議或投稿至 `admin@gmt-china.org`

## 構建文件

本文件使用 [Sphinx](http://www.sphinx-doc.org/) 構建得到。Sphinx 是基於 Python 的
文件生成工具。如果想要在本地構建文件，則需要安裝 Sphinx，否則可以跳過這一節。

1.  下載並安裝 Python 3.7 版本的[Anaconda](https://www.anaconda.com/distribution/#download-section)

    Linux用戶執行如下命令以安裝:

        bash ./Anaconda3-2019.10-Linux-x86_64.sh

2.  下載文件源碼

        git clone https://github.com/gmt-china/GMT_docs.git

3.  安裝文件所需依賴

        cd GMT_docs/
        pip install -r requirements.txt

4.  編譯生成HTML格式的文件

        make html

    生成的文件位於 `build/html/` 目錄下。

    - Linux 用戶可以執行 `firefox build/html/index.html` 查看網頁
    - macOS 用戶可以執行 `open build/html/index.html` 查看網頁

5.  安裝 TeXLive

    如果想要生成PDF格式的文件，則需要安裝TeXLive。

    - Linux 用戶可以參考 http://blog.seisman.info/texlive-install
    - macOS 用戶可以直接執行 `brew cask install mactex-no-gui` 安裝 mactex

6.  編譯生成PDF版文件

        make latexpdf

    生成的的PDF位於 `build/latex/GMT_docs.pdf`

## 分支模型

項目中存在如下長期分支：

- `master`: 主分支，對應GMT6最新版本的文件，所有繪圖命令均使用現代模式
- `5.4`: 對應GMT5版本的文件，所有繪圖命令均使用經典模式 (該分支已不再維護)
- `gh-pages`: 用戶存放網頁的分支，自動更新，無需人工修改

其它分支均屬於短期分支，在合併到 `master` 或 `5.4` 分支後會刪除。

## 文件風格

### 新增章節

每個源文件都會被轉換成一個單獨的網頁。因而，確定文件名時應慎重，一旦確定，儘量不要再改動。
由於Windows不區分文件名大小寫，故而 option-B.rst 和 option-b.rst 在Windows下會出現衝突。

### 新增示例

示例腳本儘量使用Bash。除非必須，請勿使用Perl、Python等。
如果可能，圖片儘量扁平（比如橫縱比爲2:1），以避免插入圖片後左右兩邊有太多空白。

文件使用 Sphinx 擴展 [sphinx_gmt](https://github.com/GenericMappingTools/sphinx_gmt)
自動執行腳本生成圖片並將圖片插入到文件中，其用法有兩種：行內模式和腳本模式。

行內模式，即直接在文件中寫繪圖代碼:

```
.. gmtplot::
    :caption: 圖片標題
    :width: 80%

    gmt begin map png,pdf
    gmt basemap -JX10c/10c -R0/10/0/10 -Baf
    gmt end show
```

腳本模式，即將繪圖代碼寫在腳本中：

```
.. gmtplot:: /scripts/psmeca_ex1.sh
    :width: 80%

    圖片標題
```

`gmtplot` 指令有很多選項，常用的包括：

- `show-code`: `true` 或 `false` 表示是否顯示代碼
- `width`: 圖片在網頁中的寬度，建議使用百分比表示，比如 `100%`

注意事項：

- `master` 分支中所有腳本均使用現代模式
- 所有腳本至少需要生成PNG格式的圖片，建議使用 `png,pdf` 生成兩種格式的圖片
- 所有腳本以 `gmt end show` 結尾
