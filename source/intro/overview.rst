GMT簡介
=======

GMT是什麼
---------

GMT，全稱Generic Mapping Tools，中文一般譯爲“通用製圖工具”，是地球科學最廣泛
使用的製圖軟件之一。

GMT具有強大的繪圖功能和數據處理功能。

繪圖方面，GMT支持繪製多種類型的底圖：除30多種地圖投影外，還有笛卡爾線性座標軸、
對數軸、指數軸、極座標系；支持繪製統計直方圖、等值線圖、2D網格圖以及3D視角圖等；
也支持繪製線段、海岸線、國界、多種符號、圖例、色標、文字等。

數據處理方面，GMT具有數據篩選、重採樣、時間序列濾波、二維網格濾波、三維網格插值、
多項式擬合、線性迴歸分析等功能。

GMT的歷史
---------

- 1988年，Paul Wessel 和 Walter H.F. Smith 開發了GMT的最原始版本GMT 1.0；
- 1991年8月10日，GMT 2.0發佈；
- 1998年11月8日，GMT 3.x的第一個正式版發佈；
- 2005年10月1日，GMT 4.x的第一個正式版發佈；
  GMT4.x系列的最後一個版本是GMT 4.5.18，發佈於2018年7月1日；
- 2013年11月5日，GMT 5.x的第一個正式版發佈；
  GMT5.x系列的最後一個版本是GMT 5.4.5，發佈於 2019年1月4日；
- 2019年11月1日，GMT 6.x的第一個正式版發佈；目前最新版本 GMT 6.0.0 發佈於 2019年11月1日。

想了解更多關於GMT的歷史故事，可以觀看/收聽下面的視頻/音頻：

- Don't Panic Geocast 對 Paul Wessel 和 Leonardo Uieda 的採訪 http://www.dontpanicgeocast.com/?p=638
- Don't Panic Geocast 對 Walter Smith 的採訪 https://www.dontpanicgeocast.com/?p=742
- Paul Wessel 在 GMT 20 週年的演講 https://av.tib.eu/media/19869

GMT開發者
---------

GMT的核心開發者有7位，分別是
`Paul Wessel <http://www.soest.hawaii.edu/wessel/>`_\ 、
`Walter H. F. Smith <https://www.star.nesdis.noaa.gov/star/Smith_WHF.php>`_\ 、
`Remko Scharroo <https://www.researchgate.net/profile/Remko_Scharroo>`_\ 、
`Joaquim F. Luis <http://w3.ualg.pt/~jluis/>`_\ 、
`Leonardo Uieda <https://www.leouieda.com>`_\ 、
Florian Wobbe 和
`Dongdong Tian <https://msu.edu/~tiandong/>`_\ 。
GMT的開發在 `GitHub <https://github.com/GenericMappingTools/gmt>`_ 上進行，
任何用戶均可通過多種方式向GMT做貢獻。

.. figure:: /images/GMT6_Summit_2019.jpg
   :width: 80%
   :align: center

   GMT核心開發者及指導委員會部分成員

   從左至右依次爲Dongdong Tian、David Sandwell（指導委員會主席）、Walter H.F. Smith、
   Paul Wessel、Joaquim Luis、Leonardo Uieda 和 Dave Caress（指導委員會成員）。
   照片拍攝於2019年7月29日至8月2日在加州La Jolla舉辦的GMT開發者峯會。

GMT的特點
---------

爲什麼選擇GMT作爲繪圖軟件呢？因爲GMT有如下特點：

#. 開源免費

   GMT是免費的開源軟件，其源碼遵循 `GNU LGPL <https://zh.wikipedia.org/zh-cn/GNU寬通用公共許可證>`_
   協議。任何人均可自由複製、分發、修改其源代碼，也可用於盈利。修改後的代碼
   必須開源但可以使用其它開源協議。

#. 跨平臺

   GMT源碼由高度可移植的C語言寫成，其完全兼容於POSIX標準，可以運行在Linux、
   macOS等類UNIX系統及Windows上。GMT不僅公開了軟件源代碼，還提供了 Windows
   和 macOS 下的二進制安裝包，各大Linux發行版中也提供了預編譯的二進制包。

#. 模塊化

   GMT遵循UNIX的模塊化設計思想，將不同的繪圖功能和數據處理功能劃分到不同的模塊中。
   這樣的模塊化設計有很多優點：

   - 只需要少量的模塊
   - 各個模塊之間相互獨立且代碼量少，易於更新和維護
   - 每一步均獨立於之前的步驟以及具體的數據類型，因而可以用於不同的應用中
   - 可以在腳本中調用一系列程序，或通過管道連接起來，進而繪製複雜圖件

#. 支持多種格式的高精度矢量圖和位圖

   GMT支持多種高精度的矢量圖片格式和位圖圖片格式。
   矢量圖片格式，如PDF、PS和EPS，具有任意放大縮小而不失真的特性，可直接投稿到學術期刊；
   位圖圖片格式，如BMP、JPG、PNG、PPM和TIFF格式，可用於日常的文檔及演示。

其它製圖軟件
------------

除了GMT之外，還有很多其它軟件也可以用於製圖。以下僅列出一些地學
常用的製圖軟件。其中 **√** 和 **X** 用於表示是否支持某一功能。

.. table:: 地球科學常用繪圖軟件比較
    :align: center

    ===============  ======  ======== ==============
    軟件名稱         二維圖  三維圖   地圖
    ===============  ======  ======== ==============
    `GMT`_           √       √ [1]_   √
    `Matplotlib`_    √       √        √ [2]_
    Microsoft Excel  √       √        √
    `Origin`_        √       √        X
    Matlab           √       √        √ [3]_
    `ggplot2`_       √       X        √ [4]_
    `gnuplot`_       √       √        X
    ===============  ======  ======== ==============

.. _GMT: https://www.generic-mapping-tools.org/
.. _Matplotlib: https://matplotlib.org/
.. _Origin: https://www.originlab.com/
.. _ggplot2: https://ggplot2.tidyverse.org/
.. _gnuplot: http://www.gnuplot.info/

.. [1] GMT對三維圖的支持很有限
.. [2] 需要額外安裝 `Cartopy <https://scitools.org.uk/cartopy/>`_
.. [3] 需要額外安裝 `M_Map <https://www.eoas.ubc.ca/~rich/map.html>`_
.. [4] 需要額外安裝 `ggmap <https://github.com/dkahle/ggmap>`_
