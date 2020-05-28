.. index:: ! grdsample
.. include:: common_SYN_OPTs.rst_

grdsample
=========

:官方文件: :doc:`gmt:grdsample`
:簡介: 對網格檔做重採樣

**grdsample** 模塊讀取一個網格檔，並對其做插值以生成一個新的網格檔。
新舊網格檔可能的區別在於：

- 不同的配準方式（\ **-r** 或 **-T**\ ）
- 不同的網格間隔或網格節點數（\ **-I**\ ）
- 不同的網格範圍（\ **-R**\ ）

網格檔插值方式有多重，默認使用 bicubic 插值，可以使用 **-n** 選項設置其它插值方式。
該模塊可以安全地將粗網格插值爲細網格；反之，將細網格插值爲粗網格時，則可能
存在混疊效應，因而需要在插值前使用 :doc:`grdfft` 或 :doc:`grdfilter`
對網格檔做濾波。

若省略 **-R** 選項，則輸出網格與輸入網格的區域範圍相同；若省略 **-I** 選項，
則輸出網格間距與輸入網格間距相同。\ **-r** 和 **-T** 均可用於修改網格配準方式。
若省略這兩個選項，則輸出網格的配準方式與輸入網格相同。

語法
----

**gmt grdsample** *in_grdfile* |-G|\ *out_grdfile*
[ |SYN_OPT-I| ]
[ |SYN_OPT-R| ]
[ |-T| ]
[ |SYN_OPT-V| ]
[ |SYN_OPT-f| ]
[ |SYN_OPT-n| ]
[ |SYN_OPT-r| ]
[ |SYN_OPT-x| ]
[ |SYN_OPT--| ]

必選選項
--------

*in_grdfile*
    要重採樣的2D網格檔

.. _-G:

**-G**\ *out_grdfile*

可選選項
--------

.. include:: explain_-I.rst_

.. include:: explain_-R.rst_
..

    若只使用 **-R** 選項，則等效於使用 **grdcut** 或 **grdedit -S**\ 。

.. _-T:

**-T**
    交換網格檔的配準方式。即若輸入是網格線配準，則輸出爲像素點配準；若輸入
    是像素點配準，則輸出爲網格線配準。

.. include:: explain_-V.rst_

.. include:: explain_-f.rst_

.. include:: explain_-n.rst_

.. include:: explain_nodereg.rst_

.. include:: explain_core.rst_

.. include:: explain_help.rst_

注意事項
--------

#.  網格插值過程中可能會導致插值後的值出現失真或意外值。例如，使用樣條插值可能會導致
    插值後的數據的最大最小值超過原始數據的最大最小值。若這一結果不可接受，可以通過
    給 **-n** 選項加上 **+c** 以對超過原始數據最值的部分做裁剪。
#.  若某個插值點不位於輸入數據的網格節點上，則插值時若該節點周圍的節點值爲NaN，則
    該節點的值也會被插值爲NaN。默認的bicubic插值算法會生成連續的一階導數但需要
    周圍4x4個節點。bilinear插值算法只需要周圍的2x2個節點，但其只是零階連續。
    若光滑性很重要，則使用bicubic算法；若需要儘量避免NaN值的傳播，則使用bilinear算法。
#.  除了插值之外，還可以使用 :doc:`grd2xyz` 將網格數據轉換爲表數據，然後
    將輸出交給 :doc:`surface` 或 :doc:`greenspline` 重新網格化。

示例
----

將5x5弧分的數據採樣成1x1弧分::

    gmt grdsample @earth_relief_05m -R0/20/0/20 -I1m -Gtopo_1m.nc

將網格線配準的網格檔修改爲像素配準的網格檔::

    gmt grdsample @earth_relief_05m -T -Gpixel.nc


相關模塊
--------

:doc:`grdedit`,
:doc:`grdfft`,
:doc:`grdfilter`,
:doc:`greenspline`,
:doc:`surface`
