.. index:: ! clear
.. include:: common_SYN_OPTs.rst_

clear
=====

:官方文檔: :doc:`gmt:clear`
:簡介: 刪除緩存目錄、數據目錄或會話目錄，以及當前配置文件

語法
----

**gmt clear**
**all** | **cache** | **data** | **sessions** | **settings**
[ |SYN_OPT-V| ]

可選選項
--------

**all**
    刪除所有項目，包括緩存目錄（\ **~/.gmt/cache**\ ）、數據目錄（\ **~/.gmt/server**\ ）、會話目錄（\ **~/.gmt/sessions**\ ）以及當前配置文件

**cache**
    刪除GMT緩存目錄（默認爲\ **~/.gmt/cache**\ ）及其內容

**data**
    刪除GMT數據目錄（默認爲\ **~/.gmt/server**\ ）及其內容

**sessions**
    刪除GMT會話目錄（默認爲\ **~/.gmt/sessions**\ ）及其內容

**settings**
    現代模式下刪除當前會話的GMT配置參數文件（即 gmt.conf），
    使得所有參數回到GMT系統默認值。

.. include:: explain_-V.rst_

.. include:: explain_help_nopar.rst_

示例
----

清空GMT緩存目錄::

    gmt clear cache

刪除現代模式會話下的當前配置參數文件::

    gmt clear settings

相關模塊
--------

:doc:`begin`,
:doc:`docs`,
:doc:`end`,
:doc:`figure`,
:doc:`inset`,
:doc:`subplot`,
:doc:`gmt`
