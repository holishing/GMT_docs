.. index:: ! histogram
.. include:: common_SYN_OPTs.rst_

histogram
=========

:官方文件: :doc:`gmt:histogram`
:簡介: 統計並繪製直方圖

模塊會讀取數據中的第一列，對其進行統計，並繪製直方圖或累積直方圖。

語法
----

**gmt histogram** [ *table* ]
|-J|\ **x**\|\ **X**\ *parameters*
|-T|\ [*min/max*\ /]\ *inc*\ [**+n**] \|\ |-T|\ *file*\|\ *list*
[ |-A| ]
[ |SYN_OPT-B| ]
[ |-C|\ *cpt* ]
[ |-D|\ [**+b**][**+f**\ *font*][**+o**\ *off*][**+r**] ]
[ |-F| ]
[ |-G|\ *fill* ]
[ |-J|\ **z**\|\ **Z**\ *parameters* ]
[ |-I|\ [**o**\|\ **O**] ]
[ |-L|\ **l**\|\ **h**\|\ **b**] ]
[ |-N|\ [*mode*][**+p**\ *pen*] ]
[ |-Q|\ **r** ]
[ |SYN_OPT-R| ]
[ |-S| ]
[ |SYN_OPT-U| ]
[ |SYN_OPT-V| ]
[ |-W|\ *pen* ]
[ |SYN_OPT-X| ]
[ |SYN_OPT-Y| ]
[ |-Z|\ [*type*][**+w**] ]
[ |SYN_OPT-bi| ]
[ |SYN_OPT-di| ]
[ |SYN_OPT-e| ]
[ |SYN_OPT-f| ]
[ |SYN_OPT-h| ]
[ |SYN_OPT-i| ]
[ |SYN_OPT-p| ]
[ |SYN_OPT-t| ]
[ |SYN_OPT--| ]

必選選項
--------

.. _-J:

**-J**\ **x**\|\ **X**\ *parameters*

.. _-T:

**-T**\ [*min/max*\ /]\ *inc*\ [**+n**] \|\ **-T**\ *file*\|\ *list*
    指定統計對象的最小值min和最大值max

可選選項
--------

.. _-A:

**-A**
    繪製水平直方圖，默認繪製垂直直方圖

.. include:: explain_-B.rst_

.. _-C:

**-C**\ *cpt*
    指定CPT文件，將每個直方的中間值作爲Z值查詢CPT中的顏色

.. _-D:

**-D**\ [**+b**][**+f**\ *font*][**+o**\ *off*][**+r**]
    爲每個直方（bar）添加標註，其內容是每個直方的統計數目

    - **+b** 將標註放在直方的底部（默認爲頂部）
    - **+f**\ *font* 設置標註的字體
    - **+o**\ *offset* 修改標註與直方的距離（默認值爲6p）
    - **+r** 將標註從水平方向旋轉爲垂直方向

.. _-F:

**-F**
    center bin on each value（默認是左邊界）

    假設數據範圍是0到100，長條的寬度爲10。默認情況下，會將0到10作爲第一個bin，
    10到20作爲第二個bin，以此類推。若使用該選項，則第一個bin以0爲中心，即0到5
    是第一個bin，5到15是第二個bin，以此類推。

.. _-G:

**-G**\ *fill*
    設置直方的填充色

.. _-I:

**-I**\ [**o**\|\ **O**]
    返回計算結果不繪圖。

    - **-I** 返回 *xmin xmax ymin ymax*\ ，即數據的最小值、最大值和統計數量的最小值、最大值
    - **-Io** 輸出各個直方的的X值和Y值
    - **-IO** 輸出各個直方的的X值和Y值，即使Y=0

.. _-L:

**-Ll**\|\ **h**\|\ **b**
    設置超過統計範圍的數據的處理方式。

    - **-Ll** 小於第一個直方的統計範圍的數據算入第一個直方
    - **-Ih** 大於最後一個直方的統計範圍的數據算入最後一個直方
    - **-Ib** 小於第一個直方的統計範圍的數據算入第一個直方，
      並且大於最後一個直方的統計範圍的數據算入最後一個直方

.. _-N:

**-N**\ [*mode*][**+p**\ *pen*]
    繪製等效的正態分佈曲線

    *mode* 用於設定正態分佈的中間位置及比例：

    - mode=0：平均值和方差 (默認)
    - mode=1：平均值和 L1 範數
    - mode=2：最小二乘

    *pen* 用於指定曲線的屬性。該選項可以使用多次以繪製多條曲線。

.. _-Q:

**-Q**\ **r**
    繪製累計直方圖，\ **r** 繪製反向的累計直方圖

.. include:: explain_-R.rst_

.. include:: explain_-Rz.rst_

.. _-S:

**-S**
    繪製階梯狀直方圖，並且不包含直方內部的線條。

.. include:: explain_-U.rst_

.. include:: explain_-V.rst_

.. _-W:

**-W**\ *pen*
    設置直方邊框的畫筆屬性

.. include:: explain_-XY.rst_

.. _-Z:

**-Z**\ [*type*][**+w**]
    選項直方圖的種類

    - type=0：數量（默認值）
    - type=1：百分比
    - type=2：e爲底對數 (1.0 + 數量)
    - type=3：e爲底對數 (1.0 + 百分比)
    - type=4：10爲底對數 (1.0 + 數量)
    - type=5：10爲底對數 (1.0 + 百分比)

    若要使用第二列數據而不是count數作爲權重，可以加上 ``+w`` 選項。

.. include:: explain_-bi.rst_

.. include:: explain_-di.rst_

.. include:: explain_-e.rst_

.. include:: explain_-f.rst_

.. include:: explain_-h.rst_

.. include:: explain_-icols.rst_

.. include:: explain_perspective.rst_

.. include:: explain_-t.rst_

.. include:: explain_help.rst_

示例
----

訪問 :doc:`/tutorial/histogram/index` 以查看更多示例。
