-Jo：傾斜Mercator投影
=====================

維基鏈接：https://en.wikipedia.org/wiki/Space-oblique_Mercator_projection

傾斜Mercator投影常用於繪製沿着傾斜方向橫向範圍較大的地圖，其經線和緯線都是複雜曲線。

其有多種定義方式：

- **-JO**\ [**a**\|\ **A**]\ *lon*/*lat*/*azi*/*width*
- **-Jo**\ [**a**\|\ **A**]\ *lon*/*lat*/*azi*/*scale*
- **-JO**\ [**b**\|\ **B**]\ *lon*/*lat*/*lon2*/*lat2*/*width*
- **-Jo**\ [**b**\|\ **B**]\ *lon*/*lat*/*lon2*/*lat2*/*scale*
- **-JO**\ [**b**\|\ **B**]\ *lon*/*lat*/*lonp*/*latp*/*width*
- **-Jo**\ [**b**\|\ **B**]\ *lon*/*lat*/*lonp*/*latp*/*scale*

- *lon*/*lat* 投影中心的經緯度
- *azi* 傾斜赤道的方位角
- *lon2*/*lat2* 傾斜赤道另一個點的經緯度
- *lonp*/*latp* 投影極點的經緯度

在三種定義中，大寫的 **A**\|\ **B**\|\ **C** 表示允許投影極點位於南半球。

.. gmtplot::
    :caption: 使用 **-Joc** 傾斜Mercator投影
    :width: 80%

    gmt coast -R270/20/305/25r -JOc280/25.5/22/69/4.8i -Bag -Di -A250 -Gburlywood \
                -Wthinnest -TdjTR+w0.4i+f2+l+o0.15i -Sazure --FONT_TITLE=8p \
                --MAP_TITLE_OFFSET=0.05i -png GMT_obl_merc

在使用傾斜投影時，直接指定整個區域相對地圖中心的相對投影座標更爲方便，
下面的示例中使用了 **-R-1000/1000/-500/500+uk** 來指定相對投影座標。

.. gmtplot:: /scripts/GMT_obl_nz.sh
   :show-code: false
   :width: 85%

   使用 **-JOa** 傾斜Mercator投影

   (左) ``-JOa173:17:02E/41:16:15S/35/3i``
   (右) ``-JOA173:17:02E/41:16:15S/215/3i``
