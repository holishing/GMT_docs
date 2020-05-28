-Ju：通用橫向Mercator(UTM)投影
==============================

維基鏈接：https://en.wikipedia.org/wiki/Universal_Transverse_Mercator_coordinate_system

通用橫向Mercator(UTM)投影是橫向Mercator投影的一個特殊子集。此處，全球在南北緯84度
之間被劃分爲60個區域，大多數區域的寬度都是6度。每一個區域都有各自位移的中心經線。
進一步，每個區域都被劃分爲緯度帶。

.. gmtplot:: /scripts/GMT_utm_zones.sh
    :show-code: false
    :caption: 通用橫向Mercator區域佈局
    :width: 85%

該投影的參數爲：

**-JU**\ *zone*/*width*
或
**-Ju**\ *zone*/*scale*

其中 *zone* 可以取1-60、A、B、Y、Z，負值表示南半球的區域，也可以加上C-H
以及J-N來指定緯度帶。

爲了讓任意指定區域的畸變最小化，公式中乘以了比例因子0.9996，這個值可以通過修改
:term:`PROJ_SCALE_FACTOR` 以自定義。這是的UTM投影是割線投影
而不是切線投影，在赤道處比例尺的畸變只有千分之一。在中心經線附近10度範圍內的
橢球投影表達式都是精確的。對於更大的區域，則在一般球狀公式中使用保角緯度作爲代替。
