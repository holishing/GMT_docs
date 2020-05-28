-Ja：Lambert方位等面積投影
==========================

維基鏈接: https://en.wikipedia.org/wiki/Lambert_azimuthal_equal-area_projection

該投影由Lambert於1772年發展得到，通常用於繪製大區域地圖（例如整個大洲或半球），
該投影是方位等面積投影。在投影的中心畸變爲0，離投影中心距離越遠，
畸變越大。該投影的參數爲：

**-JA**\ *lon*/*lat*/[*distance*/]\ *width*
或
**-Ja**\ *lon*/*lat*/[*distance*/]\ *scale*

- *lon*/*lat* 投影中心座標
- *distance* 投影中心到邊界的角度，默認值爲90，即距離投影中心各90度，即整個半球
- *width* 地圖寬度
- *scale* 地圖比例尺 1:*xxxx* 或 *radius*/*latitude*
  （\ *radius* 是緯線 *latitude* 與投影中心在圖上的距離）

矩形地圖
--------

對於此投影而言，經線和緯線通常不是直線，因而不適合用於指定地圖邊界。因而本例中
通過指定區域的左下角（0°E/40°S）和右上角（60°E/10°S）的座標來指定區域範圍。

.. gmtplot::
    :caption: 使用Lambert方位等面積投影繪製矩形地圖
    :width: 75%

    gmt begin GMT_lambert_az_rect pdf,png
    gmt set FORMAT_GEO_MAP ddd:mm:ssF MAP_GRID_CROSS_SIZE_PRIMARY 0
    gmt coast -R0/-40/60/-10r -JA30/-30/4.5i -Bag -Dl -A500 -Gp300/10 -Wthinnest
    gmt end

半球地圖
--------

要繪製半球地圖，需要指定區域範圍爲整個地球。下圖繪製了以南美洲爲中心的半球圖。

.. gmtplot::
    :caption: 使用Lambert方位等面積投影繪製半球地圖
    :width: 40%

    gmt coast -Rg -JA280/30/3.5i -Bg -Dc -A1000 -Gnavy -png GMT_lambert_az_hemi

震源輻射花樣
------------

地震學在繪製震源機制解時，就是將三維的輻射花樣信息投影到一個水平面內。
投影的方式有兩種：Schmidt網和Wulff網。其中Schmidt網使用的就是Lambert方位
等面積投影（中心經緯度爲0/0），Wulff網使用的則是等角度的立體投影。
兩種震源球投影方式如下圖所示：

.. gmtplot:: /scripts/GMT_stereonets.sh
    :show-code: false
    :caption: 震源球投影：等面積的Schmidt網和等角度的Wulff網
    :width: 75%
