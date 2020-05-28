.. index:: ! grdinfo
.. include:: common_SYN_OPTs.rst_

grdinfo
=======

:官方文檔: :doc:`gmt:grdinfo`
:簡介: 提取網格文件的基本信息

**grdinfo** 模塊讀取一個2D網格文件並報告網格文件的相關信息。能提取的信息包括：

- X、Y、Z的最大和最小值
- 最大/最小Z值所在的位置
- X、Y的網格間隔
- X和Y方向節點數目
- 均值、標準差
- 中位數、絕對中位差（median absolute deviation）
- the mode (LMS), LMS scale of *z*
- 值爲NaN的節點數
- 網格配準方式

語法
----

**gmt grdinfo** *grdfiles*
[ |-C|\ [**n**\|\ **t**\] ]
[ |-D|\ [*xoff*\ [/*yoff*]][**+i**] ]
[ |-F| ]
[ |-I|\ [*dx*\ [/*dy*]\|\ **b**\|\ **i**\|\ **r**] ]
[ |-L|\ [**0**\|\ **1**\|\ **2**\|\ **p**\|\ **a**] ]
[ |-M| ]
[ |SYN_OPT-R| ]
[ |-T|\ [*dz*]\ [**+a**\ [*alpha*]]\ [**+s**] ]
[ |SYN_OPT-V| ]
[ |SYN_OPT-f| ]
[ |SYN_OPT-h| ]
[ |SYN_OPT-o| ]
[ |SYN_OPT--| ]

必選選項
--------

*grdfile*
    一個或多個網格文件名

可選選項
--------

.. _-C:

**-C**\ [**n**\|\ **t**\]
    將輸出信息以Tab分隔顯示在一行中。輸出格式爲::

        name w e s n z0 z1 dx dy nx ny [x0 y0 x1 y1] [med scale] [mean std rms] [n_nan]

    默認只輸出前11列。方括號中的信息僅當使用 **-M**\ 、\ **-L1**\ 、\ **-L2**\ 、\ **-M**
    選項時纔會輸出。

    使用 **-Ct** 則將文件名 *name* 放在最後一列；使用 **-Cn** 則只輸出數值列。

    若與 **-I** 選項一起使用，則輸出格式爲::

        NF w e s n z0 z1

    其中 *NF* 是總網格數目。

.. _-D:

**-D**\ [*xoff*\ [/*yoff*]][**+i**]
    將網格區域劃分爲多個子區域，並報告子區域的範圍。

    子區域大小爲 *dx* 乘 *dy*\ ，由 **-I** 選項控制。
    *xoff/yoff* 用於指定多個子區域之間的重疊區域。
    **+i** 子選項表明若該子區域內無數據則忽略該區域。
    若使用 **-C** 選項則以 *w e s n* 格式輸出每個子區域的區域範圍，
    使用 **-Ct** 則在最後一列以 **-R**\ *w/e/s/n* 格式輸出子區域數據範圍。

    **-D** 選項示例::

        $ gmt grdinfo @earth_relief_30m -D -I180/90
        -R-180/0/-90/0
        -R0/180/-90/0
        -R-180/0/0/90
        -R0/180/0/90

    **-D** 與 **-C** 一起使用::

        $ gmt grdinfo @earth_relief_30m -D -I180/90 -C
        -180	0	-90	0
        0	180	-90	0
        -180	0	0	90
        0	180	0	90

.. _-F:

**-F**
    以每行輸出一個信息的方式的輸出信息。該選項不得與 **-C** 一起使用。

.. _-I:

**-I**\ [*dx*\ [/*dy*]\|\ **b**\|\ **i**\|\ **r**]
    報告網格數據的區域範圍

    使用 **-I**\ *dx*/*dy* 會先獲取網格的區域範圍，並對該範圍做微調使得其是 *dx*
    和 *dy* 的整數倍，並以 **-R**\ *w/e/s/n* 的形式輸出。

    - **-Ir** 以 **-R**\ *w/e/s/n* 輸出真實的網格區域範圍
    - **-Ii** 以 **-R**\ *w/e/s/n* 輸出 **img** 補充包生成的網格文件的精確範圍
    - **-Ib** 輸出區域範圍對應的四個頂點的座標
    - **-I** 不加任何選項以 **-I**\ *xinc*\ [/*yinc*] 形式輸出網格間隔

    **-I** 選項示例::

        $ gmt grdinfo @earth_relief_30m -I
        -I30m

        $ gmt grdinfo @earth_relief_30m -Ir
        -R-180/180/-90/90

        $ gmt grdinfo @earth_relief_30m -Ib
        -180	-90
        180	-90
        180	90
        -180	90
        -180	-90

.. _-L:

**-L**\ [**0**\|\ **1**\|\ **2**\|\ **p**\|\ **a**]
    報告Z值的其他信息。該選項可多次使用。

    - **-L0**\ : 掃描整個數據並報告Z值的範圍，而不僅僅只是從網格的頭段中讀取Z值範圍
    - **-L1**\ : 輸出中位數以及L1 scale （L1 scale= 1.4826\*Median Absolute Deviation）
    - **-L2**\ : 輸出均值、標準差以及均方根
    - **-Lp**\ : 輸出 mode (Least Median of Squares; LMS) 和 LMS scale
    - **-La**\ : 輸出以上全部信息

    注意，對於像素配準的地理網格數據而言，每個節點代表的區域面積隨着緯度的增加
    而減小，此時GMT報告的是網格文件在球面平均下的統計值。

.. _-M:

**-M**
    尋找並報告Z值最小和最大值所對應的座標，以及值爲NaN的網格點的數目

.. _-R:

**-R**\ *w/e/s/n*
    從網格文件中取出一個子區域，並報告該子區域的信息。
    若指定的區域範圍超過了網格邊界，則只提取公共區域內的爲網格信息。

.. _-T:

**-T**\ [*dz*]\ [**+a**\ [*alpha*]]\ [**+s**]
    以 **-T**\ *zmin/zmax* 或 **-T**\ *zmin/zmax/dz* 的格式輸出Z值範圍

    若只使用 **-T** 選項，則以 **-T**\ *zmin/zmax* 格式輸出Z值範圍；
    若使用 *dz* 則先提取Z的最小最大值，並做微調使得最值是 *dz* 的整數倍，並
    以 **-T**\ *zmin/zmax/dz* 格式輸出。

    其它子選項：

    - **+a**\ *alpha* 對網格文件中的值進行排序，並去除極值兩端的部分數據。\ *alpha*
      爲要去除的數據的百分比，默認值爲 2。即去除數據 0.5*\ *alpha* 和
      100 - 0.5*\ *alpha* 的數據，並據此修改Z值範圍。
    - **+s** 根據Z值的絕對最大值，輸出一個關於0對稱的範圍

    示例::

        $ gmt grdinfo @earth_relief_30m -T
        -T-9458/5888

        $ gmt grdinfo @earth_relief_30m -T100
        -T-9500/5900/100

        $ gmt grdinfo @earth_relief_30m -T100+s
        -T-9500/9500/100

.. include:: explain_-V.rst_

.. include:: explain_-f.rst_

.. include:: explain_-h.rst_

.. include:: explain_-ocols.rst_

.. include:: explain_help.rst_

示例
----

::

    $ gmt grdinfo @earth_relief_30m.grd
    earth_relief_30m.grd: Title: Earth Relief at 30 arc minutes
    earth_relief_30m.grd: Command: grdfilter SRTM15+V2.nc -Fg55.6 -D1 -I30m -rg -Gearth_relief_30m.grd=ns --IO_NC4_DEFLATION_LEVEL=9 --PROJ_ELLIPSOID=Sphere
    earth_relief_30m.grd: Remark: Obtained by Gaussian Cartesian filtering (55.6 km fullwidth) from SRTM15+V2.nc [Tozer et al., 2019; http://dx.doi.org/10.1029/2019EA000658]
    earth_relief_30m.grd: Gridline node registration used [Geographic grid]
    earth_relief_30m.grd: Grid file format: ns = GMT netCDF format (16-bit integer), CF-1.7
    earth_relief_30m.grd: x_min: -180 x_max: 180 x_inc: 0.5 (30 min) name: longitude n_columns: 721
    earth_relief_30m.grd: y_min: -90 y_max: 90 y_inc: 0.5 (30 min) name: latitude n_rows: 361
    earth_relief_30m.grd: z_min: -9458 z_max: 5888 name: elevation (m)
    earth_relief_30m.grd: scale_factor: 1 add_offset: 0
    earth_relief_30m.grd: format: netCDF-4 chunk_size: 145,181 shuffle: on deflation_level: 9

從輸出中可以看到很多信息：

- 網格文件中的標題信息；
- 生成該網格文件的命令；
- 網格文件的配準方式，此處爲Gridline配準；
- 數據格式爲 **ns** 即16位整型；
- 數據中X維度的最小值x_min、最大值x_max、網格間隔x_inc以及數據點數nx；
- 數據中Y維度的最小值y_min、最大值y_max、網格間隔y_inc以及數據點數ny；
- 數據中Z值的最小值z_min和最大值z_max以及其他信息；

相關模塊
--------

:doc:`grd2cpt`,
:doc:`grd2xyz`,
:doc:`grdedit`
