.. index:: ! gmtlogo
.. include:: common_SYN_OPTs.rst_

gmtlogo
=======

:官方文件: :doc:`gmt:gmtlogo`
:說明: 在圖上繪製GMT的圖形logo

該模塊將GMT的圖形logo繪製在圖上。默認情況下，GMT的圖形logo默認寬2英寸，高1英寸，
將放在當前的繪圖原點處。

語法
----

**gmt logo** [ |-D|\ [**g**\|\ **j**\|\ **J**\|\ **n**\|\ **x**]\ *refpoint*\ **+w**\ *width*\ [**+j**\ *justify*]\ [**+o**\ *dx*\ [/*dy*]] ]
[ |-F|\ [**+c**\ *clearances*][**+g**\ *fill*][**+i**\ [[*gap*/]\ *pen*]][**+p**\ [*pen*]][**+r**\ [*radius*]][**+s**\ [[*dx*/*dy*/][*shade*]]] ]
[ |-J|\ *parameters* ] [ |-J|\ **z**\|\ **Z**\ *parameters* ]
[ |SYN_OPT-Rz| ]
[ |-S|\ [**l**\|\ **n**\|\ **u**] ]
[ |SYN_OPT-U| ]
[ |SYN_OPT-V| ]
[ |SYN_OPT-X| ]
[ |SYN_OPT-Y| ]
[ |SYN_OPT-t| ]
[ |SYN_OPT--| ]

必選選項
--------

無

可選選項
--------

.. _-D:

**-D**\ [**g**\|\ **j**\|\ **J**\|\ **n**\|\ **x**]\ *refpoint*\ **+w**\ *width*\ [**+j**\ *justify*]\ [**+o**\ *dx*\ [/*dy*]]
    設置logo在圖中的位置

    簡單介紹各子選項的含義，詳情見 :doc:`/basis/embellishment`

    - **g**\|\ **j**\|\ **J**\|\ **n**\|\ **x**]\ *refpoint*\ 指定地圖上的參考點

      - **g** 指定某地圖座標位參考點
      - **j**\|\ **J** 通過2字母的對齊方式碼指定矩形區域的某個錨點作爲參考點
      - **n** 在歸一化座標系（即0-1）中指定參考點
      - **x** 在繪圖座標系下指定參考點

    - **+j**\ *justify* 指定logo上的錨點（默認錨點爲logo的左下角(BL)）
    - **+o**\ *dx*/*dy* 在參考點的基礎上設置比例尺的額外偏移量
    - **+w**\ *width* 設置logo的寬度

.. _-F:

**-F**\ [**+c**\ *clearances*][**+g**\ *fill*][**+i**\ [[*gap*/]\ *pen*]][**+p**\ [*pen*]][**+r**\ [*radius*]][**+s**\ [[*dx*/*dy*/][*shade*]]]
    控制GMT logo的背景面板屬性

    若只使用 **-F** 而不使用其它子選項，則會在 GMT logo 周圍繪製矩形邊框。
    下面簡單介紹各子選項，詳細用法見 :doc:`/basis/embellishment`

    - **+p**\ *pen* 指定背景面板的畫筆屬性（默認畫筆屬性由 :term:`MAP_FRAME_PEN` 決定）
    - **+g**\ *fill* 設置背景面板的填充色 [默認不填充]
    - **+c**\ *clearances* 以設置不同方向的空白間隔
    - **+i**\ *gap*/*pen* 在背景面板內部繪製一個額外的內邊框。\ *gap* 爲外邊框
      與內邊界之間的距離 [2p]，默認邊界屬性由 :term:`MAP_DEFAULT_PEN` 控制
    - **+r**\ *radius* 控制圓角矩形邊框，圓角矩形半徑 *radius* 默認爲 6p
    - **+s** 繪製背景面板陰影區。\ *dx*/*dy* 是陰影區相對於背景面板的偏移量 [4p/4p]。
      *shade* 爲陰影區的顏色 [gray50]。

.. include:: explain_-R.rst_
.. include:: explain_-Rz.rst_

.. _-S:

**-S**\ [**l**\|\ **n**\|\ **u**]
    控制GMT logo中地圖下方的文字

    - **l** 添加文字“The Generic Mapping Tools” [默認值]
    - **n** 不添加文字
    - **u** 添加GMT網站鏈接

.. include:: explain_-U.rst_

.. include:: explain_-V.rst_

.. include:: explain_-XY.rst_

.. include:: explain_-t.rst_

.. include:: explain_help.rst_

示例
----

單獨繪製一個2英寸寬的GMT logo::

    gmt logo -pdf map

將GMT logo作爲一個圖層放在當前底圖的右上角：

.. gmtplot::
   :width: 80%

   gmt begin logo pdf,png
   gmt basemap -R0/10/0/10 -JX10c/5c -Baf
   gmt logo -DjTL+w1i
   gmt end show

注意
----

若想要繪製鏈接到GMT官網的二維碼，可以使用 :doc:`plot` 提供的自定義符號
**QR** 和 **QR_transparent**\ 。

相關模塊
--------

:doc:`legend`,
:doc:`image`,
:doc:`colorbar`,
:doc:`plot`
