.. index:: ! gmtselect
.. include:: common_SYN_OPTs.rst_

gmtselect
=========

:官方文件: :doc:`gmt:gmtselect`
:簡介: 篩選符合某個特定準則的數據

該命令會從輸入文件中讀取前兩列作爲經度和緯度，並判斷該點是否符合一定的空間準則，
以篩選出符合條件的記錄。輸入文件中僅前兩列會被使用。

七個空間準則包括：

#. 在矩形區域內（ ``-R`` 和 ``-J`` ）
#. 與點文件中的每個點的距離在一定範圍之內
#. 與線文件中的每條線的距離在一定範圍之內
#. 在多邊形文件所指定的多邊形內
#. 在某個地理區域內（需要海岸線數據）
#. Z 值在某個範圍內
#. 該點所在的網格單元內具有有效值（即非零和非NaN的值）

七個空間準則
------------

準則1
+++++

使用 ``-R`` 和 ``-J`` 篩選出在該區域內的點::

    gmt select points.xy -R0/5/0/5

準則2
+++++

篩選所有與點文件中的每個點的距離在一定範圍內的點。

``-C<pointfile>+d<dist>[<unit>]``
    該準則會篩選出與文件 ``<pointfile>`` 中的每個點的距離在 ``<dist>``
    之內的記錄。

    若 ``<dist>`` 等於0，則 ``<pointfile>`` 中的第三列是每個數據點各自的
    影響半徑，即篩選出不在任何一個數據點的影響半徑內的點。默認情況下
    ``<dist>`` 是笛卡爾座標系下的距離，單位爲用戶單位。若指定 ``-fg``
    選項，則表明 ``<dist>`` 爲球面距離。若使用了 ``-R`` 和 ``-J`` ，則
    ``<dist>`` 表示投影后的紙面距離，單位由參數 ``PROJ_LENGTH_UNIT`` 決定。

準則3
+++++

篩選所有與線文件中的每條線的距離在一定範圍之內的點。

``-L<linefile>+d<dist>[<unit>][+p]``
    ``<linefile>`` 中包含了一系列線段，該準則會篩選出與這些線段的距離不超過
    ``<dist>`` 的記錄。

    若 ``<dist>`` 等於零，則可以在 ``<linefile>`` 中每段數據的段頭記錄中使用
    ``-D<dist>`` 參數，爲每個線段分別指定距離值。

    默認情況下 ``<dist>`` 是笛卡爾座標系下的距離，單位爲用戶單位。若指定
    ``-fg`` 選項，則表明 ``<dist>`` 爲球面距離。若使用了 ``-R`` 和 ``-J`` ，
    則 ``<dist>`` 表示投影后的紙面距離，單位由 ``PROJ_LENGTH_UNIT`` 決定。

    使用 ``+p`` 則會將數據點垂直投影到線段上，只有投影位置在線段的兩個端點內的
    記錄纔會被保留，即只有線段左右一定距離內的點纔會被保留，超過線段兩端點的點
    不會被保留。

準則4
+++++

篩選出在某個多邊形內的點。

``-F<polygonfile>``
    ``<polygonfile>`` 中可以包含一個或多個多邊形，該選項篩選出所有在多邊形內的
    記錄。

準則5
+++++

根據地理特徵信息篩選數據。

``-N<wet>/<dry>``
    跳過或保留陸地（dry）/海湖（wet）區域內的點。

    ``<wet>`` 和 ``<dry>`` 可以取 ``s`` 或 ``k`` ，分別表示 skip 和 keep。
    默認值爲 ``-Ns/k`` ，即保留所有位於陸地上的記錄，並跳過所有海洋、湖泊中的
    記錄。

``-N<ocean>/<land>/<lake>/<island>/<pond>``
    進一步細分地理特徵，五項分別表示海洋、陸地、湖泊、島嶼、池塘(?)。每一項均
    可以取 ``s`` 或 ``k`` ，分別表示 skip 和 keep。默認值爲 ``-Ns/k/s/k/s`` ，
    等效於 ``-Ns/k``，即僅保留所有陸地上的記錄。

``-D[a|f|h|i|l|c][+]``
    選擇海岸線數據的精度，僅與 ``-N`` 選項一起使用有效。見 :doc:`coast` 中
    ``-D`` 選項的介紹。

.. include:: explain_-A.rst_

準則6
+++++

篩選Z值在某個範圍內的點

``-Z<min>[/<max>][+c<col>]``
    判斷記錄的Z值是否在 ``<min>`` 到 ``<max>`` 之間或等於 NaN。

    若省略 ``<max>`` 則判斷Z值是否等於 ``<min>`` 。若不限制範圍的上限或下限，i
    可以使用 ``-`` 代替。

    若第三列Z值代表時間，想要判斷Z值是否在某個時間範圍內，需要使用 ``-f2T``
    選項。

    可以使用 ``+c<col>`` 指定記錄中的某一列作爲Z值，默認以第三列（col=2）
    作爲Z值。若想要對多列做類似的測試，可以重複使用 ``-Z`` 選項，每次指定
    不同的列號。注意：當多次使用 ``-N`` 選項時，不可使用 ``-Iz`` 選項。

準則7
+++++

根據數據點所在的網格單元內具有有效值（即非零和非NaN的值）來篩選數據。

``-G<gridmask>``
    使用 ``-G<gridmask>`` 指定一個網格檔。對於每個數據點而言，判斷其對應的
    網格單元是否具有有效值（即非零或非NaN的值），若該網格單元有有效值，則保留
    該數據點。

其他選項
--------

``-E[fn]``
    在判斷點是否在一個多邊形內時，默認會將恰好在多邊形邊界線上的點也認爲是在
    多邊形內，使用該選項會將多邊形上的點認爲是在多邊形外部。
    ``f`` 和 ``n`` 分別修改 ``-F`` 和 ``-N`` 選項的行爲。

``-I[cfglrsz]``
    對七個準則取反，即篩選出不符合準則的記錄。c、f、g、l、r、s、z分別對應於
    ``-C`` 、 ``-F`` 、 ``-G`` 、 ``-L`` 、 ``-R`` 、 ``-S`` 和 ``-Z`` 。

示例
----

篩選與 ``pts.txt`` 中所有點的距離在300 km以內，與 ``lines.txt`` 中線段的
距離在100 km以外的點::

    gmt select lonlatfile -fg -Cpts.txt+d300k -Llines.txt+d100k -Il > subset

此處需要使用 ``-fg`` 以告知程序正在處理地理數據。

篩選某個區域內所有不在陸地上的點::

    gmt select data.txt -R120/121/22/24 -Dh -Nk/s > subset

篩選 ``quakes.txt`` 中所有位於多邊形區域內的點::

    gmt select quakes.txt -Flonlatpath.txt -fg > subset

``stations.txt`` 中的點投影后與 ``origin.txt`` 的距離在5 cm之內的點::

    gmt select stations.txt -Corigin.txt+d5 -R20/50/-10/20 -JM20c \
        --PROJ_LENGTH_UNIT=cm > subset
