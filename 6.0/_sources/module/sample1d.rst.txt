.. index:: ! sample1d

sample1d
========

:官方文件: :doc:`gmt:sample1d`
:簡介: 對1D表數據進行重採樣

該命令既可以對常規的一維數據（比如時間序列，自變量爲時間）進行重採樣，也可以
對地理座標下的測線進行重採樣。

可選選項
--------

``<table>``
    多列表數據，其中某一列是自變量，其他列爲因變量。自變量所在列必須遞增或遞減。
    本頁面將自變量稱爲“時間”，因爲該命令常用於處理時間序列，實際上自變量可以是
    任意物理量

``-Af|p|m|r|R[+l]``
    指定插值方式。

    - ``-Af`` 保留原始數據點，若有必要，則在原始數據點的中間加上額外的點
    - ``-Am`` 對測線進行採樣時，先沿着Y方向，再沿着X方向
    - ``-Ap`` 對測線進行採樣時，先沿着X方向，再沿着Y方向
    - ``-Ar`` 等間距採樣
    - ``-AR`` 等間距採樣，但會調整間距以適應自變量的原始長度
    - ``+l`` if distances should be measured along rhumb lines (loxodromes)

``-Fl|a|c|n[+1|+2]``
    插值方式

    - ``l`` 線性插值
    - ``a`` Akima樣條插值
    - ``c`` natural cubic spline
    - ``n`` 不插值，取最近的數據點作爲插值後的值
    - ``+1|+2`` 插值的同時計算spline的一階或二階插值

``-I<inc>[<unit>]``
    默認的等間隔採樣間隔是自變量第一個和第二個數據點的間隔，該選項可以自定義
    採樣間隔 ``<inc>`` 。

    加上 ``<unit>`` 表明數據文件的前兩列包含經緯度信息，重採樣後的測線的採樣
    間隔的單位是 ``<units>`` 。若想要採樣笛卡爾座標下的(x,y)，則需要指定單位
    爲 ``c`` 。

``-N<knotfile>``
    ``<knotfile>`` 中包含了一系列X座標軸，使用該選項則會將原始數據插值到這些
    X座標軸數據點上。

``-S<start>[/<stop>]``
    對於等間隔採樣而言， ``<start>`` 是第一個輸出值的X位置， ``<stop>`` 是
    最後一個輸出值的X位置。

``-T<col>``
    指定輸入數據中的哪列數據是自變量。

示例
----

輸入數據的格式爲::

    time distance gravity magnetics bathymetry

使用Akima spline插值方式將其採樣爲1千米等間隔::

    gmt sample1d profiles.tdgmb -I1 -Fa -T1 > profiles_equi_d.tdgmb

將0到6之間的數據用cubic spline方式重採樣爲0.01間隔，不輸出數據而是輸出一階偏導（即斜率）::

    gmt sample1d points.txt -S0/6 -I0.01 -Fc+1 > slopes.txt

測線數據中包含經度、緯度和深度，將其採樣爲每2海里一個點::

    gmt sample1d track.txt -I2n -AR > new_track.dt

同上，但確保包含了原始數據點::

    gmt sample1d track.txt -I2n -Af > new_track.dt

To obtain a rhumb line (loxodrome) sampled every 5 km instead::

    gmt sample1d track.txt -I5k -AR+l > new_track.dt
