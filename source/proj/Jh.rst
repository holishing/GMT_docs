-Jh：等面積Hammer投影
=====================

維基鏈接：https://en.wikipedia.org/wiki/Hammer_projection

等面積Hammer投影由Ernst von Hammer於1892年提出，也被稱爲Hammer-Aitoff投影（Aitoff投影與之看起來相似，但不等面積）。投影后的邊界是一個橢圓，赤道和中心經線是執行，其餘緯線和經線都是複雜曲線。

該投影的參數爲：

**-JH**\ [*lon*/]\ *width*
或
**-Jh**\ [*lon*/]\ *scale*

*lon* 是中心經線，默認位於地圖區域的中心。

.. gmtplot::
    :caption: 使用Hammer投影繪製全球地圖
    :width: 85%

    gmt coast -Rg -JH4.5i -Bg -Dc -A10000 -Gblack -Scornsilk -png GMT_hammer
