-Jf：球心方位投影
=================

維基鏈接：https://en.wikipedia.org/wiki/Gnomonic_projection

此投影是一個從中心投影到與表面相切的一個平面的透視投影。此投影既不等面積也不保角，
且在半球的邊界處有很大畸變，但從投影中心出發的方向是真實的。大圓會被投影成直線。

該投影的參數爲：

**-JF**\ *lon*/*lat*\ [/*distance*]/*width*
或
**-Jf**\ *lon*/*lat*\ [/*distance*]/*scale*


- *lon*/*lat* 投影中心的經緯度
- *distance* 地圖邊界到投影中心的角度，默認值爲60度
- *scale* 可以是 1:*xxxx* 也可以是 *radius*/*atitude*
  （\ *radius* 是投影中心到緯線 *latitude* 在圖上的距離）

.. gmtplot::
    :caption: 球心方位投影
    :width: 50%

    gmt coast -Rg -JF-120/35/60/4.5i -B30g15 -Dc -A10000 -Gtan -Scyan -Wthinnest -png GMT_gnomonic
