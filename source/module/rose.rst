.. index:: ! rose

rose
====

:官方文件: :doc:`gmt:rose`
:簡介: 繪製極座標下的直方圖（sector圖、rose圖或windrose圖）

可選選項
--------

``<table>``
    輸入文件，數據格式爲 ``length  azimuth``

    若輸入文件中只有azimuth一列數據，則此時需要使用 ``-i0`` 選項，此時所有的
    長度都默認爲單位長度。

``-A[r]<sector_width>``
    指定扇頁寬度，單位爲度

    #. 默認扇頁寬度爲0，即windrose圖
    #. 若扇頁寬度不爲0，則表示繪製sector圖
    #. 若扇頁寬度不爲0且使用了 ``-Ar`` ，則表示繪製rose圖

``-B``
    此模塊中，X表示徑向距離，Y表示方位角。Y軸的標籤是圖片的標題，比例尺長度由
    徑向網格間隔決定。

``-Cm[+w]<mode_file>``
    繪製矢量以顯示 ``<mode_file>`` 中指定的主方向。

    使用 ``-Cm`` 則計算並繪製平均方向。使用 ``-Cm+w<mode_file>`` 則將計算得到的
    平均方向及其他統計結果以如下格式保存到文件中::

        mean_az, mean_r, mean_resultant, max_r, scaled_mean_r, length_sum, n, sign@alpha

    其中最後一項可以取0或1，取決於平均結果是否significant at the level of
    confidence set via **-Q**.

``-D``
    對扇頁對偏移，使得其位於每個間隔的中間，即第一個扇頁的中心在0度處

``-F``
    不繪製scale length bar，默認會在右下角繪製

``-G<fill>``
    繪製扇頁的填充色

``-I``
    不繪製圖形，只計算 ``-R`` 選項所需要的參數。

    以下統計信息會輸出到標準輸出::

        n, mean az, mean r, mean resultant length, max bin sum, scaled mean, linear length sum

``-L[<wlabel>,<elabel>,<slabel>,<nlabel>]``
    指定0、90、180、270度處的標籤。

    #. 對於full-circle圖而言，默認值爲 ``WEST,EAST,SOUTH,NORTH``
    #. 對於half-circle圖而言，默認值爲 ``90W,90E,-,0`` ，其中 ``-`` 表示不顯示標籤
    #. 只使用 ``-L`` 但無其他參數表示不顯示所有標籤

``-M<parameters>``
    與 ``-C`` 選項一起使用以修改矢量的屬性。具體屬性見 :doc:`/basis/vector` 一節

``-Q[<alpha>]``
    設置置信水平，用於決定平均結果是否顯著，默認值爲 0.05。

    注意：臨界值是近似結果且需要至少10個數據點；the critical resultants are
    accurate to at least 3 significant digits. 對於更小的數據集，
    需要查詢準確的統計表。

``-R<r0>/<r1>/<az_0>/<az_1>``
    指定繪圖的半徑和方位角範圍。

    - ``r0`` 取 0
    - ``r1`` 取最大長度
    - 方位角範圍取 ``-90/90`` 或 ``0/180`` 以繪製half circle plot
    - 方位角範圍取 ``0/360`` 以繪製 full circle


``-S[n]<plot_radius>[u]``
    指定圓的半徑。

    ``-Sn`` 會將輸入的半徑歸一化到0到1。

``-T``
    指定輸入數據爲 orientation 數據（即數據範圍在0-180度範圍內）而不是0-360度
    範圍的direction數據。We compensate by counting each record twice:
    First as *azimuth* and second as *azimuth + 180*.
    Ignored if range is given as -90/90 or 0/180.

``-W[v]<pen>``
    設置扇區邊框的畫筆屬性。

    ``-Wv<pen>`` 可用於設置繪製矢量時所需的畫筆屬性。

``-Zu|<scale>``
    將數據的半徑乘以 ``<scale>`` ，比如 ``-Z0.001`` 會將數據的單位從m變成km。

    若不考慮半徑，可以通過 ``-Zu`` 將所有的半徑設置爲單位長度。

``-:``
    輸入數據爲 ``azimuth, radus`` 而不是 ``radius, azimuth``

.. include:: explain_-U.rst_

.. include:: explain_-t.rst_
