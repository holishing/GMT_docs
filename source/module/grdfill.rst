.. index:: ! grdfill
.. include:: common_SYN_OPTs.rst_

grdfill
=======

:官方文件: :doc:`gmt:grdfill`
:簡介:

**grdfill** 模塊讀入一個文件數據，並向數據中的“洞”填充數據。
“洞”通常指值爲NaN的節點，但用戶也可以使用其它準則指定“洞”。

語法
----

**gmt grdfill** *ingrid*
|-A|\ *mode*\ [*arg*]
|-G|\ *outgrid*
[ |SYN_OPT-R| ]
[ |-L|\ [**p**] ]
[ |SYN_OPT-V| ]
[ |SYN_OPT-f| ]
[ |SYN_OPT--| ]

必須選項
--------

*ingrid*
    輸入網格文件

.. _-A:

**-A**\ *mode*\ [*arg*]
    填充“洞”所使用的算法

    目前支持兩種算法：

    - **c**\ *value* 使用某個常數填充
    - **n**\ [*radius*] 使用nearest neighbor算法，\ *radius* 爲搜索半徑（單位是節點數）

.. _-G:

**-G**\ *outgrid*
    輸出網格文件

可選選項
--------

.. _-N:

**-N**\ [*nodata*]
    所有值等於 *nodata* 的節點都被認爲爲“hole”，默認值爲NaN

.. include:: explain_-R.rst_
..

   該選項定義了要處理了子區域範圍。

.. _-L:

**-L**\ [**p**]
    不填充“洞”，僅列出每個“洞”所處的子區域的範圍

    **-G** 選項會被忽略。\ **-Lp** 表示輸出每個子區域對應的閉合多邊形。

.. include:: explain_-V.rst_

.. include:: explain_-f.rst_

.. include:: explain_help.rst_

示例
----

檢測網格文件中所有包含NaN的區域，並列出這些矩形區域的邊界座標::

    gmt grdfill data.grd -L > wesn_listing.txt

檢測網格文件中所有包含NaN的區域，並以多段文件的形式輸出這些矩形區域對應的閉合多邊形::

    gmt grdfill data.grd -Lp > NaN_regions.txt

將網格文件中所有NaN值替換爲999.0::

    gmt grdfill data.grd -Ac999 -Gno_NaNs_data.grd

將網格文件中所有NaN值用最近的非NaN值替代::

    gmt grdfill data.grd -An -Gno_NaNs_NN_data.grd

相關模塊
--------

:doc:`grdcut`,
:doc:`grdclip`,
:doc:`grdedit`,
:doc:`grdinfo`
