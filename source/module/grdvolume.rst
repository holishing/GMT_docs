.. index:: ! grdvolume
.. include:: common_SYN_OPTs.rst_

grdvolume
=========

:官方文檔: :doc:`gmt:grdvolume`
:簡介: 計算網格數據中某個等值線所包圍的表面積和體積

**grdvolume** 模塊讀取一個2D網格文件，通過指定某條等值線確定一個Z值平面，並計算由該等值線
約束的區域網格表面積、網格表面到該平面所包圍的體積，以及最大平均高度（體積/面積）。
也可以指定一系列等值線，此時該模塊會分別計算每個等值線範圍內的表面積和體積。

語法
----

**gmt grdvolume** *grdfile*
[ |-C|\ *cval* or |-C|\ *low/high/delta* or |-C|\ **r**\ *low/high* or |-C|\ **r**\ *cval*]
[ |-L|\ *base* ]
[ |SYN_OPT-R| ]
[ |-S|\ [*unit*] ]
[ |-T|\ [**c**\|\ **h**] ]
[ |SYN_OPT-V| ]
[ |-Z|\ *fact*\ [/*shift*] ]
[ |SYN_OPT-f| ]
[ |SYN_OPT-o| ]
[ |SYN_OPT--| ]


必選選項
--------

*grdfile*
    輸入的2D網格文件名

可選選項
--------

.. _-C:

**-C**\ *cval* or **-C**\ *low/high/delta* or **-Cr**\ *low/high* or **-Cr**\ *cval*
    指定等值線（Z值平面）以計算由該等值線所包含的表面積、體積以及平均高度（體積/面積）。
    若不使用該選項，則返回整個網格文件的表面積、體積和平均高度。

    該選項有四種不同的語法：

    - **-C**\ *cval* 指定單個等值線並計算等值線內的區域面積、體積和平均高度
    - **-C**\ *low/high/delta* 指定多條等距等值線並計算每個等值線所包含的區域面積、體積和平均高度
    - **-Cr**\ *low/high* 計算兩個Z值平面之間的體積
    - **-Cr**\ *cval* 計算  *cval* 到網格最小值範圍內的體積

.. _-L:

**-L**\ *base*
    計算體積時加上從 z=\ *base* 到等值線的體積

.. _-S:

**-S**\ [*unit*]
    對於地理網格，默認會將弧度轉換爲 “Flat Earth” 下的距離，默認單位爲米，
    使用該選項指定其它長度單位，則輸出的表面積單位爲 *unit*\ ^2，
    輸出的體積單位則是 *unit*\ ^2 \* z_unit\ 。

.. _-T:

**-T**\ [**c**\|\ **h**]
    找到最大平均高度所對應的等值線

    - **-Th** 找到最大平均高度（體積/面積）所對應的等值線
    - **-Tc** 找到最大麴率（高度vs等值線值）所對應的等值線

.. include:: explain_-R.rst_

.. include:: explain_-V.rst_

.. _-Z:

**-Z**\ *fact*\ [/*shift*]
    將數據減去 *shift* 再乘以比例因子 *fact*

.. include:: explain_-f.rst_

.. include:: explain_-ocols.rst_

.. include:: explain_help.rst_

示例
----

計算夏威夷島中所有陸地部分（高於0等值線）部分的面積（km^2）、體積（km^3）
和平均高度（km）::

    gmt grdvolume @earth_relief_05m -R190/210/15/25 -C0 -Sk -Z0.001

計算網格表面與等值線Z=250m之間的體積::

    gmt grdvolume peaks.nc -Se -C250

在等值線100到300範圍內，以10爲間隔，計算所有等值線所約束的表面積和體積::

    gmt grdvolume peaks.nc -Sk -C100/300/10 > results.d

在等值線100到300範圍內，以10爲間隔，搜索最大平均高度（即體積與表面積的比）所對應的等值線值::

    gmt grdvolume peaks.nc -Sk -C100/300/10 -Th > results.d

計算湖內從表面到300米深度範圍內水的體積::

    gmt grdvolume lake.nc -Cr-300/0

參考文獻
--------

Wessel, P., 1998, An empirical method for optimal robust regional-residual
separation of geophysical data, *Math. Geol.*, **30**\ (4), 391-408.

相關模塊
--------

:doc:`grdfilter`,
:doc:`grdmask`,
:doc:`grdmath`
