-Jk：Eckert投影
===============

維基鏈接：

- https://en.wikipedia.org/wiki/Eckert_IV_projection
- https://en.wikipedia.org/wiki/Eckert_VI_projection

Eckert IV和VI投影由Max Eckert-Greiffendorff於1906年提出，是僞圓柱等面積投影。
中心經線以及所有的緯線都是執行，其餘經線是等間隔分佈的橢圓弧（IV）或正弦曲線（VI）。
比例尺在緯線40°30'（IV）和49°16'（VI）是真實的。\ **-JKf**\ （f代表four）表示
使用Eckert IV投影，\ **-JKs**\ （s代表six）表示使用Eckert VI投影。
若不指定 **f** 或 **s**\ ，則默認使用Eckert VI投影。

該選項的參數爲:

**-JK**\ [**f**\|\ **s**][*lon*/]\ *width*
或
**-Jk**\ [**f**\|\ **s**][*lon*/]\ *scale*

*lon* 爲中心經線，默認值爲地圖區域的中心。

Eckert IV示例：

.. gmtplot::
    :caption: Eckert IV投影繪製全球圖
    :width: 85%

    gmt coast -Rg -JKf4.5i -Bg -Dc -A10000 -Wthinnest -Givory -Sbisque3 -png GMT_eckert4

Eckert VI示例:

.. gmtplot::
    :caption: Eckert VI投影繪製全球圖
    :width: 85%

    gmt coast -Rg -JKs4.5i -Bg -Dc -A10000 -Wthinnest -Givory -Sbisque3 -png GMT_eckert4
