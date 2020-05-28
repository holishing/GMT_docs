earth_relief: 全球地形起伏數據
==============================

.. gmtplot::
   :show-code: false
   :width: 75%

   gmt grdimage @earth_relief_20m -png,pdf earth_relief

地形起伏數據簡介
----------------

GMT對公開的全球地形起伏數據進行預處理，並提供了從1弧秒到1弧度的
多種不同分辨率的全球地形起伏網格數據供GMT用戶使用。
下表列出了GMT提供的地形數據的名稱、分辨率以及文件大小。

====================== ========= ========
地形數據名稱           分辨率    大小
====================== ========= ========
``earth_relief_01d``   1 弧度    112 KB
``earth_relief_30m``   30 弧分   377 KB
``earth_relief_20m``   20 弧分   783 KB
``earth_relief_15m``   15 弧分   1.4 MB
``earth_relief_10m``   10 弧分   2.9 MB
``earth_relief_06m``   6 弧分    7.5 MB
``earth_relief_05m``   5 弧分     11 MB
``earth_relief_04m``   4 弧分     16 MB
``earth_relief_03m``   3 弧分     28 MB
``earth_relief_02m``   2 弧分     58 MB
``earth_relief_01m``   1 弧分    214 MB
``earth_relief_30s``   30 弧秒   778 MB
``earth_relief_15s``   15 弧秒   2.6 GB
``earth_relief_03s``   3 弧秒    6.8 GB
``earth_relief_01s``   1 弧秒     41 GB
``srtm_relief_03s``    3 弧秒    6.8 GB
``srtm_relief_01s``    1 弧秒     41 GB
====================== ========= ========

這些地形起伏數據保存在GMT的服務器上。當用戶\ **第一次**\ 使用某個分辨率的
地形起伏數據時，GMT會自動從服務器上下載該數據文件，
並保存到GMT的緩存文件夾下（由 :term:`DIR_CACHE` 控制，默認爲 **~/.gmt/server** 目錄），
然後再讀取該文件。以後再使用該數據時，GMT會自動從緩存文件夾下讀取該數據文件，
而無需再次從服務器下載。

數據下載
--------

當用戶第一次使用地形數據時，GMT需要從服務器下載數據，這通常很耗時。
因而，建議用戶在閒置時提前將分辨率爲15弧秒到1弧分的地形數據下載到自己的計算機上。

Bash用戶可以直接使用GMT提供的數據下載腳本（注意，下面命令開始處的 ``$`` 符號
不是命令提示符，執行時必須加上）::

    $(gmt --show-sharedir)/tools/gmt_getremote.sh data

Windows下Batch用戶可以直接複製如下命令並在CMD中執行::

    gmt which -Gu @earth_relief_01d
    gmt which -Gu @earth_relief_30m
    gmt which -Gu @earth_relief_20m
    gmt which -Gu @earth_relief_15m
    gmt which -Gu @earth_relief_10m
    gmt which -Gu @earth_relief_06m
    gmt which -Gu @earth_relief_05m
    gmt which -Gu @earth_relief_04m
    gmt which -Gu @earth_relief_03m
    gmt which -Gu @earth_relief_02m
    gmt which -Gu @earth_relief_01m
    gmt which -Gu @earth_relief_30s
    gmt which -Gu @earth_relief_15s

對於國內用戶，由於GMT服務器位於國外，下載通常很慢且容易由於網絡原因出現中斷。
建議手動從中科大鏡像手動下載：

#. 訪問中科大GMT鏡像的data目錄 http://mirrors.ustc.edu.cn/gmt/data/
#. 下載網頁顯示的所有數據文件
#. Linux或macOS用戶將數據文件放在目錄 ``~/.gmt/server`` 下（若目錄不存在則新建）
#. Windows 用戶將數據文件放在 ``C:\Users\用戶名\.gmt\server`` 目錄下（若目錄不存在則新建）

不建議提前下載1弧秒和3弧秒的地形數據，主要原因在於，這兩套數據佔據硬盤空間太大。
基於同樣的理由，GMT服務器上這兩套數據不是以單個文件的形式存放，而是被分成了多個小塊，
當用戶需要繪製某個區域的高分辨率地形時，GMT會自動下載該區域的所有區塊的地形數據，
然後合併成單個網格數據供用戶使用。

使用方法
--------

當需要使用地形數據時，可以直接通過 **@earth_relief_**\ *res* 的形式調用這些
地形起伏數據，其中 *res* 表示網格檔的分辨率。如果命令中使用了 **-R** 選項，
則只會讀取該區域內的地形起伏數據。例如：

查看60弧分的地形數據的信息::

    gmt grdinfo @earth_relief_60m

使用15弧分地形起伏數據繪製全球地形圖::

    gmt grdimage -JH15c @earth_relief_15m -pdf map

使用2弧分地形起伏數據繪製一個區域的地形圖::

    gmt grdimage -JH15c -R90/120/20/60 @earth_relief_02m -pdf map

緩存空間問題
------------

你可以使用多種方式來控制你的緩存目錄所佔用的空間大小：

#. 通過參數 :term:`GMT_DATA_SERVER_LIMIT` 設置允許下載的單個文件的大小上限，默認無限制；
#. 可以通過 **gmt clear data** 命令清空整個數據緩存目錄

技術細節
--------

-   15弧秒的數據來源於 SRTM15+ [http://dx.doi.org/10.1029/2019EA000658]
-   30弧秒及更低分辨率的全球地形數據均是SRTM15+ 的衍生產品。
    GMT利用笛卡爾高斯濾波對其進行重採樣以防止混疊現象，並保留了原始15弧秒數據的
    緯度依賴的分辨率信息。
    可以使用 :doc:`/module/grdinfo` 查看生成網格檔所使用的濾波命令。
-   3弧秒和1弧秒的數據來自於NASA提供的SRTM數據。數據被劃爲爲1度x1度的區塊。
    在使用時，GMT會根據 **-R** 選項指定的區域範圍只下載區域內的地形數據。
-   原始的SRTM3和SRTM1數據只在北緯60度到南緯60度的陸地上有數據。
    當使用 **@earth_relief_01s** 或 **@earth_relief_03s** 時，GMT會自動對
    **@earth_relief_15s** 數據對增採樣以填充缺失的海洋部分。
-   如果想使用最原始的只包含陸地的SRTM地形數據，則可以使用 **@srtm_relief_03s**
    或 **srtm_relief_01s**\ 。
-   所有的網格檔都是網格線配準的。網格檔採用了更高效的文件格式，使得其文件大小
    遠小於原始文件的大小，且完全保持數據分辨率。對於3弧秒和1弧秒的數據，是以JPEG2000
    圖片格式保存在GMT服務器上的，一旦數據下載到本地目錄中，則會被轉換爲壓縮的netCDF4
    格式，這一步通過GDAL來實現，且要求GDAL支持openjpeg。

數據來源及引用
--------------

#. SRTM15 [http://dx.doi.org/10.1029/2019EA000658]
#. SRTMGL3數據: https://lpdaac.usgs.gov/dataset_discovery/measures/measures_products_table/srtmgl3_v003
#. SRTMGL1數據: https://lpdaac.usgs.gov/dataset_discovery/measures/measures_products_table/srtmgl1_v003
