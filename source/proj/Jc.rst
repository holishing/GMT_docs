-Jc：Cassini圓柱投影
====================

維基鏈接：https://en.wikipedia.org/wiki/Cassini_projection

此圓柱投影由César-François Cassini de Thury於1745年在調查法國時提出。
其偶爾也被稱爲Cassini-Soldner投影，因爲後者提供了更加精確的數學分析得到了橢球下的公式。

此投影既不保角也不等面積，而是介於二者之間的一種投影方式。沿着中心經線的畸變最小，
適合繪製南北方向區域範圍較大的地圖。其中，中心經線、距離中心經線90度的兩條經線以及
赤道是直線，其餘經線和緯線都是複雜的曲線。

該投影方式的參數爲：

**-JC**\ *lon*/*lat*/*width*
或
**-Jc**\ *lon*/*lat*/*scale*

其中，\ *lon*/*lat* 爲中心的經緯度。

.. gmtplot::
    :caption: Cassini投影繪製Sardinia島
    :width: 50%

    gmt coast -R7:30/38:30/10:30/41:30r -JC8.75/40/2.5i -Bafg -LjBR+c40+w100+f+o0.15i/0.2i \
        -Gspringgreen -Dh -Sazure -Wthinnest -Ia/thinner --FONT_LABEL=12p -png GMT_cassini
