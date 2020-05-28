.. index:: ! coupe
.. include:: common_SYN_OPTs.rst_

coupe
=====

:官方文檔: :doc:`gmt:supplements/seis/coupe`
:簡介: 繪製震源機制解的剖面圖

:doc:`meca` 在繪製震源球時，本質上是取了一個水平剖面，並將三維震源球的下半球
投影到該水平剖面上。而 :doc:`coupe` 則更靈活一些，可以將三維震源球投影到任意
一個剖面上（例如垂直平面）。

- 對於一個水平剖面，會將下半球投影到平面上（即 :doc:`meca` 的做法）
- 對於一個垂直剖面，會將垂直平面\ **後方** 的半球投影到平面上
- 對於任意一個非水平的平面而言：

  - 北方向爲平面的最速下降方向
  - 東方向爲平面的走向方向
  - 下方向則根據右手定則確定

語法
----

**gmt coupe** [ *files* ] |-J|\ *parameters*
|SYN_OPT-R| |-A|\ *parameters*
|-S|\ *<format><scale>*\ [**+f**\ *font*][**+j**\ *justify*][**+o**\ *dx*\ [/*dy*]]
[ |SYN_OPT-B| ]
[ |-E|\ *fill* ]
[ |-F|\ *mode*\ [*args*] ]
[ |-G|\ *fill* ]
[ |-L|\ *[pen]* ]
[ |-M| ] [ |-N| ]
[ |-Q| ]
[ |-T|\ *nplane*\ [/*pen*] ]
[ |SYN_OPT-U| ]
[ |SYN_OPT-V| ]
[ |-W|\ *pen* ]
[ |SYN_OPT-X| ]
[ |SYN_OPT-Y| ]
[ |-Z|\ *cpt* ]
[ |SYN_OPT-di| ]
[ |SYN_OPT-e| ]
[ |SYN_OPT-h| ]
[ |SYN_OPT-i| ]
[ |SYN_OPT-p| ]
[ |SYN_OPT-t| ]
[ |SYN_OPT-:| ]
[ |SYN_OPT--| ]

必須選項
--------

.. include:: explain_intables.rst_

.. include:: explain_-J.rst_

.. include:: explain_-R.rst_

.. _-A:

**-A**
    以多種方式指定剖面

**-Aa**\ *lon1/lat1/lon2/lat2/dip/p\_width/dmin/dmax*\ [**+f**]

    - *lon1/lat1* 剖面起點的經緯度
    - *lon2/lat2* 剖面終點的經緯度
    - *dip* 剖面所在平面的傾角（0表示水平剖面，90表示垂直剖面）
    - *p_width* 剖面的寬度（即剖面不是一個平面，而是一個有厚度的長方體）
    - *dmin/dmax* 是沿着最速下降方向（“北”方向）的最小、最大距離（對於垂直平面，可以理解爲限制地震深度範圍）
    - **+f** 表示根據剖面的參數自動計算邊框的範圍

**-Ab**\ *lon1/lat1/strike/p\_length/dip/p\_width/dmin/dmax*\ [**+f**]

    - *lon1/lat1* 剖面起點的經緯度
    - *strike* 是剖面的走向
    - *p_length* 是剖面的長度
    - 其他參數與 **-Aa** 相同

**-Ac**\ *x1/y1/x2/y2/dip/p\_width/dmin/dmax*\ [**+f**]

    與 **-Aa** 選項相同，只是 *x/y* 爲笛卡爾座標而不是地理座標

**-Ad**\ *x1/y1/strike/p\_length/dip/p\_width/dmin/dmax*\ [**+f**]
    與 **-Ab** 選項相同，只是 *x/y* 爲笛卡爾座標而不是地理座標

.. include:: explain_meca_-S.rst_

可選選項
--------

.. include:: explain_-B.rst_

.. _-E:

**-E**\ *fill*
    擴張部分的填充色 [默認爲白色]

.. _-F:

**-F**\ *mode*\ [*args*]
    設置多個屬性，可重複使用多次

**-Fs**\ *symbol*\ [*size*][**+f**\ *font*][**+j**\ *justify*][**+o**\ *dx*\ [/*dy*]]
    不繪製震源球，僅繪製一個符號。

    *symbol* 爲符號類型，可以選擇 **c**\|\ **d**\|\ **i**\|\ **s**\|\ **t**\|\ **x**\ ，
    符號的具體含義見 :doc:`plot` 模塊的 **-S** 選項。\ *size* 爲符號大小。

    輸入數據的格式爲::

        longitude latitude depth [event_label]

    若未指定 *size*\ ，則需要從輸入數據的第四列讀入符號大小，其餘列向後移動。

    *event_label* 默認位於震源球上方。使用 **+f** 控制其字體，\ **+j** 控制其
    位置，\ **+o** 進一步控制其偏移量。

**-Fa**\ [*size*\ [/*Psymbol*\ [*Tsymbol*]]]
    計算並在震源球上P軸和T軸處繪製符號。
    *size* 是符號大小；
    *Psymbol* 和 *Tsymbol* 符號可以取 **c**\|\ **d**\|\ **h**\|\ **i**\|\ **p**\|\ **s**\|\ **t**\|\ **x**\ ，
    具體含義見 :doc:`plot` **-S** 選項 [默認值爲 6p/cc]

**-Fe**\ *fill*
    設置T軸符號的填充色

**-Fg**\ *fill*
    設置P軸符號的填充色

**-Fp**\ *pen*
    設置P軸符號的畫筆屬性

**-Ft**\ *pen*
    設置T軸符號的畫筆屬性

**-Fr**\ [*fill*]
    在震源球標籤後加一個方框 [默認填充色爲白色]

.. _-G:

**-G**\ *color*
    指定壓縮部分的填充色 [默認爲黑色]

.. _-L:

**-L**\ [*pen*]
    設置震源球外部輪廓的線條屬性

.. _-M:

**-M**
    所有震級使用相同的大小，具體大小由 **-S** 選項的 *scale* 參數決定。

.. _-N:

**-N**
    地圖區域外的震源球也要繪製，默認不繪製。

.. _-Q:

**-Q**
    默認會生成一些臨時文件，其中包含了剖面和剖面上的震源機制的信息，
    供調試時使用。使用該選項，則不會生成這些臨時文件。

.. _-T:

**-T**\ [*nplane*][**/**\ *pen*]
    繪製斷層平面。

    *nplanes* 可以取：

    - *0** 繪製兩個斷層面
    - **1** 繪製第一個斷層面
    - **2** 繪製第二個斷層面

    *pen* 爲畫筆屬性。

    對於雙力偶機制解而言，\ **-T** 選項只繪製震源球的圓周和斷層平面，不填充顏色；
    對於非雙力偶機制解而言，\ **-T0** 在震源球的基礎上覆蓋上透明的斷層平面。

.. include:: explain_-U.rst_

.. include:: explain_-V.rst_

**-W**\ [*pen*]
    設置斷層平面的畫筆屬性 [默認爲 default,black,solid]

.. include:: explain_-XY.rst_

.. _-Z:

**-Z**\ *cpt*
    指定CPT文件，根據數據文件中第三列的值（即地震深度）確定震源球的壓縮部分的顏色。

.. include:: explain_-di.rst_

.. include:: explain_-e.rst_

.. include:: explain_-h.rst_

.. include:: explain_-icols.rst_

.. include:: explain_perspective.rst_

.. include:: explain_-t.rst_

.. include:: explain_colon.rst_

.. include:: explain_help.rst_

示例
---

矩張量形式的震源機制解，剖面的起點爲130E 43N，終點爲140E 36N，90度剖面，即垂直剖面。
壓縮部分爲黑色。建議使用上 **-N**\ ，這樣可以防止漏畫::

    #!/bin/bash
    gmt begin profile
    gmt coupe -JX15c/-6c -Sd0.8 -Aa130/43/140/36/90/100/0/700+f -Gblack -Q -N << EOF
    131.55 41.48 579  1.14 -0.10 -1.04 -0.51 -2.21 -0.99 26 X Y
    133.74 41.97 604  6.19 -1.14 -5.05 -0.72 -9.03 -4.24 25 X Y
    135.52 37.64 432  0.95  0.11 -1.06 -0.20 -2.32  0.90 25 X Y
    138.37 42.85 248 -2.49  3.40 -0.91  3.09  0.83 -3.64 25 X Y
    EOF
    gmt basemap -BWS -Byaf+l"Focal depth (km)" -Bxaf+l"Distance (km)"
    gmt end show

相關模塊
--------

:doc:`meca`,
:doc:`polar`,
:doc:`basemap`,
:doc:`plot`
