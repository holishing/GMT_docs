.. index:: ! grdedit
.. include:: common_SYN_OPTs.rst_

grdedit
=======

:官方文件: :doc:`gmt:grdedit`
:簡介: 修改網格檔的頭段或內容

**grdedit** 模塊具有如下功能：

- 從2D網格檔中讀入頭段信息，並使用命令行中的值替換頭段信息
- 對全球地理網格檔沿着東西方向旋轉
- 可以用 *x y z* 值替換網格檔中特定節點的值

語法
----

**gmt grdedit** *grid* [ |-A| ] [ |-C| ]
[ |-D|\ [**+x**\ *xname*][**+y**\ *yname*][**+z**\ *zname*][**+s**\ *scale*][**+o**\ *offset*][**+n**\ *invalid*][**+t**\ *title*][**+r**\ *remark*] ]
[ |-E|\ [**a**\|\ **h**\|\ **l**\|\ **r**\|\ **t**\|\ **v**] ]
[ |-G|\ *outgrid* ]
[ |-J|\ *parameters* ]
[ |-L|\ [**+n**\|\ **p**] ]
[ |-N|\ *table* ]
[ |SYN_OPT-R| ]
[ |-S| ] [ |-T| ]
[ |SYN_OPT-V| ]
[ |SYN_OPT-bi| ]
[ |SYN_OPT-di| ]
[ |SYN_OPT-e| ]
[ |SYN_OPT-f| ]
[ |SYN_OPT-h| ]
[ |SYN_OPT-i| ]
[ |SYN_OPT-:| ]
[ |SYN_OPT--| ]

必須選項
--------

*grid*
    要修改的2D網格檔

可選選項
--------

.. _-A:

**-A**
    如有必要，則對網格間隔做微調使得其與數據的範圍相兼容。僅用於處理 GMT 3.1
    之前版本生成的網格檔。

.. _-C:

**-C**
    清除網格檔頭段區中生成該網格所使用的命令歷史

.. include:: explain_-D_cap.rst_

.. _-E:

**-E**\ [**a**\|\ **h**\|\ **l**\|\ **r**\|\ **t**\|\ **v**]
    對網格做變換。該選項與除 **-G** 外的其它選項不兼容

    - **-Ea** 旋轉180度
    - **-Eh** 水平翻轉網格（從左到右）
    - **-Ev** 垂直旋轉網格（從上到下）
    - **-El** 逆時針將網格旋轉90度
    - **-Er** 順時針將網格旋轉90度
    - **-Et** 對網格進行轉置（想象成一個二維矩陣），默認使用該變換

    下圖展示了不同變換的具體效果：

    .. gmtplot:: grdedit/grdedit_-E.sh
       :show-code: false

.. _-G:

**-G**\ *outgrid*
    默認情況下，\ **grdedit** 模塊會直接修改並覆蓋原始網格檔。
    使用該選項則將修改後的網格寫到新的文件中。

.. include:: explain_-J.rst_
..

    使用 **-J** 選項則將地理相關信息以 CF-1 兼容的元數據形式（可被GDAL識別）保存
    到 netCDF 文件中。

.. _-L:

**-L**\ [**+n**\|\ **p**]
    調整地理網格檔的經度

    默認情況下會調整 *west* 和 *east* 使得 *west*>=-180 或 *east* <= 180。
    **+n** 則強制經度爲負值，\ **+p** 則強制經度爲正值。

.. _-N:

**-N**\ *table*
    從文件 *table* 中讀入XYZ數據，並用這些XYZ數據替換網格中對應節點的值。

.. include:: explain_-R.rst_
..

    修改網格檔的範圍。同時，網格間隔會做相應修改。

.. _-S:

**-S**
    將網格沿着經度範圍整體偏移，使得其滿足 **-R** 定義的新範圍。僅用於全球地理網格數據。

    例如，原數據範圍是 **0/360/-72/72**\ ，現將數據整體偏移180度使得數據範圍是
    **-180/180/-72/72**::

        gmt grdedit world.nc -R-180/180/-72/72 -S

.. _-T:

**-T**
    將一個網格線配準的文件變成像素配準的文件，或反之。

    使用該選項後，網格線配準的數據的範圍將在四個方向上擴大半個網格間隔，
    像素點配置的數據的範圍將在四個方向上縮小半個網格間隔。

.. include:: explain_-V.rst_

.. include:: explain_-bi.rst_

.. include:: explain_-di.rst_

.. include:: explain_-e.rst_

.. include:: explain_-f.rst_

.. include:: explain_-h.rst_

.. include:: explain_-icols.rst_

.. include:: explain_help.rst_

示例
----

假定數據文件data.nc的範圍爲300/310/10/30。下面的命令修改了其數據範圍並修改了標題::

    gmt grdedit data.nc -R-60/-50/10/30 -D+t"Gravity Anomalies"

數據文件 world.nc 的範圍爲 0/360/-72/72，下面的命令對數據做了移動，使得數據範圍爲
-180/180/-72/72::

    gmt grdedit world.nc -R-180/180/-72/72 -S

GMT 4.1.3 之前的網格檔不包含足夠的信息表明某個網格檔是地理網格。爲了添加
這一信息，可以使用::

    gmt grdedit junk.nc -fg

將網格檔 oblique.nc 逆時針旋轉90度，並輸出到新文件::

    gmt grdedit oblique.nc -El -Goblique_rot.nc

爲了確保文件 depths.nc 的經度始終爲正值::

    gmt grdedit depths.nc -L+p

相關模塊
--------

:doc:`grd2xyz`,
:doc:`grdfill`,
:doc:`grdinfo`
:doc:`xyz2grd`
