.. index:: ! polar
.. include:: common_SYN_OPTs.rst_

polar
=====

:官方文件: :doc:`gmt:supplements/seis/polar`
:簡介: 將臺站的極性信息畫在震源球上

通常可以使用 :doc:`meca` 模塊繪製震源球，再使用 :doc:`polar` 模塊將每個臺站的
震相極性信息畫在相應的震源球上。

語法
----

**gmt polar** [ *table* ] |-D|\ *lon/lat* |-J|\ *parameters*
|SYN_OPT-R|
|-M|\ *size*\ [**+m**\ *mag*]
|-S|\ *<symbol><size>*
[ |SYN_OPT-B| ]
[ |-C|\ *lon*/*lat*\ [**+p**\ *pen*][**+s**\ *pointsize*] ]
[ |-E|\ *fill* ]
[ |-F|\ *fill* ]
[ |-G|\ *fill* ]
[ |-N| ]
[ |-Q|\ *mode*\ [*args*] ]
[ |-T|\ *angle*/*form*/*justify*/*fontsize* ]
[ |SYN_OPT-U| ]
[ |SYN_OPT-V| ]
[ |-W|\ *pen* ]
[ |SYN_OPT-X| ]
[ |SYN_OPT-Y| ]
[ |SYN_OPT-di| ]
[ |SYN_OPT-e| ]
[ |SYN_OPT-h| ]
[ |SYN_OPT-i| ]
[ |SYN_OPT-t| ]
[ |SYN_OPT-:| ]
[ |SYN_OPT--| ]

必須選項
--------

.. include:: explain_intables.rst_
..

    輸入數據的格式爲::

        station_code  azimuth  take-off_angle polarity

    - *station_code* 臺站名或其它任意字符串
    - *azimuth* 震相從源到臺站的方位角
    - *take-off_angle* 震相從源出發時的出射角
    - *polarity* 震相極性

       - 壓縮部分（正極性）可以用 **c**, **C**, **u**, **U**, **+** 表示
       - 拉伸部分（負極性）可以取 **d**, **D**, **r**, **R**, **-** 表示
       - 未定義：其他字符

.. include:: explain_-J.rst_

.. include:: explain_-R.rst_

.. _-D:

**-D**\ *longitude/latitude*
    震源球的位置，需要與 :doc:`meca` 模塊輸入數據中震源球的位置相同

.. _-M:

**-M**\ *size*\ [**+m**\ *mag*]
    震源球尺寸，需要與 :doc:`meca` 模塊中 **-S** 選項的參數保持一致

    **+m**\ *mag* 可以用於指定當前地震的震級，此時 *size* 表示5級地震震源球的
    大小，當前地震的實際大小爲 *mag* / 5.0 * *size*\ 。

**-S**\ *<symbol_type><size>*
    選擇符號以及符號的大小。

    符號可以取 **a**, **c**, **d**, **h**, **i**, **p**, **s**, **t**, **x**\ 。
    符號的具體含義見 :doc:`plot` 模塊的 **-S** 選項。

可選選項
--------

.. _-C:

**-C**\ *lon*/*lat*\ [**+p**\ *pen*][**+s**\ *pointsize*]
    將震源球放在新的位置上，並將新位置與老位置之間連線。

.. _-E:

**-E**\ *color*
    拉伸象限內臺站的符號填充色 [默認爲250]

.. _-F:

*-F**\ *fill*
    設置震源球的背景色 [默認不填充]

.. _-G:

**-G**\ *color*
    壓縮象限內臺站的符號填充色 [默認爲黑色]

.. _-N:

**-N**
    不跳過地圖邊界外的符號

.. _-Q:

**-Q**\ *mode*\ [*args*]
    設置多個屬性，該選項可重複使用。

*-Qe**\ [pen]
    拉伸象限內符號的輪廓屬性

**-Qf**\ [pen]
    震源球的輪廓屬性

**-Qg**\ [pen]
    壓縮象限內符號的輪廓屬性

**-Qh**
    使用HYPO71輸出的特殊格式

**-Qs**\ *half-size*\ [**+v**\ *v_size*\ [*vecspecs*]]
    繪製S波偏振方位角。S波偏振信息位於最後一列。

    **+v** 用於設置箭頭。\ *v_size* 爲箭頭大小，後可接其它箭頭相關屬性。

**-Qt**\ *pen*
    *station_code* 的字體顏色

.. _-T:

**-T**\ *angle*/*form*/*justify*/*fontsize*
    將 *station_code* 寫到圖上，其餘參數字符串的角度、形式、對齊方式和字體大小。

.. include:: explain_-U.rst_

.. include:: explain_-V.rst_

.. _-W:

**-W**\ *pen*
    設置畫筆屬性

.. include:: explain_-XY.rst_

.. include:: explain_-di.rst_

.. include:: explain_-e.rst_

.. include:: explain_-icols.rst_

.. include:: explain_-t.rst_

.. include:: explain_colon.rst_

.. include:: explain_help.rst_

示例
----

.. gmtplot:: /scripts/polar_ex1.sh
   :width: 60%
   :align: center

   polar示例

相關模塊
--------

:doc:`meca`,
:doc:`coupe`,
:doc:`basemap`,
:doc:`plot`
