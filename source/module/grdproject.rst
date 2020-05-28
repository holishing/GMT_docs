.. index:: ! grdproject

grdproject
==========

:官方文件: :doc:`gmt:grdproject`
:簡介: 對網格數據做地圖變換和逆變換

該命令可以將地理座標下的網格數據投影到一個矩形網格中，也可以將一個矩形座標系下的
網格數據反投影到地理座標下。

必選選項
--------

``<in_grdfile>``
    要進行變換的2D網格數據

``-G<out_grdfile>``
    輸出的網格文件名

可選選項
--------

``-C[<dx>/<dy>]``
    默認投影后的座標是相對於區域的左下角，該選項使得投影后的座標相對於投影的中心。
    ``<dx>/<dy>`` 是要加到投影后座標的偏移量。

``-D<xinc>[<unit>][+e|n][/<yinc>[<unit>][+e|n]]``
    指定新網格的網格間隔。

``-E<dpi>``
    設置新網格的分辨率，即每英寸的點數。

``-F[c|i|p|e|f|k|M|n|u]``
    強制1:1比例，即輸出數據的單位是真實的投影長度，默認單位爲m。也可以指定爲
    其他單位。

``-I``
    逆變換，將矩形區域變換成地理區域。

``-Mc|i|p``
    指定投影后的測量單位，默認值由參數 ``PROJ_LENGTH_UNIT`` 決定。

示例
----

將地理網格數據變換成Mercator網格，分辨率爲300dpi::

    gmt grdproject dbdb5.nc -R20/50/12/25 -Jm0.25i -E300 -r -Gdbdb5_merc.nc

將網格數據逆變換爲地理網格::

    gmt grdproject topo_tm.nc -R-80/-70/20/40 -Jt-75/1:500000 -I -D5m -V -Gtopo.nc

將UTM（以米爲單位）下的網格數據逆變換爲地理網格::

    gmt grdproject topo_utm.nc -R203/205/60/65 -Ju5/1:1 -I -Mm -Gtopo.nc -V
