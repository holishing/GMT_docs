.. index:: ! gmtsimplify
.. include:: common_SYN_OPTs.rst_

gmtsimplify
===========

:官方文檔: :doc:`gmt:gmtsimplify`
:簡介: 使用Douglas-Peucker算法對線段做簡化

**gmtsimplify** 模塊讀取一個或多個數據文件，並使用 Douglas-Peucker 算法對複雜多邊形
進行簡化，用曲線近似表示爲一系列點並減少點的數量，並保證每個點與直線的偏離都在可容忍的範圍內。

語法
----

**gmt simplify**
[ *table* ]
|-T|\ *tolerance*\ [*unit*]
[ |SYN_OPT-V| ]
[ |SYN_OPT-b| ]
[ |SYN_OPT-d| ]
[ |SYN_OPT-e| ]
[ |SYN_OPT-f| ]
[ |SYN_OPT-g| ]
[ |SYN_OPT-h| ]
[ |SYN_OPT-i| ]
[ |SYN_OPT-o| ]
[ |SYN_OPT-:| ]
[ |SYN_OPT--| ]

必須選項
--------

.. _-T:

**-T**\ *tolerance*\ [*unit*]
    指定最大所能容忍的誤差，即任意數據點與簡化後的線段間的距離小於該值。
    默認單位爲用戶單位。對於地理數據（例如海岸線）可以指定其它距離單位。

可選選項
--------

.. include:: explain_intables.rst_

.. include:: explain_-V.rst_

.. include:: explain_-bi.rst_

.. include:: explain_-bo.rst_

.. include:: explain_-d.rst_

.. include:: explain_-e.rst_

.. include:: explain_-f.rst_

.. include:: explain_-g.rst_

.. include:: explain_-h.rst_

.. include:: explain_-icols.rst_

.. include:: explain_-ocols.rst_

.. include:: explain_colon.rst_

.. include:: explain_help.rst_

示例
----

將澳大利亞的高精度海岸線數據簡化，容忍誤差爲500km::

    gmt simplify @GSHHS_h_Australia.txt -T500k

將笛卡爾線段簡化，可容忍誤差爲0.45::

    gmt simplify xylines.d -T0.45 > new_xylines.d

注意事項
--------

**gmtsimplify** 對於線段和閉合多邊形的處理方式略有區別。
顯式閉合的線段（即線段的首尾座標相同）會被認爲是閉合多邊形，
否則視爲線段。被當作多邊形的線段可以被簡化爲無面積的3點多邊形，
其不會被輸出。

BUGS
----

Douglas-Peucker 算法的已知問題是交叉點的處理，即其無法保證簡化後的線段不自我交叉，
多個線段也可能互相交叉。此外，當前的算法實現只支持Flat Earth距離。

參考文獻
--------

Douglas, D. H., and T. K. Peucker, Algorithms for the reduction of the
number of points required to represent a digitized line of its
caricature, *Can. Cartogr.*, **10**, 112-122, 1973.

相關模塊
--------

:doc:`gmtconnect`,
:doc:`gmtconvert`,
:doc:`gmtselect`
