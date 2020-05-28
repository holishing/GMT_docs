.. index:: ! kml2gmt
.. include:: common_SYN_OPTs.rst_

kml2gmt
=======

:官方文檔: :doc:`gmt:kml2gmt`
:簡介: 將Google Earth的KML文件轉換爲GMT表數據

**kml2gmt** 模塊讀取 Google Earth KML 文件，並輸出GMT可識別的表數據。
僅支持包含點、線或多邊形的KML文件。

.. note::

   KMZ 文件本質上是一個 ZIP 壓縮包，其中包含了一個 KML 文件以及若干個輔助文件。
   可以將 KMZ 文件解壓得到 KML 文件，再使用該模塊進行轉換。

語法
----

**gmt kml2gmt** [ *kmlfiles* ]
[ |-E| ]
[ |-F|\ **s**\|\ **l**\|\ **p** ]
[ |SYN_OPT-V| ]
[ |-Z| ]
[ |SYN_OPT-bo| ]
[ |SYN_OPT-do| ]
[ |SYN_OPT-:| ]
[ |SYN_OPT--| ]

必選選項
--------

*kmlfiles*
    要轉換的KML文件

可選選項
--------

.. _-E:

**-E**
    從 *ExtendData* 屬性中獲取高程信息，且忽略 *z* 座標。

    KML提供了多種機制來通過 *ExtendData* 儲存信息，但GMT只是想了
    *<SimpleData name="string">* 一種。該選項會自動啓動 **-Z** 選項。

.. _-F:

**-F**\ **s**\|\ **l**\|\ **p**
    指定要輸出的數據類型。默認會輸出KML中包含的所有點、線或多邊形

    - **-Fs** 只輸出點
    - **-Fl** 只輸出線
    - **-Fp** 只輸出多邊形

.. _-Z:

**-Z**
    默認只輸出經緯度信息，若使用該選項，則輸出座標的高程信息作爲GMT的Z值

.. include:: explain_-V.rst_

.. include:: explain_-bo.rst_

.. include:: explain_-do.rst_

.. include:: explain_colon.rst_

.. include:: explain_help.rst_

示例
----

從 KML 文件中提取所有經緯度信息::

    gmt kml2gmt google.kml -V > google.txt

從一個KML文件中分別提取點和多邊形到不同的文件::

    gmt kml2gmt google.kml -Fp -V > polygons.txt
    gmt kml2gmt google.kml -Fs -V > points.txt

也可直接用GDAL提供的命令 **ogr2ogr** 實現轉換::

    ogr2ogr -f "GMT" somefile.gmt somefile.kml

相關模塊
--------

:doc:`gmt:supplements/img/img2google`,
:doc:`psconvert`,
:doc:`gmt2kml`,
:doc:`gmtspatial`
