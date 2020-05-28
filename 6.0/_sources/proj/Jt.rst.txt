-Jt：橫向Mercator投影
=====================

維基鏈接：https://en.wikipedia.org/wiki/Transverse_Mercator_projection

此投影由Lambert於1772年提出。該投影中，圓柱與某條經線相切。在該經線處無畸變。
離中心經線越遠畸變越大，距離中心經線90度處的經線畸變達到無窮。中心經線和赤道
都是直線，其餘經線和緯線則是複雜曲線。

該投影的參數:

**-JT**\ *lon*\ [/*lat*]/*width*
**-Jt**\ *lon*\ [/*lat*]/*scale*

*lon* 中心經線，\ *lat* 原點的緯度，默認值爲赤道。

地圖縮放因子默認值爲1，可以通過修改參數 :term:`PROJ_SCALE_FACTOR`
以實現自定義。

.. gmtplot::
    :caption: 矩形橫向Mercator地圖
    :width: 75%

    gmt coast -R20/30/50/45r -Jt35/0.18i -Bag -Dl -A250 -Glightbrown -Wthinnest -Sseashell -png GMT_transverse_merc


.. gmtplot::
    :caption: 全球橫向Mercator地圖
    :width: 65%

    gmt coast -R0/360/-80/80 -JT330/-45/3.5i -Ba30g -BWSne -Dc -A2000 -Slightblue -G0 -png GMT_TM
