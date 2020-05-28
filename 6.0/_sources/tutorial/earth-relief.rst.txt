繪製地形起伏
============

繪製地圖時另一個常見的需求是繪製全球或者區域的地形起伏作爲底圖。

GMT中 :doc:`/module/grdimage` 模塊可以繪製二維網格，其原理是建立Z值與顏色之間的映射關係，
每個座標點不同的Z值用不同的顏色表徵。
地形起伏，即不同經緯度處的高程或海深數據，也是一種二維數據，因而我們可以使用
**grdimage** 模塊繪製地形起伏。

全球地形起伏數據
----------------

要繪製全球或區域地形起伏圖，首先需要擁有地形起伏數據，即不同經緯度處的高程或海深數據。
GMT收集整理並提供了一套全球地形起伏數據，供用戶直接使用。
這套地形起伏數據分爲包含了從60弧分到1弧秒的多種不同精度的全球地形起伏數據，
以滿足不同的繪圖區域大小的需求。

GMT用戶可以通過給定文件名 :file:`@earth_relief_xxx` 的方式來指定要使用某個精度的
地形。\ *xxx* 用於指定數據精度，例如 **15m**\ 、\ **01m**\ 和 \ **15s** 分別表示
數據分辨率爲15弧分、1弧分和15弧秒。

文件名前的 **@** 表示該數據是由GMT官方提供並維護的數據，當第一次使用該文件時，
GMT會自動從服務器下載該數據並保存到本地的GMT數據目錄中，當以後再使用該文件時，
則直接讀取本地文件，而無需重新下載該數據。

關於全球地形起伏數據的詳細介紹見 :doc:`/dataset/earth-relief`\ 。

繪製全球地形起伏圖
------------------

下面我們將使用 **grdimage** 模塊繪製5弧分精度的全球地形起伏數據（\ :file:`@earth_relief_05m`\ ）。
不同的高程用不同的顏色表示，從中我們很容易看出不同地區的地形變化。

.. gmtplot::
    :width: 100%
    :caption: 全球地形起伏圖

    gmt begin global_relief png,pdf
    gmt grdimage @earth_relief_05m -JH180/10c
    gmt end show

繪圖區域地形起伏圖
------------------

想要繪製區域地形起伏？只需要在 **grdimage** 模塊中使用 **-R** 選項指定
區域經緯度範圍即可。這裏我們設置了繪圖區域爲118°E至125°E、20°N至26°N。
由於繪圖區域比較小，所以我們選用了更高精度的 30 弧秒的地形起伏數據。

.. note::

    30弧秒的地形起伏數據大小約爲800Mb。
    第一次使用該數據時GMT會自動從服務器下載該文件，因而會很耗時，請耐心等待。

.. gmtplot::
    :width: 70%
    :caption: 臺灣區域地形圖

    gmt begin taiwan_relief png,pdf
    gmt grdimage @earth_relief_30s -JM15c -R118/125/20/26 -Baf -BWSen
    gmt end show

增加光照效果
------------

爲了讓地形起伏圖更加立體，我們可以爲圖幅加上光照效果。我們可以指定光照的方向、
強度等參數，也可以直接使用 **-I+d** 以使用默認的光照效果。

下面的示例中，我們加上了 **-I+d** 以增加光照效果。跟上圖比一比，是否圖片更加立體
也更加美觀了呢？

.. gmtplot::
    :width: 70%
    :caption: 帶光照效果的臺灣區域地形圖

    gmt begin taiwan_relief png,pdf
    gmt grdimage @earth_relief_30s -JM15c -R118/125/20/26 -Baf -BWSen -I+d
    gmt end show

增加光照效果本質上是計算了每個點沿着某個方位角的方向梯度，然後根據每個點的
方向梯度的正負以及振幅調節該點顏色的亮度值。對於向陽處，其方向梯度爲正值，則增加
該點顏色的亮度；對於背陰處，其方向梯度爲負值，則降低該點顏色的亮度。由此達到
增加光照效果、增強立體感的目的。

添加色標
--------

前面提到，\ **grdimage** 繪製地形起伏數據本質上就是將高程的數值與顏色之間對應起來。
二者之間的對應關係由色標文件（即CPT文件）決定。那麼，上圖使用的是怎麼樣的CPT呢？
高程數值與顏色之間的對應關係又是怎樣的呢？不同的顏色代表的具體數值又是多少呢？
這就需要用 :doc:`/module/colorbar` 向圖中添加色標。

.. gmtplot::
    :width: 70%

    gmt begin taiwan_relief png,pdf
    gmt grdimage @earth_relief_30s -JM15c -R118/125/20/26 -Baf -BWSen -I+d
    gmt colorbar
    gmt end show

上面的腳本中 **colorbar** 命令在地形圖的下方添加了一個色標，但是色標下面的有一團
很亂的標註，這顯示不是我們想要的。我們可以使用 **-B** 選項設置色標的標註間隔，
併爲色標添加一個標籤。

.. gmtplot::
    :width: 70%

    gmt begin taiwan_relief png,pdf
    gmt grdimage @earth_relief_30s -JM15c -R118/125/20/26 -Baf -BWSen -I+d
    gmt colorbar -Bxaf+l"Elevation (m)"
    gmt end show

當然，我們還可以更進一步調整色標的位置、長度等屬性。下面的腳本中，我們使用了
**-D** 選項將色標放在了地形起伏圖的右側中間（\ **JMR**\ ）向右偏移1.5釐米，
色標長度爲10釐米，並將標籤放在了色標左側（\ **+ml**\ ）。

.. gmtplot::
    :width: 70%

    gmt begin taiwan_relief png,pdf
    gmt grdimage @earth_relief_30s -JM15c -R118/125/20/26 -Baf -BWSen -I+d
    gmt colorbar -DJMR+w10c+o1.5c/0c+ml -Bxa1000f -By+l"m"
    gmt end show

製作CPT文件
-----------

上面的示例中使用的是GMT的默認CPT文件。用戶也可以使用 :doc:`/module/makecpt` 或
:doc:`gmt:grd2cpt` 製作CPT文件。

下面的示例中，我們使用 :doc:`/module/makecpt` 模塊在GMT內置CPT **globe** 的基礎
上生成了一個-8000到8000範圍內的新CPT文件。生成的CPT文件將作爲當前CPT文件，供
接下來的 **grdimage** 和 **colorbar** 命令使用。

.. gmtplot::
    :width: 70%

    gmt begin taiwan_relief png,pdf
    gmt basemap -JM15c -R118/125/20/26 -Baf -BWSen
    gmt makecpt -Cglobe -T-8000/8000
    gmt grdimage @earth_relief_30s -I+d
    gmt colorbar -Bxa2000 -B+l"m"
    gmt end show
