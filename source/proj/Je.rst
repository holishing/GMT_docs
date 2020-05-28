-Je：方位等距投影
=================

維基鏈接：https://en.wikipedia.org/wiki/Azimuthal_equidistant_projection

方位投影最顯著的特徵是在圖上測量的從中心到任意一點的距離是真實的。因而，地圖上
以投影中心爲圓心的圓在真實地球上與投影中心是等距離的。同時，從中心出發的任意
方向也是真實的。該投影常用於展示多個地理位置與指定點的距離圖。

該投影的參數爲：

**-JE**\ *lon0*/*lat0*\ [*/horizon*]/*width*
或
**-Je**\ *lon0*/*lat0*\ [*/horizon*]/*scale*

- *lon*/*lat* 投影中心的經緯度
- *distance* 是邊界距離投影中心的度數，默認值爲180，即繪製全球圖
- *scale* 可以取 1:*xxxx* 格式，也可以是 *radius*/*latitude*
  （表示從投影中心到 緯線 *latitude* 在圖上的距離爲 *radius*\ ）

下圖中，投影中心爲100°W/40°N，離投影中心180度的點在圖中的最外邊界處。

.. gmtplot::
    :caption: 使用等距方位投影繪製全球圖
    :width: 50%

    gmt coast -Rg -JE-100/40/4.5i -Bg -Dc -A10000 -Glightgray -Wthinnest -png GMT_az_equidistant
