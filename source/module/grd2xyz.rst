.. index:: ! grd2xyz
.. include:: common_SYN_OPTs.rst_

grd2xyz
=======

:官方文檔: :doc:`gmt:grd2xyz`
:簡介: 將網格文件轉換成表數據

**grd2xyz** 讀取一個或多個二進制2D網格文件，並將XYZ數據以ASCII或二進制格式
寫到標準輸出中。ASCII輸出的格式由參數 :term:`FORMAT_FLOAT_OUT`
控制，也可以以單精度或雙精度浮點數的形式儲存爲二進制格式，還可以只輸出Z值而不包含
XY座標數據。

語法
----

**gmt grd2xyz** *grid*
[ |-C|\ [**f**\|\ **i**] ]
[ |SYN_OPT-R| ]
[ |SYN_OPT-V| ]
[ |-W|\ [**a**\|\ *weight*] ]
[ |-Z|\ [*flags*] ]
[ |SYN_OPT-bo| ]
[ |SYN_OPT-d| ]
[ |SYN_OPT-f| ]
[ **-ho**\ [*n*] ]
[ |SYN_OPT-o| ]
[ |SYN_OPT-s| ]
[ |SYN_OPT--| ]

必選選項
--------

*grid*
    要轉換的2D網格文件

可選選項
--------

.. _-C:

**-C**\ [**f**\|\ **i**]
    輸出的XY座標值用對應的列、行號替代

    默認輸出的三列數據是：X座標、Y座標和Z值。使用該選項，則輸出的三列數據爲：
    列號、行號和Z值。其中，行號和列號從0開始算起。使用 **-Cf** 則行號和列號從1開始算起。
    若使用 **-Ci** 會輸出兩列數據：索引值和Z值。索引值相當於是將二維數組用一維數組表示

.. include:: explain_-R.rst_
..

    使用 **-R** 選項指定只對網格數據的一個子區域進行操作。若該子區域超過網格邊界，
    則只輸出二者共同的區域

..  include:: explain_-V.rst_

.. _-W:

**-W**\ [**a**\|\ *weight*]
    輸出四列數據XYZW，其中W爲 *weight* [*weight*\ 默認值爲1]

    若使用 **-Wa** 則權重爲每個節點所佔據的面積。

.. _-Z:

**-Z**\ [*flags*]
    以 ASCII 或二進制形式輸出表數據

    使用該選項，則輸出時只有Z值，沒有XY信息。輸出Z值的順序由 *flags*
    決定。若是行優先，\ *flags* 的第一個字符可以取：

    - **T** 表示第一行是y=ymax
    - **B** 表示第一行是y=ynin

    *flags* 的第二個字符可以取：

    - **L** 表示每一行的第一個元素是x=xmin
    - **R** 表示每一行的第一個元素是x=xmax

    若是列優先，則 **L**\|\ **R** 爲第一個字符，\ **B**\|\ **T** 爲第二個字符。

    對於網格線配準的網格文件而言：

    - 若網格在X方向是週期的，輸出數據時不需要包含x=xmax所在的列，則加上 **x**
    - 若網格在Y方向是週期的，輸出數據時不需要包含y=ymax所在的行，則加上 **y**

    若數據需要做字節交換，則加上 **w**\ 。最後需要指定數據以何種數據類型保存：

    - ``a`` ASCII表，每行輸出一個Z值
    - ``c`` int8_t, signed 1-byte character
    - ``u`` uint8_t, unsigned 1-byte character
    - ``h`` int16_t, short 2-byte integer
    - ``H`` uint16_t, unsigned short 2-byte integer
    - ``i`` int32_t, 4-byte integer
    - ``I`` uint32_t, unsigned 4-byte integer
    - ``l`` int64_t, long (8-byte) integer
    - ``L`` uint64_t, unsigned long (8-byte) integer
    - ``f`` 4-byte floating point single precision
    - ``d`` 8-byte floating point double precision

    默認值爲 **-ZTLa**\ 。

.. include:: explain_-bo.rst_
..

    該選項只適用於XYZ輸出。若只輸出Z值，參考 **-Z** 選項指定只對網格數據的一個子區域進行操作。若該子區域超過網格邊界，

.. include:: explain_-d.rst_

.. include:: explain_-f.rst_

.. include:: explain_-ocols.rst_

.. include:: explain_-s.rst_

.. include:: explain_help.rst_

時間座標
--------

GMT可以識別netCDF網格文件中的時間座標。netCDF變量的 **unit** 屬性會被解析以
確定網格文件中時間座標的起算點和單位。這些時間座標值會被進一步根據
:term:`TIME_UNIT` 和 :term:`TIME_EPOCH`
轉換爲GMT內部時間值。輸出時，默認以相對時間的形式輸出，也可以使用 **-f** 選項
指定以絕對時間方式輸出。

示例
----

將一個netCDF網格文件轉換爲XYZ文件::

    gmt grd2xyz @AFR.nc > AFR.xyz

將一個netCDF文件以單精度二進制格式輸出其Z值::

    gmt grd2xyz @AFR.nc -ZTLf > AFR.b

相關模塊
--------

:doc:`grdedit`,
:doc:`grdconvert`,
:doc:`xyz2grd`
