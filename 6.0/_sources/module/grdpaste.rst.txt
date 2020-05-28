.. index:: ! grdpaste
.. include:: common_SYN_OPTs.rst_

grdpaste
========

:官方文件: :doc:`gmt:grdpaste`
:簡介: 將兩個網格檔沿着其共同邊界拼接成一個文件

**grdpaste** 用於將兩個網格檔沿着共同的邊界拼接爲一個網格檔。
要合併的兩個網格檔必須擁有相同的網格間隔以及一條共同的邊。
可以使用 :doc:`grdinfo` 查看兩個網格檔是否滿足條件。
若不滿足，則需要使用 :doc:`grdcut` 或 :doc:`grdsample` 命令對網格數據做處理再拼接。
對於地理網格數據而言，可能需要使用 **-f** 選項以正確處理經度的週期性。

語法
----

**gmt grdpaste**
*file_a.nc file_b.nc*
|-G|\ *outfile.nc*
[ |SYN_OPT-V| ]
[ |SYN_OPT-f| ]
[ |SYN_OPT--| ]

必選選項
--------

*file_a.nc* *file_b.nc*
    要進行拼接的兩個網格檔名

.. _-G:

**-G**\ *outfile.nc*
    拼接後生成的網格檔名

可選選項
--------

.. include:: explain_-V.rst_

.. include:: explain_-f.rst_

.. include:: explain_help.rst_

示例
----

假如 file_a.nc 的範圍爲150E-180E和0-30N，file_b.nc 的範圍爲 150E-180E和-30S-0，
則使用如下命令拼接得到的 outfile.nc 的範圍爲 150E-180E 和 -30S 到 30N::

    gmt grdpaste file_a.nc file_b.nc -Goutfile.nc

相關模塊
--------

:doc:`grdblend`,
:doc:`grdclip`,
:doc:`grdcut`,
:doc:`grdinfo`,
:doc:`grdsample`
