.. index:: ! grdmask

grdmask
=======

:官方文件: :doc:`gmt:grdmask`
:簡介: 根據多邊形數據或點數據創建mask網格檔

必選選項
--------

``<pathfiles>``
    一個或多個ASCII數據文件，其中包含了多邊形或數據點

``-G<mask_grd_file>``
    生成的mask網格檔的文件名

.. include:: explain_-I.rst_

可選選項
--------

``-A[m|p|x|y]``
    控制兩點之間的連接方式，見 :doc:`plot` 命令中對 ``-A`` 選項的介紹

``-N[z|Z|p|P]<values>``
    設置位於多邊形外部、邊界和內部的節點值，默認值爲 ``0/0/1`` ，即多邊形內部
    節點值爲1，其他節點值爲0。

    ``<values>`` 的形式爲 ``<out>/<edge>/<in>`` ，可以是任意數值，也可以是NaN。

    - ``-Nz`` 將多邊形內的節點設置爲從多段數據的段頭記錄中獲取的Z值，比如多邊
      形段頭記錄中的 ``-Z<zval>`` 、 ``-L<header>`` 或 ``-aZ=<name>``
    - ``-NZ`` 與 ``-Nz`` 類似，只是其會將多邊形的邊界也當做是多邊形的內部
    - ``-Np`` 使用一個從0遞增的數字作爲多邊形的ID，也可以在其後加上一個數字以
      指定序列的起始值
    - ``-NP`` 與 ``-Np`` 類似，只是其會將多邊形的邊界當做多邊形的內部

    需要注意， ``-Nz|Z|p|P`` 不能與 ``-S`` 連用。

``-S<search_radius>[<unit>]``
    對所有數據點設置一個搜索半徑，設置圓內、圓邊界、圓外部的節點值。

    若 ``<search_radius>`` 爲 ``z`` ，則取輸入數據的第三列作爲半徑。對於地理
    蘇滬劇而言，可以在 ``-Sz`` 後加上距離單位。

    若未使用 ``-S`` 選項，則認爲輸入數據是一個或多個閉合多邊形。

注意事項
--------

``grdlandmask`` 生成的網格檔屬於 **分類型** 數據，即所有數據只能取幾個固定的
值，比如 ``-N0/1`` 會將水域內的網格值設置爲0，將陸地內的網格值設置爲1。
在這種情況下，對這種數據用標準方法（比如樣條）進行插值通常會得到無意義的結果，
使用時需要小心。

然而，當你使用該網格檔繪製地圖時，網格數據會被重新投影使得在投影后的座標下
變成一個矩形。這個過程中涉及到了網格插值，默認使用的插值算法是樣條插值，因而
可能會在圖中產生假象。因而建議在使用 ``grdimage`` 繪製此類數據時使用 ``-nn``
選項即 nearest neighbor 插值算法以避免這一問題。

示例
----

多邊形內和邊界上的節點值爲0，外部值爲1::

    gmt grdmask coastline_*.xy -R-60/-40/-40/-30 -I5m -N1/0/0 -Gland_mask.nc=nb -V

數據點周圍50千米範圍的節點值爲1，其餘爲NaN::

    gmt grdmask data.xyz -R-60/-40/-40/-30 -I5m -NNaN/1/1 -S50k -Gdata_mask.nc=nb -V

將多邊形的ID作爲多邊形內部節點的值::

    gmt grdmask plates.gmt -R-40/40/-40/40 -I2m -Nz -Gplate_IDs.nc=ns -aZ=POL_ID -V

將多邊形的ID作爲多邊形內部節點的值，但多邊形ID從100開始::

    gmt grdmask plates.gmt -R-40/40/-40/40 -I2m -Np100 -Gplate_IDs.nc=ns -V
