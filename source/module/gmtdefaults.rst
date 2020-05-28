.. index:: ! gmtdefaults
.. include:: common_SYN_OPTs.rst_

gmtdefaults
===========

:官方文檔: :doc:`gmt:gmtdefaults`
:簡介: 列出所有GMT配置參數的當前值或系統默認值

語法
----

**gmt defaults** [ |-D|\ [**u**\|\ **s**] ]

必選選項
--------

無

可選選項
--------

.. _-D:

**-D**\ [**u**\|\ **s**]
    打印系統默認參數值。若不使用該選項，則打印參數當前值

    #. **-D**\ ：列出GMT系統默認參數值
    #. **-Du**\ ：列出GMT的US單位制下的默認參數值
    #. **-Ds**\ ：列出GMT的SI單位制下的默認參數值

.. include:: explain_help.rst_

示例
----

在當前目錄生成一份 GMT 系統默認配置::

    gmt defaults -D > gmt.conf

搜索與 LABEL 有關的參數的值::

    gmt defaults -D | grep LABEL

相關模塊
--------

:doc:`gmtget`,
:doc:`gmtset`
