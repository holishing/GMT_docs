.. index:: ! filter1d
.. include:: common_SYN_OPTs.rst_

filter1d
========

:官方文檔: :doc:`gmt:filter1d`
:簡介: 對1D表數據做時間域濾波

**filter1d** 用於對多列時間序列數據做時間域濾波。用戶需要指定哪一列數據代表時間（即
自變量）。若輸入的時間序列是等間隔且無間斷或outliers則濾波速度較快。對於有
間斷的不等間隔數據，需要使用 **-L** **-Q** 或 **-S** 選項。

對於空間序列數據，提供了一個選項用於計算沿着測線的距離，並以此作爲濾波的自變量。

語法
----

**gmt filter1d** [ *table* ] |-F|\ *type<width>*\ [*modifier*]
[ |-D|\ *increment* ] [ |-E| ]
[ |-L|\ *lack\_width* ] [ |-N|\ *t\_col* ] [ |-Q|\ *q\_factor* ]
[ |-S|\ *symmetry\_factor* ]
[ |-T|\ [*min/max*\ /]\ *inc*\ [**+e**\|\ **+a**\|\ **n**] \|\ |-T|\ *file*\|\ *list* ]
[ |SYN_OPT-V| ]
[ |SYN_OPT-b| ]
[ |SYN_OPT-d| ]
[ |SYN_OPT-e| ]
[ |SYN_OPT-f| ]
[ |SYN_OPT-g| ]
[ |SYN_OPT-h| ]
[ |SYN_OPT-i| ]
[ |SYN_OPT-j| ]
[ |SYN_OPT-o| ]
[ |SYN_OPT-:| ]
[ |SYN_OPT--| ]

必選選項
--------

.. _-F:

**-F**\ **type**\ *width*\ [*modifier*]
    設置濾波器類型

    濾波器分爲兩大類，卷積濾波器和非卷積濾波器。
    *type* 用於指定濾波器類型，
    *width* 指定濾波器寬度（單位與時間數據相同）。

    對於卷積濾波器，\ *type* 可以取：

    - **b** Boxcar: 所有權重相同
    - **c** Cosine Arch: 權重爲cosine曲線
    - **g** Gaussian: 權重爲高斯函數
    - **f** Custom: 不指定 *width* 而是給定一個含單列數據的文件，以指定權重係數

    對於非卷積濾波器，\ *type* 可以取：

    - **m** Median: 返回中位數
    - **p** Maximum likelihood probability (a mode estimator): Return modal value.
      If more than one mode is found we return their average value. Append - or +
      to the filter width if you rather want to return the smallest or largest
      of the modal values.
    - **l** Lower: 返回所有值中的最小值
    - **L** Lower: 返回所有正值中的最小值
    - **u** Upper: 返回所有值中的最大值
    - **U** Upper: 返回所有負值中的最大值

    大寫的 **B|C|G|M|P|F** 會使用健壯濾波器。即在濾波時會將outliers替換爲中位數。
    outliers 定義爲偏離中位數 2.5 倍的 L1 sacle （1.4826倍的Median absolute deviation）。

    對於 **L**\|\ **U** 可能會出現沒有數據大於或小於0，此時濾波器會返回0.0。

    該模塊默認對數據進行低通濾波，加上 **+h** 選項則對數據進行高通濾波。

選項
----

.. include:: explain_intables.rst_

.. _-D:

**-D**\ *increment*
    當輸入的時間序列是不等間隔採樣時，需要使用該選項設置輸出數據的分辨率 *increment*\ 。
    所有橫座標（時間）都會被rounded off到 *increment* 的整數倍。
    當然，也可以使用 :doc:`sample1d` 對時間序列做重採樣。

.. _-E:

**-E**
    輸出時間序列的首尾端數據。默認情況下，首尾兩端都會丟失半濾波器寬度的數據點

.. _-L:

**-L**\ *lack_width*
    檢查數據間斷。若輸入數據存在超過 *lack_width* 的間斷，則該數據點不輸出值。

.. _-N:

**-N**\ *t_col*
    指定哪一列數據包含自變量（即時間）。默認值爲0，即第一列。

.. _-Q:

**-Q**\ *q_factor*
    通過檢查卷積過程中的平均權重以評估輸出值的質量因子。

    *q_factor* 的取值爲0到1，若某點的卷積的平均權重小於 *q_factor* 則不輸出該點。

.. _-S:

**-S**\ *symmetry_factor*
    檢查數據關於時間窗中心的對稱性。

    *symmetry_factor* 的取值範圍爲0到1。
    若 ( (abs(n_left - n_right)) / (n_left + n_right) ) > factor，則該點不輸出值。

.. _-T:

**-T**\ [*min/max*\ /]\ *inc*\ [**+e**\|\ **+a**\|\ **n**] \|\ |-T|\ *file*\|\ *list*
    生成時間序列

    生成從 *min* 到 *max* 間隔爲 *inc* 的等間隔數列。

.. include:: explain_-V.rst_

.. include:: explain_-bi.rst_

.. include:: explain_-bo.rst_

.. include:: explain_-d.rst_

.. include:: explain_-e.rst_

.. include:: explain_-f.rst_

.. include:: explain_-g.rst_

.. include:: explain_-h.rst_

.. include:: explain_-icols.rst_

.. include:: explain_distcalc.rst_

.. include:: explain_-ocols.rst_

.. include:: explain_colon.rst_

.. include:: explain_help.rst_

相關模塊
--------

:doc:`gmt` ,
:doc:`sample1d`,
:doc:`splitxyz`
