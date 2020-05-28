.. index:: ! basemap
.. include:: common_SYN_OPTs.rst_

basemap
=======

:官方文檔: :doc:`gmt:basemap`
:簡介: 繪製底圖及邊框

該命令用於繪製：

- 繪製底圖邊框（標註、刻度、標籤等）、網格線和標題
- 繪製比例尺
- 繪製方向玫瑰、磁場玫瑰圖

語法
----

**gmt basemap** |-J|\ *parameters*
|SYN_OPT-Rz|
[ |-A|\ [*file*] ]
[ |SYN_OPT-B| ]
[ |-F|\ *box* ]
[ |-J|\ **z**\|\ **Z**\ *parameters* ]
[ |-L|\ *scalebar* ]
[ |SYN_OPT-U| ]
[ |-T|\ *rose* ]
[ |-T|\ *mag_rose* ]
[ |SYN_OPT-V| ]
[ |SYN_OPT-X| ]
[ |SYN_OPT-Y| ]
[ |SYN_OPT-f| ]
[ |SYN_OPT-p| ]
[ |SYN_OPT-t| ]
[ |SYN_OPT--| ]

必選選項
--------

**-B** **-L** **-T** 三個選項中必須至少使用一個。

.. include:: explain_-J.rst_

.. include:: explain_-R.rst_

.. include:: explain_-Rz.rst_

.. include:: explain_-B.rst_

.. include:: explain_-L_scale.rst_

.. include:: explain_-T_rose.rst_

可選選項
--------

.. _-A:

**-A**\ [*file*]
    不繪製圖形，僅輸出矩形底圖的邊框座標。

    該選項會將矩形底圖的邊框座標輸出到標準輸出或文件中。使用該選項時，必須通過
    **-J** 和 **-R** 指定繪圖區域，且不能再使用其他選項。
    若不指定 *file* 則默認輸出到標準輸出，否則輸出到文件 *file* 中。

    說明：

    #. 該選項似乎僅適用於矩形底圖邊框，非矩形邊框會輸出一堆NaN
    #. 邊框的採樣間隔由參數 :term:`MAP_LINE_STEP` 決定

.. _-F:

**-F**\ [**d**\|\ **l**\|\ **t**][**+c**\ *clearances*][**+g**\ *fill*][**+i**\ [[*gap*/]\ *pen*]][**+p**\ [*pen*]][**+r**\ [*radius*]][**+s**\ [[*dx*/*dy*/][*shade*]]]
    控制比例尺和方向玫瑰的背景面板屬性

    若只使用 **-F** 而不使用其它子選項，則會在比例尺或方向玫瑰的周圍繪製矩形邊框。
    下面簡單介紹各子選項，詳細用法見 :doc:`/basis/embellishment`

    - **+p**\ *pen* 指定背景面板的畫筆屬性（默認畫筆屬性由 :term:`MAP_FRAME_PEN` 決定）
    - **+g**\ *fill* 設置背景面板的填充色 [默認不填充]
    - **+c**\ *clearances* 以設置不同方向的空白間隔
    - **+i**\ *gap*/*pen* 在背景面板內部繪製一個額外的內邊框。\ *gap* 爲外邊框
      與內邊界之間的距離 [2p]，默認邊界屬性由 :term:`MAP_DEFAULT_PEN` 控制
    - **+r**\ *radius* 控制圓角矩形邊框，圓角矩形半徑 *radius* 默認爲 6p
    - **+s** 繪製背景面板陰影區。\ *dx*/*dy* 是陰影區相對於背景面板的偏移量 [4p/4p]。
      *shade* 爲陰影區的顏色 [gray50]。

    該選項默認會同時控制比例尺和方向玫瑰的背景邊框。
    加上 **d**\|\ **l**\|\ **t** 則表示只控制 **-D**\ 、\ **-L**\ 或 **-T**
    選項繪製的特徵。

.. include:: explain_-U.rst_

.. include:: explain_-V.rst_

.. include:: explain_-XY.rst_

.. include:: explain_-f.rst_

.. include:: explain_perspective.rst_

.. include:: explain_-t.rst_

.. include:: explain_help.rst_

示例
----

下圖展示了繪製方向玫瑰圖時 **+f** 取不同值的效果：

.. gmtplot:: basemap/dir_rose.sh
   :width: 80%
   :show-code: true

   方向玫瑰圖

下圖展示了磁場玫瑰圖以及相關配置參數：

.. gmtplot:: basemap/mag_rose.sh
   :width: 80%

   磁場玫瑰圖
