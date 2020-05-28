-Ji：正弦曲線投影
=================

維基鏈接：https://en.wikipedia.org/wiki/Sinusoidal_projection

正弦曲線投影是等面積投影，是已知的最古老的投影之一，也被稱爲等面積Mercator投影。
其中心經線是直線，其餘經線是正弦曲線，緯線是等間距的直線。
在所有緯線和中心經線處比例尺是真實的。

該投影的參數爲：

**-JI**\ [*lon*/]\ *width*
或
**-Ji**\ [*lon*/]\ *scale*

*lon* 是中心經線，默認值爲地圖區域的中心。

.. gmtplot::
    :caption: 使用正弦曲線投影繪製世界地圖
    :width: 85%

    gmt coast -Rd -JI4.5i -Bxg30 -Byg15 -Dc -A10000 -Ggray -png GMT_sinusoidal

爲了減少形狀的畸變，1927年引入了間斷正弦曲線投影，即用三個對稱的段來覆蓋全球。
傳統上，間斷出現在160°W、20°W和60°E處。爲了生成間斷地圖，必須調用 :doc:`/module/coast`
三次以分別繪製每段地圖併疊加起來。間斷正弦曲線投影一般僅用於顯示全球不連續數據分佈。

爲了生成一個寬度爲5.04英寸的間斷世界地圖，需要設置比例尺爲5.04/360 = 0.014，
並將每段圖沿水平方向偏移其對應的寬度
(140\ :math:`\cdot`\ 0.014 and 80\ :math:`\cdot`\ 0.014)。

.. gmtplot::
   :caption:  使用間斷正弦曲線投影繪製世界地圖
   :width: 85%

   gmt begin GMT_sinus_int pdf,png
   gmt coast -R200/340/-90/90 -Ji0.014i -Bxg30 -Byg15 -A10000 -Dc -Gblack
   gmt coast -R-20/60/-90/90 -Ji0.014i -Bxg30 -Byg15 -Dc -A10000 -Gblack -X1.96i
   gmt coast -R60/200/-90/90 -Ji0.014i -Bxg30 -Byg15 -Dc -A10000 -Gblack -X1.12i
   gmt end
