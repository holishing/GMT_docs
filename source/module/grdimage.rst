.. index:: ! grdimage
.. include:: common_SYN_OPTs.rst_

grdimage
==========

:官方文件: :doc:`gmt:grdimage`
:簡介: 繪製網格數據

語法
----

**gmt grdimage** *grd_z* \| *img* \| *grd_r grd_g grd_b*
[ |-A|\ *out_img*\ [**=**\ *driver*] ]
[ |SYN_OPT-B| ]
[ |-C|\ *cpt* ]
[ |-D|\ [**r**] ]
[ |-E|\ [**i**\|\ *dpi*] ] |-J|\ *parameters*
[ |-G|\ *color*\ [**+b**\|\ **+f**] ]
[ |-I|\ [*intensfile*\|\ *intensity*\|\ *modifiers*] ]
[ |-M| ] [ |-N| ]
[ |-Q| ]
[ |SYN_OPT-Rz| ]
[ |SYN_OPT-U| ]
[ |SYN_OPT-V| ]
[ |SYN_OPT-X| ]
[ |SYN_OPT-Y| ]
[ |SYN_OPT-f| ]
[ |SYN_OPT-n| ]
[ |SYN_OPT-p| ]
[ |SYN_OPT-t| ]
[ |SYN_OPT--| ]

必選選項
--------

*grd_z* \| *img* \| *grd_r grd_g grd_b*
    輸入數據文件，可以是一個只包含Z數據的網格文件，或GDAL支持的圖片文件，
    或三個分別包含red、green、blue值的網格文件。

.. include:: explain_-J.rst_

可選選項
--------

.. _-A:

**-A**\ *out_img*\ [**=**\ *driver*]

``-A<out_img>[=<driver>]``
    將圖片以光柵格式保存

    默認圖片會以PostScript代碼的形式輸出，使用此選項可以以其他圖片格式保存。
    文件名中使用後綴 ``.ppm`` 則會以Portable Pixel Map格式保存。

    若GMT支持GDAL，則可以以更多的光柵格式保存。

    #. ``<out_img>`` 爲要保存的文件名
    #. ``<driver>`` 圖片格式，見GDAL的文件

.. include:: explain_-B.rst_

.. _-C:

**-C**\ [*cpt* \|\ *master*\ [**+i**\ *zinc*] \|\ *color1,color2*\ [,\ *color3*\ ,...]]
    繪製網格文件所使用的CPT。

    也可以直接使用GMT自帶的CPT文件名，此時GMT會自動根據網格文件的Z值範圍將
    自帶的CPT採樣成16級的連續CPT文件。也可以通過 ``-C<color1>,<color2>[,<color3>,..]``
    的語法構建一個線性連續CPT文件。

.. _-D:

**-D**\ [**r**]
    表明輸入的網格文件是需要通過GDAL讀取的圖片文件，見官方文件。

``-E[i|<dpi>]``
    設置投影后網格的精度，默認值爲100。

``-G[f|b]<color>``
    該選項僅當生成的圖片是黑白圖時纔可用。

    This option will instead use the image as a transparent mask and paint
    the mask (or its inverse, with **-Gb**) with the given color combination.

``-I[<intensfile>|<intensity>|<modifiers>]``
    增加光照效果

    可以通過三種方式設置光照效果:

    #. 給定一個Z值範圍爲(-1,1)的網格文件，該文件可以用 ``grdgradient`` 生成
    #. 給定一個常數作爲光照強度
    #. 不指定光照強度文件，只使用 ``-I+`` 則會自動調用 ``grdgradient``
       並使用參數 ``-A-45 -Nt1`` 計算輸入網格數據的梯度作爲光照強度文件。用戶
       可以使用 ``+a<azimuth>+n<args>`` 以自定義 grdgradient 的 -A 和 -N 選項

``-M``
    使用YIQ轉換強制將其轉換爲灰度圖。

``-N``
    對於非矩形地圖，在地圖邊界處不對圖片做裁剪。

``-Q``
    將值爲NaN的節點處設置爲透明色

.. include:: explain_-U.rst_

.. include:: explain_-t.rst_

示例
----

使用默認的光照效果::

    gmt grdimage stuff.nc -JX6i+ -I+d -pdf map
