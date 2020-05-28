-j 選項
=======

**-j** 選項用於控制球面上兩點間距離的計算方式。其語法爲：

    **-j**\ **e**\|\ **f**\|\ **g**

在計算地球或其它星體上任意兩點間的距離時，GMT 提供了三種不同的計算方式：
Flat Earth 距離、大圓路徑距離和測地距離。

- **-jg** 將地球當做球體，用大圓路徑公式計算球面距離，GMT默認使用此方式
- **-jf** 使用Flat Earth公式計算球面距離
- **-je** 使用測地公式計算球面距離，計算距離時考慮了地球橢率

三種方法的計算精度由低到高，計算速度由高到低。
用戶可以根據自己的需求選擇適合的距離計算方式。

Flat Earth距離
--------------

地球上任意兩點 A 和 B 的 Flat Earth 距離計算公式：

.. math::

   d_f = R \sqrt{(\theta_A - \theta_B)^2 + (\cos \left [ \frac{\theta_A + \theta_B}{2} \right ] \Delta \lambda)^2}

其中 R 是地球平均半徑（由參數 :term:`PROJ_MEAN_RADIUS` 控制），
:math:`\theta` 是緯度，
:math:`\Delta \lambda = \lambda_A - \lambda_B` 是經度差。
式中地理座標的單位均是弧度，且需要考慮到跨越經度的週期性問題。

該方法的特點是計算速度快但精度不高，適用於緯度相差不大且對計算效率要求比較高的情況。

大圓路徑距離
------------

該方法將地球近似爲一個半徑爲R的球，地球上任意兩點 A 和 B 的大圓路徑距離可以用
`Haversine 公式 <https://en.wikipedia.org/wiki/Haversine_formula>`_ 計算：

.. math::

   d_g = 2R \sin^{-1}  {\sqrt{\sin^2\frac{\theta_A - \theta_B}{2} + \cos
   \theta_A \cos \theta_B \sin^2 \frac{\lambda_A - \lambda_B}{2}} }

該方法是 GMT 默認使用的距離計算方法，適用於大多數情況。

有兩個 GMT 參數可以控制大圓路徑距離的計算細節，分別是：

- :term:`PROJ_MEAN_RADIUS` 地球平均半徑
- :term:`PROJ_AUX_LATITUDE` 指定將大地緯度轉換爲多個適合球狀
  近似的輔助緯度中的其中一個

需要注意，這兩個選項僅當 :term:`PROJ_ELLIPSOID` 不爲 **sphere** 時纔有效。

測地距離
--------

地球上兩點間的精確距離可以用 Vincenty (1975) 的完全橢球公式計算。
該方法計算得到的距離精度最高精確到 0.5 毫米，同時也是計算速度的最慢的方式。

除了 Vincenty 完全橢球公式外，還可以將參數 :term:`PROJ_GEODESIC`
設置成 **Rudoe** （GMT4所使用的計算公式）或 **Andoyer** （近似公式，精確到10米量級）
以使用不同的計算公式。
