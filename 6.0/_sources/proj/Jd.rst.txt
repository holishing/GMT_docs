-Jd：等距圓錐投影
=================

維基鏈接：https://en.wikipedia.org/wiki/Equidistant_conic_projection

等距圓錐投影由希臘哲學家Claudius Ptolemy於公元150年提出。其既不是保角也不是
等面積，而是兩種的折衷。在所有經線以及標準緯線上比例尺沒有畸變。

該投影的參數爲：

**-JD**\ *lon0*/*lat0*/*lat1*/*lat2*/*width*
或
**-Jd**\ *lon0*/*lat0*/*lat1*/*lat2*/*scale*

- *lon*/*lat* 投影中心位置
- *lat1*/*lat2* 兩條標準緯線

等距圓錐投影常用於繪製小國家的地圖集。

.. gmtplot::
    :caption: 等距圓錐地圖投影
    :width: 85%

    gmt begin GMT_equidistant_conic pdf,png
    gmt set FORMAT_GEO_MAP ddd:mm:ssF MAP_GRID_CROSS_SIZE_PRIMARY 0.05i
    gmt coast -R-88/-70/18/24 -JD-79/21/19/23/4.5i -Bag -Di -N1/thick,red -Glightgreen -Wthinnest
    gmt end
