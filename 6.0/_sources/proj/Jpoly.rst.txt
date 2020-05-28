-Jpoly：多圓錐投影
==================

維基鏈接：https://en.wikipedia.org/wiki/Polyconic_projection

此投影既不是等面積也不是保角投影，沿着中心經線處畸變爲0。所有緯線的比例尺都是真實的，
但其餘經線則存在畸變。

.. gmtplot::
    :caption: 多圓錐投影
    :width: 75%

    gmt coast -R-180/-20/0/90 -JPoly/4i -Bx30g10 -By10g10 -Dc -A1000 -Glightgray \
                -Wthinnest -png GMT_polyconic
