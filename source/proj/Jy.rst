-Jy：圓柱等面積投影
===================

維基鏈接：https://en.wikipedia.org/wiki/Cylindrical_equal-area_projection

選擇不同的標準緯線，則對應不同的圓柱投影。所有的這些圓柱投影都是等面積且不保角的。
所有經線和緯線都是直線。在高緯度處畸變很大。

該投影的參數爲：

**-JY**\ *lon*/*lat*/*width*
或
**-Jy**\ *lon*/*lat*/*scale*

*lon* 是中心經線，\ *lat* 是標準緯線。

標準緯線可以取任意值，下面列出了一些比較流行的標準緯線的選擇：

.. table::
   :align: center

   +-------------------+---------------------+
   +===================+=====================+
   | Balthasart        | 50°                 |
   +-------------------+---------------------+
   | Gall              | 45°                 |
   +-------------------+---------------------+
   | Hobo-Dyer         | 37°30' (= 37.5°)    |
   +-------------------+---------------------+
   | Trystan Edwards   | 37°24' (= 37.4°)    |
   +-------------------+---------------------+
   | Caster            | 37°04' (= 37.0666°) |
   +-------------------+---------------------+
   | Behrman           | 30°                 |
   +-------------------+---------------------+
   | Lambert           | 0°                  |
   +-------------------+---------------------+

.. gmtplot::
    :caption: 使用Behrman圓柱等面積投影繪製地圖
    :width: 85%

    gmt coast -R-145/215/-90/90 -JY35/30/4.5i -B45g45 -Dc -A10000 -Sdodgerblue -Wthinnest -png GMT_general_cyl
