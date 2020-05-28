-Jv：Van der Grinten投影
========================

維基鏈接：https://en.wikipedia.org/wiki/Van_der_Grinten_projection

此投影由Alphons J. van der Grinten於1904年提出，其既不等面積也不保角。
中心經線和赤道都是直線，其餘經線則是圓弧，僅在赤道處比例尺是真實的，
主要用於在一個圓內展示整個世界地圖。

該投影的參數爲：

**-JV**\ *lon*/*width*
或
**-Jv**\ *lon*/*scale*

*lon* 是投影中心經線，默認值爲地圖區域的中心。

.. gmtplot::
    :caption: 使用Van der Grinten投影繪製全球圖
    :width: 65%

    gmt coast -Rg -JV4i -Bxg30 -Byg15 -Dc -Glightgray -A10000 -Wthinnest -png GMT_grinten
