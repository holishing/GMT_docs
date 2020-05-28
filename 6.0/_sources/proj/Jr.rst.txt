-Jr：Winkel Tripel投影
======================

維基鏈接：https://en.wikipedia.org/wiki/Winkel_tripel_projection

1921年Oswald Winkel設計了該投影，以在三個元素（面積、角度、距離）之間折衷，
在繪製全球地圖時，這三個元素的畸變最小。此投影不是保角也不是等面積投影。
中心經線和赤道是直線，其他經線和緯線是曲線。該投影取等距圓柱投影和Aitoff
投影的座標的平均值。極點處投影爲0.4倍赤道長度的直線。

該投影的參數爲：

**-JR**\ [*lon*/]\ *width*
或
**-Jr**\ [*lon*/]\ *scale*

*lon* 是中心經線，默認值爲地圖區域的中心。

.. gmtplot::
    :caption: 使用Winkel Tripel投影繪製全球地圖
    :width: 75%

    gmt coast -Rd -JR4.5i -Bg -Dc -A10000 -Gburlywood4 -Swheat1 -png GMT_winkel
