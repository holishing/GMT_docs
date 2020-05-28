繪製線段和多邊形
================

繪製線條和多邊形是日常繪圖最常見的需求之一，也是所有繪圖軟件必備的功能。
這一節我們將學習如何使用 GMT 的 :doc:`/module/plot` 模塊繪製線段和多邊形。

繪製一條線段
------------

要繪製一條線段，就必須提供線段上數據點的信息，即數據的X座標和Y座標。
:doc:`/module/plot` 會自動將輸入數據中相鄰的兩點連接起來。

以下面的數據爲例，這個數據中包含了三個座標點 (2,2)、(8,2) 和 (5,7)::

    2   2
    8   2
    5   7

下面的例子中，我們首先使用 UNIX 下的 ``cat`` 命令將數據寫入到文件
:file:`points.dat` 中，然後使用 **basemap** 模塊繪製了一張底圖，
並使用 **plot** 模塊繪製輸入文件 :file:`points.dat` 中的數據。

.. warning::

    下面的幾行代碼的作用是將兩個EOF中間的三行數據保存到文件 :file:`points.dat` 中::

        cat > points.dat << EOF
        2   2
        8   2
        5   7
        EOF

    **需要注意：Windows Batch 不支持 EOF 語法！**
    因而Batch用戶需要使用::

        echo 2 2  > points.dat
        echo 8 2 >> points.dat
        echo 5 7 >> points.dat

    將數據寫到文件 :file:`points.dat`\ 。
    其它示例也有相同的問題，Batch用戶自行修改，不再專門解釋。

圖中，\ **plot** 模塊在繪圖時自動將三個點連接起來，繪製出了一條線段。

.. gmtplot::
    :width: 50%

    cat > points.dat << EOF
    2   2
    8   2
    5   7
    EOF

    gmt begin SimpleLine png,pdf
        gmt basemap -JX10c -R0/10/0/10 -Baf
        gmt plot points.dat
    gmt end show

想要修改線段的粗細或顏色？很簡單，可以使用 **plot** 模塊的 **-W** 選項設置畫筆屬性。
畫筆屬性包括三個部分：線寬、顏色以及線型，三者之間用逗號隔開。

下面的腳本中，我們給 **plot** 模塊添加了 **-W2p,red,-** 選項，
即設置了畫筆屬性爲 **2p** 寬的紅色虛線。\ **p** 是GMT中的一個長度單位。

.. gmtplot::
    :width: 50%

    cat > points.dat << EOF
    2   2
    8   2
    5   7
    EOF

    gmt begin SimpleLine png,pdf
        gmt basemap -JX10c -R0/10/0/10 -Baf
        gmt plot points.dat -W2p,red,-
    gmt end show

你可以嘗試修改線寬、顏色和線型，並查看繪圖效果。幾種常見的線型包括
``-``\ 、\ ``.``\ 、\ ``.-``\ 和 \ ``-.``\ 。

繪製一個多邊形
--------------

**plot** 在繪製線段時默認是不將線段首尾連接起來的，
可以使用 **-L** 選項將線段的首尾連接起來，構成了一個閉合多邊形。

.. gmtplot::
    :width: 50%

    cat > points.dat << EOF
    2   2
    8   2
    5   7
    EOF

    gmt begin polygon png,pdf
        gmt basemap -JX10c -R0/10/0/10 -Baf
        gmt plot points.dat -W4p,lightblue -L
    gmt end show

我們還可以使用 **-G** 選項爲閉合多邊形填充顏色。

.. gmtplot::
    :width: 50%

    cat > points.dat << EOF
    2   2
    8   2
    5   7
    EOF

    gmt begin polygon png,pdf
        gmt basemap -JX10c -R0/10/0/10 -Baf
        gmt plot points.dat -W4p,lightblue -Glightred -L
    gmt end show

這樣我們就得到了一個內部爲淺紅色、輪廓爲淺藍色的多邊形了。如果只想要填充顏色而不繪製輪廓，
只需要使用 **-G** 而不使用 **-W** 即可。

.. gmtplot::
    :width: 50%

    cat > points.dat << EOF
    2   2
    8   2
    5   7
    EOF

    gmt begin polygon png,pdf
        gmt basemap -JX10c -R0/10/0/10 -Baf
        gmt plot points.dat -Glightred -L
    gmt end show

繪製多條線段
------------

學會了如何繪製一條線段，下面介紹如何一次性繪製很多條線段。
可以將所有線段的數據點都保存到一個輸入文件中，例如::

    >
    1 	2
    4 	2
    4 	8
    >
    9	2
    6 	2
    6	8

每個線段都包含了若干個數據點，在第一個數據點之前有一個 **>** 用於標記新的一段數據的開始。
這種數據稱之爲\ **多段數據**\ 。

與繪製一條線段的命令完全相同，由於輸入數據中有兩段數據，\ **plot** 模塊爲我們繪製出了
兩條線段。同樣的，兩條線段均爲線寬爲 **1p** 的紅色實線。

.. gmtplot::
    :width: 50%

    cat > lines.dat << EOF
    >
    1 	2
    4 	2
    4 	8
    >
    9	2
    6 	2
    6	8
    EOF

    gmt begin MultiLines png,pdf
        gmt basemap -JX10c -R0/10/0/10 -Baf
        gmt plot lines.dat -W1p,red
    gmt end show

繪製多個多邊形
--------------

使用相同的輸入數據，通過加上 **-L** 可以構成閉合多邊形，加上 **-G** 爲多邊形設置填充色。

.. gmtplot::
    :width: 50%

    cat > lines.dat << EOF
    >
    1 	2
    4 	2
    4 	8
    >
    9	2
    6 	2
    6	8
    EOF

    gmt begin MultiPolygons png,pdf
        gmt basemap -JX10c -R0/10/0/10 -Baf
        gmt plot lines.dat -W1p,red -L -Glightred
    gmt end show

大圓弧路徑
----------

在笛卡爾座標系下，繪製線段時，任意兩點之間會以直線方式連接；
而在地理投影下，任意兩點之間則使用大圓弧路徑方法會連接。
如果想要在地理投影下也是要直線連接兩點，則需要使用 **-A** 選項。

下面的命令中，我們首先使用 **coast** 繪製了一張全球地圖，接着使用 **plot** 模塊
繪製了地球上兩點之間的連線（紅色，以大圓弧路徑方式連接），然後，
我們加上了 **-A** 選項再次繪製了這兩點之間的連線（藍色，以直線方式連接）。
從中可以看到 **-A** 選項的效果。

.. gmtplot::
    :width: 80%

    cat > twopoints.dat << EOF
    115		30
    250 	30
    EOF

    gmt begin map png,pdf
        gmt coast -JH180/12c -Rg -B0 -W0.5p -A10000
        gmt plot twopoints.dat -W2p,red
        gmt plot twopoints.dat -W2p,blue -A
    gmt end show
