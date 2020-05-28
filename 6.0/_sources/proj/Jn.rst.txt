-Jn：Robinson投影
=================

維基鏈接：https://en.wikipedia.org/wiki/Robinson_projection

此投影Arthur H. Robinson於1963年提出，是一個修改後的圓柱投影，既不是保角也不是
等面積。中心經線以及所有緯線都是直線，其餘經線都是曲線。其使用查找表的方式而
不是解析表達式來使得全球看上去比較正常。比例尺在經線38度是真實的。

該投影的參數爲:

**-JN**\ [*lon*/]\ *width*
或
**-Jn**\ [*lon*/]\ *scale*

*lon* 是中心經線，默認值爲地圖區域的中心。

.. gmtplot::
    :caption: 使用Robinson投影繪製全球地圖
    :width: 80%

    gmt coast -Rd -JN4.5i -Bg -Dc -A10000 -Ggoldenrod -Ssnow2 -png GMT_robinson
