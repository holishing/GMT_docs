Windows 下安裝 GMT
==================

GMT 提供了 Windows 下的安裝包，可以直接安裝使用。

.. warning::

    從 GMT 5.2.1 開始，GMT 提供的安裝包已經不再支持 Windows XP。

GMT 6.0.0 安裝包中不僅包含了GMT，還包含了運行GMT所需的如下軟體：

- `GDAL <https://gdal.org/>`_\ ：用於多種地學數據格式的轉換
- `FFmpeg <https://ffmpeg.org/>`_\ ：用於生成MP4格式的動畫
- `Ghostscript <https://www.ghostscript.com/>`_\ : 用於生成PDF、JPG等圖片格式

安裝GMT
-------

1.  下載 GMT 6.0.0 安裝包

    - `gmt-6.0.0-win64.exe (64位) <http://mirrors.ustc.edu.cn/gmt/bin/gmt-6.0.0-win64.exe>`__
    - `gmt-6.0.0-win32.exe (32位) <http://mirrors.ustc.edu.cn/gmt/bin/gmt-6.0.0-win32.exe>`__

2.  安裝GMT

    雙擊安裝包即可安裝。在“Choose components”頁面，建議將所有選項都勾選上。

    .. note::

       GMT安裝包中內置了Ghostscript 9.50，但其不支持中文。
       若想要GMT支持中文，則需要在安裝GMT時不選擇Ghostscript組件，
       待GMT安裝完成後再自行安裝 Ghostscript。

    .. note::

        安裝過程中可能會出現如下警告::

            Warning! Failed to add GMT to PATH. Please add the GMT bin path to PATH manually.

        出現此警告的原因是系統的環境變量 **PATH** 太長，GMT安裝包無法直接修改。
        解決辦法是，先忽略這一警告，待安裝完成後按照如下步驟手動修改系統環境變量 **PATH**\ 。

        1.  點擊“計算機”→“屬性”→“高級系統設置”→“環境變量”打開“環境變量”編輯工具
        2.  在“系統變量”部分中，選中“Path”並點擊“編輯”
        3.  在“變量值”的最後加上GMT的bin目錄的路徑，例如 ``C:\programs\gmt6\bin``\ 。
            需要注意“path”變量值中多個路徑之間用英文分號分隔

3.  測試安裝是否正確

    安裝完成後，點擊“開始”→“所有程序”→“附件”→“命令提示符”以啓動cmd。
    在cmd窗口中執行::

        C:\Users\xxxx> gmt --version
        6.0.0

    即表示安裝成功。

4.  卸載GMT

    若想要卸載GMT，可以進入GMT安裝目錄，找到並雙擊執行 ``Uninstall.exe`` 即可完成卸載。
    偶爾會遇到卸載不乾淨的情況，可以等卸載程序執行完成後再手動刪除GMT安裝目錄即可。

5.  升級GMT

    GMT目前不具備自動更新功能。如果想要升級新版本，通常需要先卸載舊版本。
    卸載完成後，再下載並安裝新版安裝包以完成升級。

安裝其它可選軟體
----------------

爲了更好地使用GMT，你還可以根據自己的需求安裝如下軟體。

1.  安裝 Git for Windows (**推薦**)

    Git for Windows 爲Windows用戶提供了Bash以及Linux下常用的多個命令。
    如果想要在Windows下運行Bash腳本，推薦安裝Git for Windows。

    下載地址: https://git-scm.com/download/win

2.  安裝 GraphicsMagick (**根據需求選擇是否安裝**)

    GMT 的 **movie** 模塊在製作 GIF 格式的動畫時需要
    使用 `GraphicsMagick <http://www.graphicsmagick.org/>`_\ 。
    如有製作GIF動畫的需求，可以下載安裝這個軟體，並將其 bin 目錄加入到系統環境
    變量 **PATH** 中，以保證 GMT 可以找到其提供的 **gm** 命令。

3.  安裝 Ghostscript (**根據是否需要中文支持決定是否安裝**)

    GMT需要使用 Ghostscript 生成PDF、JPG等格式的圖片，因而 Ghostscript 是必須的。
    GMT安裝包中自帶了Ghostscript，但是其並不支持在GMT圖片中添加中文。

    如果有在GMT圖片中添加中文的需求，則需要在安裝GMT時不安裝Ghostscript組件，
    然後自己再自行安裝 Ghostscript。安裝 Ghostscript 的過程中記得勾選
    ``Generate cidfmap for Windows CJK TrueType fonts`` 以生成中文字體配置文件。

    安裝包下載地址:

    - `gs926aw64.exe (64位) <https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs926/gs926aw64.exe>`__
    - `gs926aw32.exe (32位) <https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs926/gs926aw32.exe>`__

    .. warning::

        請注意 Ghostscript 的版本！

        由於Ghostscript的bug和兼容性問題，Windows下 GMT 6.0.0 建議與 ghostscript 9.26
        搭配使用。

4.  安裝GSview 5.0 (**不推薦**)

    GSview是一個PostScript閱讀器。GMT6默認生成PDF格式的圖片，因而無需安裝GSview。
    如果堅持想要生成並查看PS格式的圖片，則可以安裝GSview。

    - `gsv50w64.exe (64位) <http://www.ghostgum.com.au/download/gsv50w64.exe>`__
    - `gsv50w32.exe (32位) <http://www.ghostgum.com.au/download/gsv50w32.exe>`__

5.  安裝 UnixTools (**不推薦**)

    如果想要在Windows下運行Batch腳本，但同時想要使用各種Linux下的常用命令，
    則可以使用GMT中文社區整理的Unix小工具合集包 UnixTools。

    直接下載並解壓，將解壓得到的 exe 文件移動到 GMT 的 bin 目錄即可。

    下載地址: `UnixTools.zip <https://gmt-china.org/data/UnixTools.zip>`__
