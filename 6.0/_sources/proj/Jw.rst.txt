-Jw：Mollweide投影
==================

維基鏈接：https://en.wikipedia.org/wiki/Mollweide_projection

此投影是僞圓柱等面積投影，由Karl Brandan Mollweide於1805年提出。
緯線是不等間隔分佈的直線，經線是等間隔分佈的橢圓弧。比例尺僅在南北緯40度44分
緯線上纔是真實的。此投影主要用於繪製全球的數據分佈圖。

該投影的參數爲：

**-JW**\ [*lon*/]\ *width*
或
**-Jw**\ [*lon*/]\ *scale*

*lon* 爲中心經線，默認值爲地圖區域的中心。

.. gmtplot::
    :caption: 使用Mollweide投影繪製全球地圖
    :width: 85%

    gmt coast -Rd -JW4.5i -Bg -Dc -A10000 -Gtomato1 -Sskyblue -png GMT_mollweide
