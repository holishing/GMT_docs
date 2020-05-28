-Jl：Lambert圓錐保角投影
========================

維基鏈接：https://en.wikipedia.org/wiki/Lambert_conformal_conic_projection

此投影由Heinrich Lambert於1772年提出，主要用於繪製東西方向範圍很大的地圖。
與Albers投影不同的是，Lambert投影不是等面積的。緯線是共圓心的圓弧，
經線是這些圓的等間隔分佈的半徑。與Albers投影類似，只有兩條標準緯線是無畸變的。

該投影的參數爲：

**-JL**\ *lon0*/*lat0*/*lat1*/*lat2*/*width*
或
**-Jl**\ *lon0*/*lat0*/*lat1*/*lat2*/*scale*

- *lon0* 和 *lat0* 是投影中心的位置
- *lat1* 和 *lat2* 是兩條標準緯線

Lambert保角投影場用於繪製美國地圖，兩個固定的標準緯線是33°N和45°N。

.. gmtplot::
    :caption: Lambert保角圓錐投影
    :width: 85%

    gmt begin GMT_lambert_conic pdf,png
    gmt set MAP_FRAME_TYPE FANCY FORMAT_GEO_MAP ddd:mm:ssF MAP_GRID_CROSS_SIZE_PRIMARY 0.05i
    gmt coast -R-130/-70/24/52 -Jl-100/35/33/45/1:50000000 -Bag -Dl -N1/thick,red \
                -N2/thinner -A500 -Gtan -Wthinnest,white -Sblue
    gmt end

投影中心的選取並不影響投影，但其指定了哪一條經線垂直於地圖。
