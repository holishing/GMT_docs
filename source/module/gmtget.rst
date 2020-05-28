.. index:: ! gmtget
.. include:: common_SYN_OPTs.rst_

gmtget
======

:官方文件: :doc:`gmt:gmtget`
:簡介: 列出單個或多個GMT配置參數的當前值

語法
----

**gmt get**
[ |-G|\ *defaultsfile* ]
[ |-L| ]
*PARAMETER1* [ *PARAMETER2* *PARAMETER3* ... ]

必選選項
--------

*PARAMETER*
    要查看的GMT配置參數名。GMT中配置參數列表見 :doc:`/conf/index`

可選選項
--------

.. _-G:

**-G**\ *defaultsfile*
    讀取指定的GMT配置文件

    默認情況下，該模塊會依次在如下目錄中尋找配置文件 **gmt.conf** 直到找到位置：

    - 當前目錄
    - 家目錄
    - ``~/.gmt`` 目錄
    - ``~/.gmt/server`` 目錄
    - ``~/.gmt/cache`` 目錄
    - 系統默認配置

.. _-L:

**-L**
    輸出時一行只輸出一個返回值

    一次指定多個參數名時，默認會將所有返回值輸出在一行，各值之間以空格分隔。
    該選項會一行只輸出一個返回值。

示例
----

列出一個參數的當前值::

    $ gmt get MAP_FRAME_TYPE
    fancy

列出多個參數的當前值::

    $ gmt get MAP_GRID_CROSS_SIZE_PRIMARY MAP_GRID_CROSS_SIZE_SECONDARY
    24p,Helvetica,black 16p,Helvetica,black

使用 **-L** 選項一行顯示一個參數值::

    $ gmt get FONT_TITLE FONT_LABEL MAP_FRAME_TYPE -L
    24p,Helvetica,black
    16p,Helvetica,black
    fancy

相關模塊
--------

:doc:`gmt.conf`,
:doc:`gmtdefaults`,
:doc:`gmtset`

