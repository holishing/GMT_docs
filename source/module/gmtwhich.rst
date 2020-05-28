.. index:: ! gmtwhich
.. include:: common_SYN_OPTs.rst_

gmtwhich
========

:官方文檔: :doc:`gmt:gmtwhich`
:簡介: 返回指定文件的完整路徑

GMT會依次在如下目錄中去尋找命令行中指定的文件::

    當前目錄 > $GMT_USERDIR (``~/.gmt``) > $GMT_DATADIR (``~/.gmt/server``) > $GMT_CACHEDIR (``~/.gmt/cache``)

該命令會報告文件的完整路徑，使得用戶可以確認自己在使用的究竟是哪個數據文件。

語法
----

**gmt which** *files*
[ |-A| ]
[ |-C| ]
[ |-D| ]
[ |-G|\ [**c**\|\ **l**\|\ **u**] ]
[ |SYN_OPT-V| ]
[ |SYN_OPT--| ]

必選選項
--------

*files*
    任意一個或多個數據文件名

可選選項
--------

.. _-A:

**-A**
    僅考慮用戶有讀權限的文件

.. _-C:

**-C**
    不報告完整路徑，只打印 **Y** 或 **N** 以表示是否找到文件

**-D**
    不報告完整路徑，僅打印包含該文件的目錄名

.. _-G:

**-G**\ [**c**\|\ **l**\|\ **u**]
    自動下載指定的文件

    GMT可以自動下載某些文件：

    - 以鏈接形式給定的文件，會自動下載到當前目錄
    - 以 **@**\ *filename* 形式指定的文件會自動從GMT數據服務器上下載
    - ``@earth_relief_xxy`` GMT提供的全球地形起伏數據

    使用該選項，若GMT在當前目錄或本地緩存目錄中位找到文件，則會嘗試下載。

    **-Gl** 表示下載到當前目錄（默認行爲），\ **-Gu** 表示下載到用戶數據目錄，
    **-Gc** 表示下載到用戶緩存目錄

.. include:: explain_-V.rst_

.. include:: explain_help.rst_

示例
----

查看文件的路徑::

    gmt which myjunk.txt

下載並返回GMT提供的10弧分精度的全球地形起伏數據::

    gmt which -Gu @earth_relief_10m

從GMT數據服務器下載GMT示例數據。該數據會被下載到GMT緩存目錄中（默認爲 ``~/.gmt/cache``\ ）::

    gmt which -Gc @hotspots.txt
