-Jj：Miller圓柱投影
===================

維基鏈接：https://en.wikipedia.org/wiki/Miller_cylindrical_projection

此投影由Osborn Maitland Miller於1942年提出，該投影既不是保角也不是等面積。
所有的經線和緯線都是直線。該投影是Mercator與其他圓柱投影之間的折衷。在此投影中，
緯線之間的間距使用了Mercator公式並乘以0.8倍的真實緯度，因而避免了極點的奇點，
然後再將結果除以0.8。

該投影的參數爲：

**-JJ**\ *lon*/*width*
或
**-Jj**\ *lon*/*scale*

*lon* 爲中心經度，默認爲地圖區域的中心。

.. gmtplot::
    :caption: 使用Miller圓柱投影繪製世界地圖
    :width: 85%

    gmt coast -R-90/270/-80/90 -Jj1:400000000 -Bx45g45 -By30g30 -Dc -A10000 \
                -Gkhaki -Wthinnest -Sazure -png GMT_miller
