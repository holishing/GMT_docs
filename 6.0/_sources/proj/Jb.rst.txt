-Jb：Albers圓錐等面積投影
=========================

維基鏈接：https://en.wikipedia.org/wiki/Albers_projection

此投影由Albers於1805年提出，主要用於繪製東西方向範圍很大的地圖，尤其是美國地圖。

此投影是圓錐、等面積投影。緯線是不等間隔分佈的同心圓，在地球南北極處分佈較密。
經線則是等間隔分隔，並垂直切割緯線。

在兩條標準緯線處，比例尺和形狀的畸變最小；在兩者之間，沿着緯線的比例尺太小；
在兩者外部，沿着經線的比例尺則太大。沿着經線，則完全相反。

該投影方式的參數爲：

**-JB**\ *lon*/*lat*/*lat1*/*lat2*/*width*
或
**-Jb**\ *lon*/*lat*/*lat1*/*lat2*/*scale*

- *lon* 和 *lat* 是投影中心的位置
- *lat1* 和 *lat2* 是兩條標準緯線

下圖繪製了臺灣附近的區域，投影中心位於125°E/20°N，25度和45度緯線是兩條標準緯線。

.. gmtplot::
    :caption: Albers圓錐等面積投影
    :width: 75%

    gmt begin GMT_albers pdf,png
    gmt set MAP_GRID_CROSS_SIZE_PRIMARY 0
    gmt coast -R110/140/20/35 -JB125/20/25/45/5i -Bag -Dl -Ggreen -Wthinnest -A250
    gmt end
