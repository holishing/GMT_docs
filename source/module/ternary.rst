.. index:: ! ternary
.. include:: common_SYN_OPTs.rst_

ternary
=======

:官方文件: :doc:`gmt:ternary`
:簡介: 繪製三角圖解

**ternary** 從文件或者標準輸入中讀取數據，並在三角圖中繪製符號。
如果給定符號類型，但未給出符號大小，\ **ternary** 會將第四列數據作爲符號大小，
符號大小值小於0的將會被跳過。如果沒指定符號類型，就必須在數據的最後一列給出符號代碼。

語法
----

**gmt ternary** [ *table* ]
[ **-JX**\ *width*\ [unit] ]
[ |SYN_OPT-Rz| ]
[ |SYN_OPT-B| ]
[ |-C|\ *cpt* ]
[ |-G|\ *fill* ]
[ |-L|\ *a*\ /*b*\ /*c* ]
[ |-M| ]
[ |-N| ]
[ |-S|\ [*symbol*][*size*\ [**u**] ]
[ |SYN_OPT-U| ]
[ |SYN_OPT-V| ]
[ |-W|\ [*pen*][*attr*] ]
[ |SYN_OPT-X| ]
[ |SYN_OPT-Y| ]
[ |SYN_OPT-a| ]
[ |SYN_OPT-bi| ]
[ |SYN_OPT-di| ]
[ |SYN_OPT-e| ]
[ |SYN_OPT-f| ]
[ |SYN_OPT-g| ]
[ |SYN_OPT-h| ]
[ |SYN_OPT-i| ]
[ |SYN_OPT-p| ]
[ |SYN_OPT-t| ]
[ |SYN_OPT-:| ]
[ |SYN_OPT--| ]

必須選項
--------

必須使用 **-M** 或者 **-R** 和 **-J**\ 。

可選選項
--------

.. include:: explain_intables.rst_

.. _-B:

**-B**\ [**a**\|\ **b**\|\ **c**]\ *args*
    設置三角圖的三條邊的屬性。

    與常規圖不同，三角圖有三條不同的邊。三條邊從下面這條邊開始，
    逆時針旋轉，分別稱爲 **a**\ 、\ **b**\ 、\ **c**\ 。
    其餘用法與標準選項 **-B** 相同。

.. _-C:

**-C**\ *cpt*
    使用CPT文件，或者直接使用 **-C**\ *color1,color2*\ [*,color3*\ ,...] 自動建立一個線性連續CPT文件。

    若使用了 **-S** 選項，則符號填充色由第四列數值決定，其它字段向右移動一列
    （即若需要指定符號大小，符號大小應置於第5列）。

    現代模式下，若不指定CPT，則使用當前CPT。

.. _-G:

**-G**\ *fill*
    指定符號填充色。

    對於多段數據，段頭記錄中的 **-G** 字符串會覆蓋命令行中該選項的值。

.. _-J:

**-JX**\ *width*\ [*unit*]
    指定三角圖的寬度

.. _-L:

**-L**\ *a*\ /*b*\ /*c*
    設置三個頂點的標籤，標籤距離頂點的距離爲 :term:`MAP_LABEL_OFFSET` 三倍。

.. _-M:

**-M**
    不繪圖。將三角圖數據 (*a*,\ *b*,\ *c*\ [,\ *z*]) 轉換爲笛卡爾座標
    (*x*,\ *y*,\ [,\ *z*])，x,y 爲在三角圖解中的歸一化座標值。
    x 的取值範圍爲0-1，y 的取值範圍爲0到 :math:`\frac{\sqrt{3}}{2}`

    如果一個點在三角圖中座標爲（a，b，c），則笛卡爾座標(x, y)爲:

    .. math::

        x = \frac{(100-a)+b}{2\times100}

        y =\frac{\sqrt{3}}{2\times 100}\times c

.. _-N:

**-N**
    不裁剪落在三角圖外的符號 [默認只繪製三角圖內的符號]

.. _-R:

**-R**\ *amin/amax/bmin/bmax/cmin/cmax*
    指定三條邊 **a**\ 、\ **b** 和 **c** 的最大最小值。

.. _-S:

**-S**\ [*symbol*][*size*\ [**u**]]
    指定要繪製的符號類型及大小

    詳見 :doc:`plot` 中的 **-S** 選項。

.. include:: explain_-U.rst_

.. include:: explain_-V.rst_

.. _-W:

**-W**\ [*pen*][*attr*]
    設置符號的畫筆屬性。

.. include:: explain_-t.rst_

.. include:: explain_-XY.rst_

.. include:: explain_-bi.rst_

.. include:: explain_-di.rst_

.. include:: explain_-e.rst_

.. include:: explain_-f.rst_

.. include:: explain_-g.rst_

.. include:: explain_-h.rst_

.. include:: explain_-icols.rst_

.. include:: explain_colon.rst_

.. include:: explain_perspective.rst_

.. include:: explain_-t.rst_

.. include:: explain_help.rst_

示例
----

.. gmtplot::
   :width: 70%

    gmt begin map pdf,png
    gmt makecpt -Cturbo -T0/80/10
    gmt ternary @ternary.txt -R0/100/0/100/0/100 -JX6i -Sc0.1c -C -LWater/Air/Limestone \
        -Baafg+l"Water component"+u" %" -Bbafg+l"Air component"+u" %" -Bcagf+l"Limestone component"+u" %" \
        -B+givory+t"Example data from MATLAB Central"
    gmt end show

相關模塊
--------

:doc:`basemap`,
:doc:`plot`,
:doc:`plot3d`
