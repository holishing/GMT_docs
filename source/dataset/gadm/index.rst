GADM: 全球行政區劃數據庫
========================

**GADM主頁**\ ：https://gadm.org/

GADM，全稱Database of Global Administrative Areas，是一個高精度的全球行政區劃
數據庫。其包含了全球所有國家和地區的國界、省界、市界、區界等多個級別的行政區劃邊界數據。

.. warning::

    GADM提供的中國國界數據不符合中國的領土主張，省界、市界、區界等數據也不一定
    是最新的版本。在正式刊物中發表使用此類數據的圖件時需格外謹慎。

數據下載
--------

GADM提供了兩種下載方式：

#. 下載全球所有國家和地區的所有數據 https://gadm.org/download_world.html
#. 按國家下載 https://gadm.org/download_country_v3.html

由於全球數據量巨大，建議根據需要按照國家下載數據。

需要說明的是，GADM 中對country 的定義爲
“any entity with `an ISO country code <http://zh.wikipedia.org/wiki/ISO_3166-1>`_\ ”。
因而如果想要下載完整的中國數據，實際上需要下載China、Hong Kong、Macao和Taiwan
四個數據。

由於GADM提供的中國國界數據不符合我國領土主張，本文以美國數據爲例介紹數據下載及使用。

數據格式及轉換
--------------

對於每個數據，GADM提供了5種不同的格式：

- Geopackage：可以被GDAL/OGR、ArcGIS、QGIS等軟件讀取
- Shapefile：可直接用於ArcGIS等軟件
- KMZ：可直接在Google Earth中打開
- R (sp)：可直接用於R語言繪圖
- R (sf)：可直接用於R語言繪圖

如果在安裝GMT時，GMT已經正確鏈接了GDAL庫，則Shapefile格式的數據可以直接用於繪圖。
實際繪圖時，可能只想要一小部分數據（比如某個省/州的界線），這種情況下，則需要將
數據轉換成純文本文件，以方便從數據中提取出需要的部分。

GDAL 的 `ogr2ogr <https://www.gdal.org/ogr2ogr.html>`_ 可以實現多種地理數據
格式之間的互相轉換。該軟件的安裝及介紹見
`GDAL/OGR: 地理空間數據格式轉換神器 <https://gmt-china.org/blog/gdal-ogr/>`_\ 。
本文使用的是 GDAL 2.4.2，其他版本的GDAL可能用法略有不同。

Geopackage轉GMT
~~~~~~~~~~~~~~~

以United States數據爲例，解壓得到文件 :file:`gadm36_USA.gpkg`\ 。使用如下命令查看文件的信息::

    $ ogrinfo gadm36_USA.gpkg
    INFO: Open of `gadm36_USA.gpkg'
          using driver `GPKG' successful.
    1: gadm36_USA_2 (Multi Polygon)
    2: gadm36_USA_1 (Multi Polygon)
    3: gadm36_USA_0 (Multi Polygon)

可以看到Geopackage文件中包含了三個文件，分別是3個不同等級的邊界。
使用如下命令（注意其中的一對單引號不可省略）將其轉換爲GMT可識別的格式::

    ogr2ogr -f OGR_GMT '' gadm36_USA.gpkg gadm36_USA_0
    ogr2ogr -f OGR_GMT '' gadm36_USA.gpkg gadm36_USA_1
    ogr2ogr -f OGR_GMT '' gadm36_USA.gpkg gadm36_USA_2

最終得到以 :file:`.gmt` 結尾的數據3個。

Shapefile轉GMT
~~~~~~~~~~~~~~

以 United States 數據爲例，將下載的ZIP壓縮包解壓會得到
:file:`gadm36_USA_[012].shp` 3組Shapefile數據文件。

使用如下命令即可將Shapefile轉換爲GMT可識別的格式::

    ogr2ogr -f OGR_GMT gadm36_USA_0.gmt gadm36_USA_0.shp
    ogr2ogr -f OGR_GMT gadm36_USA_1.gmt gadm36_USA_1.shp
    ogr2ogr -f OGR_GMT gadm36_USA_2.gmt gadm36_USA_2.shp

最終得到以 :file:`.gmt` 結尾的數據3個。

數據分級
--------

提取得到的數據文件的文件名類似 :file:`gadm36_USA_0.gmt`\ ，其中 **USA** 爲國家/地區
代碼，\ **0** 表示行政等級。

以美國數據爲例，其數據包含了三個等級：

- 0級：即國界
- 1級：即州界
- 2級：即縣界

使用示例
--------

美國本土地圖
~~~~~~~~~~~~

繪製美國本土地圖需要前面提取出的 0 級數據。

.. literalinclude:: gadm_level0.sh

繪圖效果如下：

.. figure:: gadm_level0.*
   :align: center
   :width: 80%

美國 1 級行政區劃/州界
~~~~~~~~~~~~~~~~~~~~~~

代碼與上面的代碼幾乎一樣，此處使用了美國本土的1級數據。

.. literalinclude:: gadm_level1.sh

繪圖效果如下：

.. figure:: gadm_level1.*
   :align: center
   :width: 80%

此處繪製了美國本土48個州的州界數據。如果只想要繪製某個州，可以用文本編輯器
打開USA的1級數據文件，在註釋行中有清晰地標記出每段數據是哪個州的邊界，因而
可以很方便地提取出來。或利用如下命令將某個州界從Shapefile中提取出來::

    ogr2ogr -f OGR_GMT Alabama.gmt gadm36_USA_1.shp -where "NAME_1 = 'ALABAMA'"

美國 2 級行政區劃/縣界
~~~~~~~~~~~~~~~~~~~~~~

2 級數據中包含了美國所有的縣級邊界。此處以Alabama州爲例，用上述方法在USA的2級數據文件
中提取該州的州界和縣界 :file:`Alabama.gmt`\ ，繪圖效果如下：

.. literalinclude:: gadm_level2.sh

繪圖效果如下：

.. figure:: gadm_level2.*
   :align: center
   :width: 40%

許可協議
--------

GADM的\ `許可協議 <https://gadm.org/license.html>`_ 表明該數據可以免費用於學術
和非商業用途，可以利用該數據繪製學術出版物的地圖，但禁止重新分發或商業用途。
