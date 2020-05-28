.. index:: ! clip
.. include:: common_SYN_OPTs.rst_

clip
====

:官方文件: :doc:`gmt:clip`
:簡介: 打開或關閉多邊形裁剪路徑

該模塊會從輸入文件中讀取XY數據，由此構成一個或多個多邊形，進而構建出一個或
多個裁剪路徑。接下來的所有繪圖命令中，只有在多邊形內部的部分纔會被繪製。

爲了判斷某個點是在裁剪區域內還是在裁剪區域外，clip使用了“奇偶規則”。從任意
一點繪製一條任意方向的射線，若該射線穿過裁剪路徑線段奇數次，則該點位於裁剪
區域內；若穿過偶數次，則該點位於裁剪區域外。\ **-N** 選項可以顛倒內外的定義。

最後，記得再次調用 **gmt clip -C** 以關閉裁剪區域。

語法
----

**gmt clip** [ *table* ] |-J|\ *parameters* |-C|\ [*n*]
|SYN_OPT-Rz|
[ |-A|\ [**m**\|\ **p**\|\ **x**\|\ **y**] ]
[ |SYN_OPT-B| ]
|-J|\ **z**\|\ **Z**\ *parameters* ]
[ |-N| ]
[ |-T| ]
[ |SYN_OPT-U| ]
[ |SYN_OPT-V| ]
[ |-W|\ [*pen*] ]
[ |SYN_OPT-X| ]
[ |SYN_OPT-Y| ]
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

必選選項
--------

.. _-C:

**-C**\ [*n*]
    結束當前裁剪路徑。

    默認會關閉所有已開啓的裁剪路徑。使用 **-C**\ *n* 則僅關閉當前所有處於激活狀態下的
    裁剪路徑中的其中 *n* 個。

    若在開啓裁剪後有使用 **-X** 或 **-Y** 移動過座標原點，則在關閉裁剪路徑時也需要
    使用 **-X** 或 **-Y** 選項。

.. include:: explain_-J.rst_

.. include:: explain_-R.rst_

.. include:: explain_-Rz.rst_

可選選項
--------

.. include:: explain_intables.rst_

.. _-A:

**-A**\ [**m**\|\ **p**\|\ **x**\|\ **y**]
    修改兩點間的連接方式

    地理投影下，兩點之間默認沿着大圓弧連接。

    - **-A**\ ：忽略當前的投影方式，直接用直線連接兩點
    - **-Am**\ ：先沿着經線畫，再沿着緯線畫
    - **-Ap**\ ：先沿着緯線畫，再沿着經線畫

    笛卡爾座標下，兩點之間默認用直線連接。

    - **-Ax** 先沿着X軸畫，再沿着Y軸畫
    - **-Ay** 先沿着Y軸畫，再沿着X軸畫

.. include:: explain_-B.rst_

.. _-N:

**-N**
    反轉“區域內”和“區域外”的概念，即只有在多邊形外的部分纔是裁剪區域，繪圖時
    只有在多邊形外的纔會被繪製。該選項不能與 **-B** 選項連用。

.. _-T:

**-T**
    不需要任何輸入數據。根據 **-R** 選項將整個地圖區域裁剪出來，
    該選項不能與 **-B** 選項連用。

.. include:: explain_-U.rst_

.. include:: explain_-V.rst_

.. _-W:

**-W**\ *pen*
    繪製裁剪路徑的輪廓 [默認不繪製]

.. include:: explain_-XY.rst_

.. include:: explain_-bi.rst_

.. include:: explain_-di.rst_

.. include:: explain_-e.rst_

.. include:: explain_-f.rst_

.. include:: explain_-g.rst_

.. include:: explain_-h.rst_

.. include:: explain_-icols.rst_

.. include:: explain_perspective.rst_

.. include:: explain_-t.rst_

.. include:: explain_colon.rst_

.. include:: explain_help.rst_

示例
----

::

    gmt begin clip
    # 打開裁剪路徑
    gmt clip -R0/6/0/6 -Jx2.5c -W1p,blue << EOF
    0 0
    5 1
    5 5
    EOF
    # 其他繪圖命令
    gmt plot @tut_data.txt -Gred -Sc2c
    # 關閉裁剪路徑
    gmt clip -C -B
    gmt end show

相關模塊
--------

:doc:`basemap`,
:doc:`grdmask`,
:doc:`mask`
