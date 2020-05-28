.. index:: ! meca
.. include:: common_SYN_OPTs.rst_

meca
====

:官方文檔: :doc:`gmt:supplements/seis/meca`
:簡介: 繪製震源機制解

語法
----

**gmt meca** [ *table* ] |-J|\ *parameters* |SYN_OPT-R|
|-S|\ *<format><scale>*\ [**+f**\ *font*][**+j**\ *justify*][**+o**\ *dx*\ [/*dy*]]
[ |SYN_OPT-B| ]
[ |-C|\ [*pen*][**+s**\ *size*] ] [ |-D|\ *depmin*/*depmax* ]
[ |-E|\ *fill*]
[ |-F|\ *mode*\ [*args*] ] [ |-G|\ *fill*] [ |-L|\ [*pen*] ]
[ |-M| ]
[ |-N| ]
[ |-T|\ *nplane*\ [/*pen*] ]
[ |SYN_OPT-U| ]
[ |SYN_OPT-V| ]
[ |-W|\ *pen* ]
[ |SYN_OPT-X| ]
[ |SYN_OPT-Y| ]
[ |-Z|\ *cpt*]
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

.. include:: explain_meca_-S.rst_

可選選項
--------

.. include:: explain_-B.rst_

.. _-C:

**-C**\ [*pen*][**+s**\ *size*]
    在 (*newX*,\ *newY*) 處繪製震源球

    默認會在數據輸入所指定的 (*X*,\ *Y*) 座標處繪製震源球。使用 **-C** 選項，
    則將震源球繪製在 (*newX*,\ *newY*) 處，在震源位置繪製一個小圓，
    並將 (*X*,\ *Y*) 和 (*newX*,\ *newY*) 連線。

    *pen* 控制連線的畫筆屬性，\ **+s**\ *size* 指定圓的大小。
    [默認使用 **-W** 選項的 *pen* 屬性，\ *size* 爲0]

.. _-D:

**-D**\ *depmin/depmax*
    只繪製震源深度在 *depmin* 和 *depmax* 之間的地震。

.. _-E:

**-E**\ *fill*
    震源球拉伸部分的填充色[默認爲白色]

.. _-F:

**-F**\ *mode*\ [*args*]
    設置多個屬性，可重複使用多次。

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

**-Fo**
    使用舊版本的 **psvelomeca** 命令的輸入數據格式，即不需要第三列的深度信息

**-Fr**\ [*fill*]
    在震源球標籤後加一個方框 [默認填充色爲白色]

**-Fz**\ [*pen*]
    覆蓋零跡矩張量的畫筆屬性

.. _-G:

**-G**\ *fill*
    指定壓縮部分的填充色[默認值爲黑色]

.. _-L:

**-L**\ [*pen*]
    設置震源球外部輪廓的線條屬性[默認由 **-W** 選項決定]

.. _-M:

**-M**
    所有震級使用相同的大小。震源球大小由 **-S** 選項的 *scale* 參數決定。

.. _-N:

**-N**
    地圖區域外的震源球也要繪製，默認不繪製

.. _-T:

**-T**\ [*nplane*][**/**\ *pen*]
    繪製斷層平面。

    *nplanes* 可以取：

    - **0** 繪製兩個斷層面
    - **1** 繪製第一個斷層面
    - **2** 繪製第二個斷層面

    *pen* 爲畫筆屬性。

    對於雙力偶機制解而言，\ **-T** 選項只繪製震源球的圓周和斷層平面，不填充顏色；
    對於非雙力偶機制解而言，\ **-T0** 在震源球的基礎上覆蓋上透明的斷層平面。

.. include:: explain_-U.rst_

.. include:: explain_-V.rst_

.. _-W:

**-W**\ *pen*
    同時設置所有線條以及符號輪廓的畫筆屬性以及標題顏色。

    該選項設置的屬性可以被 **-C**\ 、\ **-L**\ 、\ **-T**\ 、\ **-Fp**\ 、
    **-Ft**\ 或 **-Fz** 指定的屬性替代。

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
----

繪製了兩個震源球，位置在其震中處。震源球的大小隨震級變化：5 級地震的震源球大小爲 1 釐米::

    gmt meca -JQ104/15c -R102.5/105.5/30.5/32.5 -Ba -Sa1c -png beachball_1 << EOF
    # 經度 緯度 深度(km) strike dip rake 震級 newX newY ID
    104.33 31.91 39.8 32 64 85 7 0 0 A
    104.11 31.52 27.1 22 53 57 6 0 0 B
    EOF

繪製了兩個震源球，位置在其震中處。震源球的大小固定::

    gmt meca -JQ104/15c -R102.5/105.5/30.5/32.5 -Ba -Sa1c -M -png beachball_2 << EOF
    # 經度 緯度 深度(km) strike dip rake 震級 newX newY ID
    104.33 31.91 39.8 32 64 85 7 0 0 A
    104.11 31.52 27.1 22 53 57 6 0 0 B
    EOF

震源球大小隨震級變化，顏色隨深度變化::

    #!/bin/bash
    gmt begin beachball_3 png,pdf
    gmt basemap -JQ104/15c -R102.5/105.5/30.5/32.5 -Ba -BWSEN
    gmt makecpt -T0/100/20
    gmt meca -C+s5p -Sa1.3c -Z << EOF
    # 經度 緯度 深度(km) strike dip rake 震級 newX newY ID
    104.33 31.91 39.8  32 64   85 7.0      0     0 A
    104.11 31.52 27.1  22 53   57 6.0      0     0 B
    103.67 31.13  6.4  86 32  -65 8.0      0     0 C
    103.90 31.34 43.6 194 84  179 4.9 104.18 30.84 D
    103.72 31.44 67.3  73 84 -162 4.9 103.12 31.64 E
    104.12 31.78 12.7 186 68  107 4.7 103.83 32.26 F
    104.23 31.61 62.0  86 63  -51 4.7 104.96 31.69 G
    EOF
    gmt colorbar -DjBL+w5c/0.5c+ml+o0.8c/0.4c -Bx+lDepth -By+lkm
    gmt end show

相關模塊
--------

:doc:`polar`,
:doc:`coupe`,
:doc:`basemap`,
:doc:`plot`
