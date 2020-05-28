-Js：立體等角投影
=================

維基鏈接：https://en.wikipedia.org/wiki/Stereographic_projection

此投影是保角方位投影，主要用於繪製南北極區域。在兩極，所有經線都是直線，緯線則是圓弧。

該投影的參數：

**-JS**\ *lon*/*lat*\ [/*distance*]/*width*
或
**-Js**\ *lon*/*lat*\ [/*distance*]/*scale*

- *lon*/*lat* 投影中心的經緯度
- *distance* 地圖邊界到投影中心的角度，默認值爲90度
- *scale* 可以是 1:*xxxx* 也可以是 *radius*/*latitude*
  （\ *radius* 是投影中心到緯線 *latitude* 在圖上的距離），
  還可以是 *slat*/1:*xxxx*\ （指定在標準緯線 *slat* 處的比例尺）

極區立體地圖
------------

下面的示例中，投影中心爲北極，地圖邊界與經線和緯線完全重合。

.. gmtplot::
    :caption: 極區立體保角投影
    :width: 85%

    gmt coast -R-30/30/60/72 -Js0/90/4.5i/60 -B10g -Dl -A250 -Groyalblue \
                -Sseashell -png GMT_stereographic_polar

矩形立體地圖
------------

與Lambert方位等面積投影類似，也可以通過指定地圖區域左下角和右上角的座標來繪製一個矩形區域。

.. gmtplot::
    :caption: 矩形邊界下的極區立體保角投影
    :width: 75%

    gmt begin GMT_stereographic_rect pdf,png
    gmt set MAP_ANNOT_OBLIQUE 30
    gmt coast -R-25/59/70/72r -JS10/90/11c -B20g -Dl -A250 -Gdarkbrown -Wthinnest -Slightgray
    gmt end

一般立體地圖
------------

.. gmtplot::
    :caption: 一般立體投影
    :width: 75%

    gmt begin GMT_stereographic_general pdf,png
    gmt set MAP_ANNOT_OBLIQUE 0
    gmt coast -R100/-42/160/-8r -JS130/-30/4i -Bag -Dl -A500 -Ggreen -Slightblue -Wthinnest
    gmt end
