-Jq：圓柱等距投影
=================

維基鏈接：https://en.wikipedia.org/wiki/Equirectangular_projection

這個簡單的圓柱投影是一個經度和緯度的線性縮放。最常用的形式是Plate Carrée投影，
其中對經線和緯線的縮放比例是相同的。所有的經緯線都是直線。

該投影的參數爲：

**-JQ**\ [*lon*/[*lat*]/]\ *width*
或
**-Jq**\ [*lon*/[*lat*]/]\ *scale*

- *lon* 是中心經線，默認爲地圖區域的中心
- *lat* 是標準緯線，默認爲赤道，若指定了標準緯線，則必須指定中心經線

.. gmtplot::
    :caption: 使用Plate Carrée投影繪製全球地圖
    :width: 85%

    gmt coast -Rg -JQ4.5i -B60f30g30 -Dc -A5000 -Gtan4 -Slightcyan -png GMT_equi_cyl

選擇不同的標準緯線，則可以獲取經度和緯度的不同縮放比例。流行的幾個標準緯線如下：

.. table::
   :align: center

   +-----------------------------------------------------+--------+
   +=====================================================+========+
   | Grafarend and Niermann, minimum linear distortion   | 61.7°  |
   +-----------------------------------------------------+--------+
   | Ronald Miller Equirectangular                       | 50.5°  |
   +-----------------------------------------------------+--------+
   | Ronald Miller, minimum continental distortion       | 43.5°  |
   +-----------------------------------------------------+--------+
   | Grafarend and Niermann                              | 42°    |
   +-----------------------------------------------------+--------+
   | Ronald Miller, minimum overall distortion           | 37.5°  |
   +-----------------------------------------------------+--------+
   | Plate Carrée, Simple Cylindrical, Plain/Plane       | 0°     |
   +-----------------------------------------------------+--------+
