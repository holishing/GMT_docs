.. index:: !grdclip
.. include:: common_SYN_OPTs.rst_

grdclip
========

:官方文件: :doc:`gmt:grdclip`
:簡介: 根據網格檔的Z值對網格進行裁剪

語法
----

**gmt grdclip** *ingrid*
|-G|\ *outgrid*
[ |SYN_OPT-R| ]
[ |-S|\ **a**\ *high/above* ]
[ |-S|\ **b**\ *low/below* ]
[ |-S|\ **i**\ *low/high/between* ]
[ |-S|\ **r**\ *old/new* ]
[ |SYN_OPT-V| ]
[ |SYN_OPT--| ]

必須選項
--------

*ingrid*
    輸入網格檔名

.. _-G:

**-G**\ *outgrid*
    輸出網格檔名

可選選項
--------

.. include:: explain_-R.rst_
..

    指定要截取的網格區域。若該選項指定的範圍超過了網格檔的邊界，則僅提取二者
    公共的區域。

.. _-S:

**-Sa**\ *high/above*
    將所有大於 *high* 的值設置爲 *above*

**-Sb**\ *low/below*
    將所有小於 *low* 的值設置爲 *below*

**-Si**\ *low/high/between*
    將所有在 *low* 和 *high* 範圍內的值設置爲 *between*\ 。該選項可多次使用

**-Sr**\ *old/new*
    將所有等於 *old* 的值設置爲 *new*\ 。該選項可以多次使用

.. include:: explain_-V.rst_

.. include:: explain_help.rst_

示例
----

將所有大於0的值設置爲NaN，並將小於0的值設置爲0::

    gmt grdclip @AFR.nc -Gnew_AFR.nc -Sa0/NaN -Sb0/0 -V

將所有25到30範圍內的值設置爲99，35到39範圍內的值設置爲55，將17換成11，將所有
小於10的值設置爲0::

    gmt grdclip classes.nc -Gnew_classes.nc -Si25/30/99 -Si35/39/55 -Sr17/11 -Sb10/0 -V

相關模塊
--------

:doc:`grdfill`,
:doc:`grdlandmask`,
:doc:`grdmask`,
:doc:`grdmath`,
:doc:`grd2xyz`,
:doc:`xyz2grd`
