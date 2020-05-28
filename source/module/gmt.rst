.. index:: ! gmt

gmt
===

:官方文檔: :doc:`gmt:gmt`
:說明: GMT主程序

GMT的數據處理和繪圖功能均通過使用 **gmt** 調用相應模塊來實現，其基本語法爲：

**gmt** *module* *module-options*

其中 *module* 是GMT模塊名，\ *module-options* 是模塊所支持的選項。

除了調用模塊外，GMT還有自己的一些選項可以使用：

- **gmt --help**\ ：列出GMT提供的所有模塊名及其功能
- **gmt --new-script**\ [=\ *L*\]\ ：生成現代模式模板腳本。默認會根據當前Shell環境確定腳本語言，
  用戶也可以自行指定腳本語言 *L* （可以取 **bash**\ 、\ **csh**\ 或 **batch**\ ）
- **gmt --show-bindir**\ ：顯示GMT的bin目錄
- **gmt --show-citation**\ ：顯示GMT的參考文獻引用信息
- **gmt --show-cores**\ ：顯示當前計算機可以使用的核數
- **gmt --show-datadir**\ ：顯示GMT的數據目錄，默認爲空
- **gmt --show-dataserver**\ ：顯示GMT遠程數據服務器的網址
- **gmt --show-doi**\ ：顯示當前版本的DOI
- **gmt --show-library**\ ：顯示GMT共享庫文件的路徑
- **gmt --show-modules**\ ：列出GMT的所有模塊名
- **gmt --show-plugindir**\ ：顯示GMT的插件目錄
- **gmt --show-sharedir**\ ：顯示GMT的share目錄
- **gmt --version**\ ：顯示GMT版本
- **gmt** *module* **=**\ ：檢測模塊 *module* 是否存在，若存在則返回0，否則返回非零值

示例
----

使用 **gmt --new-script** 會根據用戶當前使用的SHELL環境生成對應的模板腳本。例如，
在Bash環境下可以使用如下命令生成模板腳本::

    gmt --new-script > plot.sh

在Windows DOS下默認會生成 batch腳本。可以直接指定要生成某種腳本語言的模板::

    gmt --new-script=bash > plot.sh
