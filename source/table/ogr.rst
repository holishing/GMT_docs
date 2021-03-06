兼容OGR的GMT矢量數據格式
========================

簡介
----

地理空間數據有多種格式，按照類型劃分，可以大致分爲光柵型（raster）和矢量型（vector）。

- 光柵型數據格式不完整列表：http://www.gdal.org/formats_list.html
- 矢量型數據格式不完整列表：http://www.gdal.org/ogr_formats.html

簡單的說，在GMT中，netCDF格式的網格檔屬於光柵型地理空間數據，而一般的表數據則
屬於矢量型地理空間數據。

`GDAL <http://www.gdal.org/>`_ 是一個可以實現多種光柵型或矢量型地理空間數據
格式間互相轉換的庫/工具，其全稱爲Geospatial Data Abstraction Library。
歷史上，GDAL僅用於處理光柵型數據格式，而OGR則僅用於處理矢量型數據格式。
從GDAL 2.0開始，二者相互集成在一起，即GDAL已經具備了處理光柵型和矢量型
地理空間數據格式的能力。本文中，提到OGR時，僅表示地理空間矢量數據格式。

一個矢量數據中，不僅僅有地理空間數據（地理座標數據，點、線、多邊形等），
也可以有非地理空間數據（城市名等）。老版本的GMT只能處理地理空間數據，
而不能利用非地理空間數據。GMT5定義了一種兼容OGR的GMT矢量數據格式，
通常稱爲OGR/GMT格式。這種格式中包含了地理空間和非地理空間數據，
所有的非地理空間數據都以註釋的形式寫到文件中，因而GMT4也可以正常讀取
OGR/GMT格式的數據。OGR/GMT格式中包含了非空間數據，使得GMT的輸出可以
很容易地被其他GIS或繪圖軟體所使用。

OGR/GMT格式
-----------

OGR/GMT格式的一些重要性質列舉如下：

- 所有非空間數據都以註釋行的形式寫到文件中，這些註釋行在GMT4中會被直接忽略
- 非空間數據的各個字段之間用空格分隔，每個字段均以字符 ``@`` 作爲前綴，
  緊接着一個用於表徵該字段內容的字符。每個字段內部的多個字符串之間用字符 ``|`` 分隔
- 字符 ``\`` 作爲轉義字符，比如字符串內 ``\n`` 表示換行
- 文件中，非空間數據均保存在空間數據之前。因而GMT在處理地理空間數據之前，
  已經解析了非地理空間信息，這些非地理空間信息可能會影響到地理空間數據的處理
- 數據文件的第一個註釋行必須指定OGR/GMT格式的版本號，即 ``@VGMT1.0``
- 爲了兼容其他GIS格式（比如shapefiles），OGR/GMT格式中顯式包含了一個字段，
  用於指定接下來的地理空間數據是點、線還是多邊形
- 每個文件有一個頭段註釋，其中指定了當前文件所包含的地理特徵，
  以及每個特徵所對應的非地理屬性（比如區域範圍，投影方式等）
- 同一個OGR/GMT格式的文件中，所有數據段必須具有相同類型的特徵（都是點或線或多邊形）

OGR/GMT元數據
-------------

在OGR/GMT格式的文件頭部，需要包含一系列元數據信息。元數據用於描述整個文件的
共同信息，比如版本號、幾何類型、區域範圍、投影方式、非空間數據的格式等信息。

格式版本號 ``@V``
~~~~~~~~~~~~~~~~~

OGR/GMT格式的版本號用 ``@V`` 來指定。因而OGR/GMT格式的文件的第一行的內容必須是::

    # @VGMT1.0

其中 ``GMT1.0`` 是OGR/GMT格式的版本號。

幾何類型 ``@G``
~~~~~~~~~~~~~~~

``@G`` 用於指定當前數據文件的幾何類型，其後接的參數可以是：

- ``POINT``: 包含多個數據點（每個點都可以有自己的頭段記錄）
- ``MULTIPOINT``: 多點數據（所有的點共用同一個頭段記錄）
- ``LINESTRING``: 包含多個獨立的線段（即GMT中的多段數據，每條線段可以有自己的頭段記錄）
- ``MULTILINESTRING``: 多線數據（文件中的所有線段是一個特性，共用同一個頭段記錄）
- ``POLYGON``: 包含多個閉合多邊形（每個多邊形可以有自己的頭段記錄）
- ``MULTIPOLYGON``: 多個多邊形數據（所有多邊形共用同一個頭段記錄）

例如::

    # @VGMT1.0 @GPOLYGON

區域範圍 ``@R``
~~~~~~~~~~~~~~~

``@R`` 用於指定區域範圍，其格式與 ``-R`` 選項類似。例如::

    # @R150/190/-45/-54

投影信息 ``@J``
~~~~~~~~~~~~~~~

投影信息用四個可選的字符串表示，每個字符串以 ``@J`` 開頭。

- ``@Je``: 投影的EPSG代碼
- ``@Jg``: GMT中所使用的投影參數
- ``@Jp``: 投影參數的Proj.4表示
- ``@Jw``: 投影參數的OGR WKT (well known text)表示

示例::

    # @Je4326 @JgX @Jp"+proj=longlat +ellps=WGS84+datum=WGS84 +no_defs"
    # @Jw"GEOGCS[\"WGS84\",DATUM[\"WGS_1984\",SPHEROID\"WGS84\",6378137,\
    298.257223563,AUTHORITY[\"EPSG\",\"7030\"]],TOWGS84[0,0,0,0,0,0,0],
    AUTHORITY[\"EPSG\",\"6326\"]],PRIMEM[\"Greenwich\",0,\
    AUTHORITY[\"EPSG\",\"8901\"]],UNIT[\"degree\",0.01745329251994328,\
    AUTHORITY[\"EPSG\",\"9122\"]],AUTHORITY[\"EPSG\",\"4326\"]]"

聲明非空間字段 ``@N``
~~~~~~~~~~~~~~~~~~~~~

``@N`` 後接一個用於描述非空間字段名稱的字符串，各個字段名稱之間用 ``|`` 分隔。
若字段名稱中有空格，則必須用引號括起來。\ ``@N`` 必須有一個與之對應的 ``@T``\ 。
其中 ``@T`` 用於指定每個字段名稱的數據類型。可取的數據類型包括 ``string``\ 、
``interger``\ 、 ``double``\ 、 ``datetime`` 和 ``logical``\ 。

示例::

    # @VGMT1.0 @GPOLYGON @Nname|depth|id @Tstring|double|integer

表明數據文件中包含了多個多邊形，每個多邊形都可以有獨立的頭段記錄以指定非空間信息，
非空間信息有三個，分別是name、depth和id，三個字段分別是字符串、浮點型和整型。

OGR/GMT數據
-----------

元數據之後即是真正的數據，包括非空間數據和空間數據。

非空間數據
~~~~~~~~~~

非空間數據用 ``@D`` 表示，緊跟着一系列以 ``|`` 分隔的字符串，每個字段的含義以及
格式由 ``@N`` 和 ``@T`` 決定。

非空間數據所在的註釋行應放在每段數據的座標數據前。對於幾何類型爲 ``LINE``\ 、
``POLYGON``\ 、 ``MULTILINE`` 或 ``MULTIPOLYGON`` 的數據而言，每段數據之間用
特定的字符分隔，默認分隔符是 ``>``\ 。非空間數據緊跟在 ``>`` 行之後。
對於幾何類型爲 ``POINT`` 或 ``MULTIPOINT`` 的數據而言，則不需要分隔符。

``@N`` 和 ``@D`` 中的字符串中若包含空格，則必須用雙引號括起來。若字符串中本身
包含雙引號或 ``|``\ ，則需要使用轉義字符進行轉義。若兩個 ``|`` 之間爲空，則表示對應的字段爲空值。

一個點數據的頭段示例::

    # @VGMT1.0 @GPOINT @Nname|depth|id @Tstring|double|integer
    # @D"Point 1"|-34.5|1

一個多邊形數據的頭段示例::

    # @VGMT1.0 @GPOLYGON @Nname|depth|id @Tstring|double|integer
    >
    # @D"Area 1"|-34.5|1

多邊形拓撲
~~~~~~~~~~

舊版本的GMT只支持常規的多邊形，不支持一個多邊形內有個洞的情況。

GMT通過在多邊形數據前加上 ``@P`` 和 ``@H`` 來指定當前的數據段是外環還是內環，
即是真正的多邊形，還是多邊形內的洞。\ ``@H`` 必須緊跟在對應的 ``@P`` 之後。

``@H`` 所指定的洞不應該有任何 ``@D`` 值，因爲非空間數據適用於整個特性，
而 ``@H`` 所指定的多邊形只是多邊形的一部分，並不是一個新的多邊形。

示例
----

點數據示例::

    # @VGMT1.0 @GPOINT @Nname|depth|id
    # @Tstring|double|integer
    # @R178.43/178.5/-57.98/-34.5
    # @Je4326
    # @Jp"+proj=longlat +ellps=WGS84 +datum=WGS84+no_defs"
    # FEATURE_DATA
    # @D"point 1"|-34.5|1
    178.5 -45.7
    # @D"Point 2"|-57.98|2
    178.43 -46.8
    ...

線數據示例::

    # @VGMT1.0 @GLINESTRING @Nname|depth|id
    # @Tstring|double|integer
    # @R178.1/178.6/-48.7/-45.6
    # @Jp"+proj=longlat +ellps=WGS84 +datum=WGS84+no_defs"
    # FEATURE_DATA
    > -W0.25p
    # @D"Line 1"|-50|1
    178.5 -45.7
    178.6 -48.2
    178.4 -48.7
    178.1 -45.6
    > -W0.25p
    # @D"Line 2"|-57.98|$
    178.43 -46.8
    ...

多邊形數據示例::

    # @VGMT1.0 @GPOLYGON @N"Polygon name"|substrate|id @Tstring|string|integer
    # @R178.1/178.6/-48.7/-45.6
    # @Jj@Jp"+proj=longlat +ellps=WGS84 +datum=WGS84+no_defs"
    # FEATURE_DATA
    > -Gblue -W0.25p
    # @P
    # @D"Area 1"|finesand|1
    178.1 -45.6
    178.1 -48.2
    178.5 -48.2
    178.5 -45.6
    178.1 -45.6
    >
    # @H
    # First hole in the preceding perimeter, so is technically still
    # part of the same geometry, despite the preceding > character.
    # No attribute data is provided, as this is inherited.
    178.2 -45.4
    178.2 -46.5
    178.4 -46.5
    178.4 -45.4
    178.2 -45.4
    >
    # @P
    ...
