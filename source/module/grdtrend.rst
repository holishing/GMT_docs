.. index:: ! grdtrend

grdtrend
==========

:官方文件: :doc:`gmt:grdtrend`
:簡介: 擬合網格的趨勢面並計算殘差

該命令會讀取一個2D網格檔，並用最小二乘方法擬合一個低階多項式趨勢面。
多項式趨勢面的定義爲：

    m1 + m2\*x + m3\*y + m4\*x\*y + m5\*x\*x + m6\*y\*y + m7\*x\*x\*x +
    m8\*x\*x\*y + m9\*x\*y\*y + m10\*y\*y\*y.

必選選項
--------

``<gridfile>``
    2D網格檔名

``-N<n_model>[+r]``
    指定要擬合的模型。

    ``<n_model>`` 指定要擬合的模型的參數個數。例如 ``-N3`` 表示bilinear趨勢，
    ``-N6`` 表示 quadratic趨勢面。加上 ``+r`` 表示robust擬合，此時，程序會根據
    robust scale estimate多次迭代，給數據重新賦予權重，以得到一個對outliers
    不敏感的解。

可選選項
--------

``-D<diff.nc>``
    將殘差（輸入減去擬合）結果寫到網格檔中

``-T<trend.nc>``
    將擬合得到的趨勢文件寫到網格檔 ``<trend.nc>`` 中

``-W<weight.nc>``
    若 ``<weight.nc>`` 存在，則讀取該文件，並求解一個有權重的最小二乘問題。
    默認爲常規的最小二乘擬合。若 ``-N`` 選項中指定了robust擬合，則robust擬閤中
    所使用的權重會寫到文件 ``<weight.nc>`` 中。

示例
----

從網格檔中移除線性趨勢，並將結果寫到殘差文件中::

    gmt grdtrend hawaii_topo.nc -N3 -Dhawaii_residual.nc

對網格檔做bicubic面的robust擬合::

    gmt grdtrend hawaii_topo.nc -N10r -Thawaii_trend.nc -Whawaii_weight.nc -V
