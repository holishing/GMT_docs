GMT初探: Windows篇
==================

啓動CMD命令行
-------------

GMT是一個純命令行軟件，沒有任何的圖形界面。所有的繪圖操作都需要通過
在終端和腳本中執行命令來完成。Windows下的默認終端是“命令提示符”，
也就是CMD命令行。

點擊“開始”→“附件”→“命令提示符”即可啓動CMD，
也可以直接在開始按鈕中的搜索框中搜索“CMD”並啓動。

運行GMT
-------

啓動CMD後，敲入 ``gmt`` 以執行GMT命令。你將看到GMT的歡迎界面信息，類似於::

        GMT - The Generic Mapping Tools, Version 6.0.0 [64-bit] [8 cores]
        (c) 1991-2019 The GMT Team (https://www.generic-mapping-tools.org/team.html).

    Supported in part by the US National Science Foundation (http://www.nsf.gov/)
    and volunteers from around the world.

    GMT is distributed under the GNU LGP License (http://www.gnu.org/licenses/lgpl.html).

    usage: gmt [options]
        gmt <module name> [<module-options>]

    options:
    --help            List descriptions of available GMT modules.
    --new-script      Write GMT modern mode script template to stdout.
    --show-bindir     Show directory with GMT executables.
    --show-citation   Show the most recent citation for GMT.
    --show-cores      Show number of available cores.
    --show-datadir    Show directory/ies with user data.
    --show-dataserver Show URL of the remote GMT data server.
    --show-doi        Show the DOI for the current release.
    --show-modules    Show all module names.
    --show-library    Show path of the shared GMT library.
    --show-plugindir  Show directory for plug-ins.
    --show-sharedir   Show directory for shared GMT resources.
    --version         Print GMT version number.

    if <module-options> is '=' we call exit (0) if module exist and non-zero otherwise.

生成腳本模板
------------

繼續在終端中敲入::

    gmt --new-script > myplot.bat

該命令會在當前目錄生成一個GMT模板腳本，並保存到Batch腳本文件 :file:`myplot.bat` 中。

.. note::

    Batch是Windows自帶的腳本語言，但本教程中所有示例均使用Unix下常用的Bash腳本。
    因而Windows用戶有兩種選擇：

    #. 安裝 `Git for Windows <https://git-scm.com/download/win>`_ 並使用其提供的
       Bash，本手冊中的所有命令都將可以直接使用。要求讀者對Bash腳本及Unix命令行有最基本的瞭解。
       不瞭解的用戶請閱讀網絡上Bash相關教程，或本手冊中 :doc:`/tutorial/scripting` 一節。
    #. 繼續使用Windows的Batch腳本。要求讀者對Batch腳本和Bash腳本均有所瞭解，並
       知道二者用法的差異，以便於將手冊中的Bash腳本轉換爲Batch腳本。
       不瞭解的用戶請閱讀網絡上Bash和Batch相關教程，或本手冊中
       :doc:`/tutorial/scripting` 一節。

查看並編輯腳本文件
------------------

Batch腳本文件是一個純文本文件，可以直接用文本編輯器打開。例如，Windows下自帶的記事本
即可打開該腳本文件。

打開腳本文件後會看到如下內容::

    REM GMT modern mode batch template
    REM Date:    2019-09-02T23:34:25
    REM User:    seisman
    REM Purpose: Purpose of this script
    REM Set a unique session name:
    @echo off
    set GMT_SESSION_NAME=7492
    gmt begin figurename
        REM Place modern session commands here
    gmt end show

其中，以 **REM** 開頭的行尾註釋行，\ **set GMT_SESSION_NAME=7492** 這一行屬於
高級用法，可以忽略。核心內容只有兩行，即 **gmt begin** 和 **gmt end** 這兩行。

編輯腳本，在 **gmt begin** 和 **gmt end** 中間添加GMT命令，將腳本修改如下::

    REM GMT modern mode batch template
    REM Date:    2019-09-02T23:34:25
    REM User:    seisman
    REM Purpose: Purpose of this script
    REM Set a unique session name:
    @echo off
    set GMT_SESSION_NAME=7492
    gmt begin figurename
        gmt coast -Rg -JH15c -Gpurple -Baf -B+t"My First Plot"
    gmt end show

編輯完成後記得保存文件。

執行腳本以繪圖
--------------

回到CMD，直接輸入Batch腳本名以運行該腳本::

    myplot.bat

待腳本執行完成後，會自動用PDF閱讀器打開生成的PDF格式的圖片文件。
你將看到如下圖所示的圖片。

.. gmtplot::
    :width: 75%
    :show-code: false

    #!/usr/bin/env bash
    # GMT modern mode bash template
    # Date:    2019-09-10T00:44:39
    # User:    seisman
    # Purpose: Purpose of this script
    export GMT_SESSION_NAME=$$	# Set a unique session name
    gmt begin figurename png,pdf
        gmt coast -Rg -JH15c -Gpurple -Baf -B+t"My First Plot"
    gmt end

這基本上就是運行GMT腳本的基本流程，即：

- 生成腳本模板
- 編輯腳本，添加GMT繪圖命令
- 運行腳本並查看繪圖效果
