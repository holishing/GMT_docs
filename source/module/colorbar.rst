.. index:: ! colorbar
.. include:: common_SYN_OPTs.rst_

colorbar
========

:官方文件: :doc:`gmt:colorbar`
:簡介: 在地圖上繪製灰色或彩色色條

**gmt colorbar**
[ |SYN_OPT-B| ]
[ |-C|\ *cpt* ]
[ |-D|\ *refpoint* ]
[ |-F|\ *panel* ]
[ |-G|\ *zlo*\ /\ *zhi* ]
[ |-I|\ [*max\_intens*\|\ *low_i*/*high_i*] ]
[ |-J|\ *parameters* ]
[ |-J|\ **z**\|\ **Z**\ *parameters* ]
[ |-L|\ [**i**][*gap*] ]
[ |-M| ]
[ |-N|\ [**p**\|\ *dpi* ]]
[ |-Q| ]
[ |SYN_OPT-R| ]
[ |-S| ]
[ |SYN_OPT-U| ]
[ |SYN_OPT-V| ]
[ |-W|\ *scale* ]
[ |SYN_OPT-X| ]
[ |SYN_OPT-Y| ]
[ |-Z|\ *zfile* ]
[ |SYN_OPT-p| ]
[ |SYN_OPT-t| ]
[ |SYN_OPT--| ]

必選選項
--------

無

可選選項
--------

.. _-B:

**-B**\ [**p**\|\ **s**]\ *parameters*
    設置colorbar的標註、刻度和網格線間隔。

    在不使用 **-B** 選項或不指定標註間隔時，默認會根據CPT文件中每一行的內容
    對colorbar進行標註，具體見 :doc:`/cpt/index`\ 。\ **-B** 選項的具體說明
    見 :doc:`/option/B`\ 。

    默認情況下，對於水平colorbar而言，X軸的標籤會放在colorbar的下邊，Y軸標籤放在
    colorbar的右邊；對於垂直colorbar而言，X軸的標籤放在colorbar的右邊，Y軸標籤
    放在colorbar的上邊。除非在 **-D** 選項中使用了 **+m** 子選項。

.. _-C:

**-C**\ [*cpt*]
    要繪製的CPT文件。

    若CPT中Z值範圍單位爲米，而實際繪圖時想使用其它單位，則可在文件名後加上 **+U**\ *unit*\ 。
    若CPT中Z值範圍單位不爲米，而實際繪圖中想使用米爲單位，則可在文件名後加上 **+u**\ *unit*\ 。

    對於現代模式，若未指定 *cpt* 或者未使用 **-C** 選項，則使用當前CPT。
    經典模式下，若未指定 **-C** 則從標準輸入中讀入CPT。

**-D**\ [**g**\|\ **j**\|\ **J**\|\ **n**\|\ **x**]\ *refpoint*\ [**+w**\ *length*\ [/\ *width*]]\ [**+e**\ [**b**\|\ **f**][*length*]][**+h**\|\ **v**][**+j**\ *justify*]\ [**+m**\ [**a**\|\ **c**\|\ **l**\|\ **u**]][**+n**\ [*txt*]][**+o**\ *dx*\ [/*dy*]]
    指定色標的尺寸和位置。

    簡單介紹各子選項的含義，詳情見 :doc:`/basis/embellishment`

    - **g**\|\ **j**\|\ **J**\|\ **n**\|\ **x**]\ *refpoint*\ 指定地圖上的參考點

      - **g** 指定某地圖座標位參考點
      - **j**\|\ **J** 通過2字母的對齊方式碼指定矩形區域的某個錨點作爲參考點
      - **n** 在歸一化座標系（即0-1）中指定參考點
      - **x** 在繪圖座標系下指定參考點

    - **+j**\ *justify* 指定色標上的錨點，默認錨點是 **BL**
    - **+o**\ *dx*/*dy* 在參考點的基礎上設置色標的額外偏移量
    - **+w**\ *length*\ [/*width*] 指定色標的長度和寬度。若未指定寬度，則默認爲長度
      的4%；若長度爲負值則會反轉色標。
    - **+h** 繪製水平色標
    - **+v** 繪製垂直色標
    - **+e**\ [**b**\|\ **f**][*length*] 在CPT中爲前景色和背景色加一個三角形。
      **+ef** 表示只加前景色三角形，
      **+eb** 表示只加背景色三角形
      *length* 是三角的高度，默認爲色標寬度的一半。
    - **+m**\ [**a**\|\ **c**\|\ **l**\|\ **u**] 將標註、標籤和單位放在色標的另一邊。
      **a** 代表標註，
      **l** 代表標籤，
      **u** 代表單位。
      **c** 表示將標籤以單列字符垂直打印。
    - **+n**\ *text* 在色標開始處繪製一個矩形，並用NaN的顏色填充

    幾種常用的放置色標的方式：

    - 放在左邊: **-DjML+w2c/0.5c+o-1c/0c+m**
    - 放在右邊: **-DjMR+w2c/0.5c+o-1c/0c**
    - 放在上方: **-DjTC+w2c/0.5c+o0c/-1c+m**
    - 放在下方: **-DjBC+w2c/0.5c+o0c/-1c+m**
    - 放在左上角: **-DjTL+w2c/0.5c+o-1c/0c+m**
    - 放在左下角: **-DjBL+w2c/0.5c+o-1c/0c+m**
    - 放在右上角: **-DjTR+w2c/0.5c+o-1c/0c**
    - 放在右下角: **-DjBR+w2c/0.5c+o-1c/0c**

.. _-F:

**-F**\ [**+c**\ *clearances*][**+g**\ *fill*][**+i**\ [[*gap*/]\ *pen*]][**+p**\ [*pen*]][**+r**\ [*radius*]][**+s**\ [[*dx*/*dy*/][*shade*]]]
    控制色標後的背景邊框

    若只使用 **-F** 而不使用其它子選項，則會在色標周圍繪製矩形邊框。
    下面簡單介紹各子選項，詳細用法見 :doc:`/basis/embellishment`

    - **+p**\ *pen* 指定背景面板的畫筆屬性（默認畫筆屬性由 :term:`MAP_FRAME_PEN` 決定）
    - **+g**\ *fill* 設置背景面板的填充色 [默認不填充]
    - **+c**\ *clearances* 以設置不同方向的空白間隔
    - **+i**\ *gap*/*pen* 在背景面板內部繪製一個額外的內邊框。\ *gap* 爲外邊框
      與內邊界之間的距離 [2p]，默認邊界屬性由 :term:`MAP_DEFAULT_PEN` 控制
    - **+r**\ *radius* 控制圓角矩形邊框，圓角矩形半徑 *radius* 默認爲 6p
    - **+s** 繪製背景面板陰影區。\ *dx*/*dy* 是陰影區相對於背景面板的偏移量 [4p/4p]。
      *shade* 爲陰影區的顏色 [gray50]。

.. _-G:

**-G**\ *zlow*\ /\ *zhigh*
    對CPT文件做截斷，即只繪製 *zlow* 到 *zhigh* 之間的部分。
    若其中某個值等於NaN，則不對CPT的那一端做處理。

.. _-I:

**-I**\ [*max_intens*\|\ *low_i*/*high_i*]
    爲色標加上光照效果

    - **-I**\ *max_intens* 設置光照強度爲 [-\ *max_intens*, +\ *max_intens*]，默認值爲[-1,+1]
    - **-I**\ *low_i*/*high_i* 指定非對稱的光照強度範圍

.. include:: explain_-J.rst_

.. _-L:

**-L**\ [**i**][*gap*]
    生成等大小的顏色矩形。

    默認情況下，會根據CPT文件中Z值的範圍決定顏色矩形的大小。若使用該選項，則
    會忽略 **-B** 選項設置的間隔。若指定了 *gap* 且CPT文件是離散的，則使用
    每個矩形的Z值下邊界作爲標註且將標註放在矩形的正中間。
    若使用了 **i** 則標註每個間隔範圍。若使用了 **-I** 選項，則每個矩形有自己的
    顏色以及自己的光照強度。

.. _-M:

**-M**
    使用YIQ變換將色標變成單調灰度色標

.. _-N:

**-N**\ [**p**\|\ *dpi*]
    控制色標的圖形表示方式

    - **-Np** 用顏色矩形來表示（比如離散的顏色）
    - **-N** 用圖形表示（比如連續的顏色），可以加上 *dpi* 指定繪製色標時的等效DPI，默認值爲600

.. _-Q:

**-Q**
    使用對數座標，刻度表示爲10的次冪

    CPT文件中所有的Z值都會被轉換成 :math:`p = \log10(z)`\ ，其中整數的p會以10^p的格式標註。

.. include:: explain_-R.rst_

.. _-S:

**-S**
    去除不同色塊之間的黑色網格線

.. include:: explain_-U.rst_

.. include:: explain_-V.rst_

.. _-W:

**-W**\ *scale*
    將CPT文件中所有的Z值乘以比例因子 *scale*

.. include:: explain_-XY.rst_

.. _-Z:

**-Z**\ *zfile*
    *zfile* 文件用於指定每個顏色塊的寬度。

    默認情況下，顏色塊的寬度由顏色的Z值範圍決定，比如Z=0-100對應的色塊寬度是
    Z=100-150的色塊寬度的兩倍。

.. include:: explain_perspective.rst_

.. include:: explain_-t.rst_

.. include:: explain_help.rst_

示例
----

::

    gmt begin map
    gmt makecpt -T-200/1000/100 -Crainbow
    gmt colorbar -C -Dx8c/1c+w12c/0.5c+jTC+h -Bxaf+l"topography" -By+lkm
    gmt end


相關模塊
--------

:doc:`makecpt`
:doc:`gmtlogo`,
:doc:`grd2cpt`
:doc:`image`,
:doc:`legend`
