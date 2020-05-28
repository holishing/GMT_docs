.. index:: ! docs
.. include:: common_SYN_OPTs.rst_

docs
====

:官方文檔: :doc:`gmt:docs`
:簡介: 打開指定模塊的GMT官方HTML文檔

**docs** 用系統默認瀏覽器打開指定模塊的HTML文檔。若本地存在HTML文檔，
則優先使用本地文檔；否則則打開GMT文檔網站。除了可以指定模塊外，
還支持打開一些常用的文檔頁面（下面會詳細列出）。

語法
----

**gmt docs**
[ |-Q| ]
[ |-S| ]
[ |SYN_OPT-V| ]
*module-name*
[*-option*]

必須參數
--------

*module-name*
    要查看文檔的模塊名。

    除了模塊名之外，還支持幾個特殊的頁面:

    - **gmt**: 打開GMT命令的說明文檔
    - **api**: 打開GMT API手冊
    - **colors**: 打開GMT顏色列表文檔
    - **cookbook**: 打開GMT參考手冊
    - **tutorial**: 打開GMT入門教程
    - **settings**: 打開GMT配置參數文檔
    - **gallery**: 打開GMT圖庫

可選選項
--------

.. _-Q:

**-Q**
    僅顯示文檔的網頁鏈接而不打開文檔，適用於沒有安裝圖形界面的服務器。
    若使用該選項，則其必須是 **docs** 的第一個選項。

.. _-S:

**-S**
    **docs** 默認優先打開本地文檔，若本地文檔不存在，則打開GMT文檔網站。
    該選項強制 **docs** 使用瀏覽器打開GMT文檔網站上的網頁。

**-**\ *option*
    指定選項（例如 **-R**\ ），則 **docs** 會打開模塊文檔並定位到模塊文檔的該選項處。

    注意，該功能對本地文檔無效，因而當使用該功能時GMT會默認添加 **-S** 選項以打開
    遠程文檔。

.. include:: explain_-V.rst_

.. include:: explain_help_nopar.rst_

示例
----

查看 :doc:`grdimage` 的文檔::

    gmt docs grdimage

查看 :doc:`grdimage` 的文檔鏈接::

    gmt docs -Q grdimage

查看 :doc:`grdimage` 在GMT文檔網站上的鏈接::

    gmt docs -Q -S grdimage

查看 :doc:`coast` 的 **-B** 選項::

    gmt docs coast -B

查看GMT配置參數列表::

    gmt docs settings

查看圖庫::

    gmt docs gallery

相關模塊
--------

:doc:`begin`,
:doc:`clear`,
:doc:`end`,
:doc:`figure`,
:doc:`inset`,
:doc:`subplot`,
:doc:`gmt`
