-Jm：Mercator投影
=================

維基鏈接：https://en.wikipedia.org/wiki/Mercator_projection

此投影是圓柱保角投影，沿着赤道無畸變，但兩極畸變嚴重。此投影的主要特點是等方位角的
線是一條直線，這樣一條線稱爲rhumb線或loxodrome。

在常規Mercator投影中，圓柱與赤道相切。若圓柱沿着其他方向與地球相切，則稱爲橫向
Mercator投影或傾斜Mercator投影。

常規的Mercator投影需要的參數如下：

**-JM**\ [*lon*\ [/*lat*]/]\ *width*
或
**-Jm**\ [*lon*\ [/*lat*]/]\ *scale*

- *lon* 中心經線，默認爲地圖區域的中心
- *lat* 標準緯線，默認值爲赤道。若要指定標準緯線，則必須同時指定中心經線

.. gmtplot::
    :caption: Mercator投影
    :width: 85%

    gmt begin GMT_mercator pdf,png
    gmt set MAP_FRAME_TYPE fancy
    gmt coast -R0/360/-70/70 -Jm1.2e-2i -Bxa60f15 -Bya30f15 -Dc -A5000 -Gred
    gmt end
