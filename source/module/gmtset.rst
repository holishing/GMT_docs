.. index:: ! gmtset
.. include:: common_SYN_OPTs.rst_

gmtset
======

:官方文檔: :doc:`gmt:gmtset`
:簡介: 修改單個或多個GMT配置參數的值

該命令用於修改GMT配置參數的值以調整接下來的繪圖或者命令的運行。

該命令修改的參數將對接下來的命令一直有效，直到GMT參數再次被修改或覆蓋。
若想要參數修改僅對某個命令有效，可以在該命令中使用 **--**\ *PARAMETER*\ **=**\ *value* 語法。

語法
----

**gmt set**
[ |-C| \| |-D|\ [**s**\|\ **u**] \| |-G|\ *defaultsfile* ]
[ **-**\ [**BJRXxYycp**]\ *value* ]
PARAMETER1 [=] *value1*
PARAMETER2 [=] *value2*
PARAMETER3 [=] *value3*

必選選項
--------

*PARAMETER*\ **=**\ *value*
    要修改的GMT配置參數名 *PARAMETER* 以及想要設置的值 *value*

    參數名和值必須成對存在，二者可以用等號 **=** 連接，也可以省略等號。
    GMT配置參數見 :doc:`/conf/index`\ 。

可選選項
--------

.. _-C:

**-C**
    將 GMT4 創建的 GMT4配置文件 ``.gmtdefaults4`` 轉換爲GMT5及之後版本所使用的 ``gmt.conf``
    文件，並保留原GMT4配置文件。

.. _-D:

**-D**\ [**s**\|\ **u**]
    在系統默認配置的基礎上修改參數值

    #. **-D**\ ：使用GMT編譯過程中指定的默認參數文件（通常是SI單位制配置文件）
    #. **-Du**\ ：使用US單位制下的默認參數文件
    #. **-Ds**\ ：使用SI單位制下的默認參數文件

.. _-G:

**-G**\ *defaultsfile*
    指定要讀取並修改的配置文件名 *defaultsfile*

**-**\ [**BJRXxYycp**]\ *value*
    強行修改GMT命令歷史文件 **gmt.history** 中的值。

    GMT在執行一個命令時會在命令歷史文件 **gmt.history** 中記錄一些選項的參數值，
    使得接下來的命令可以不用再提供這個選項的參數值。
    該選項用於在不執行其他繪圖命令的前提下強行修改命令歷史，但用處不大。

.. include:: explain_help.rst_

示例
----

修改主標註字體爲Helvetica，字號爲12p，設置網格交叉線的尺寸爲0.2釐米::

    gmt set FONT_ANNOT_PRIMARY 12p,Helvetica MAP_GRID_CROSS_SIZE_PRIMARY 0.2c

也可以用等號將參數名和參數值連接起來::

    gmt set FONT_ANNOT_PRIMARY=12p,Helvetica MAP_GRID_CROSS_SIZE_PRIMARY=0.2c

FAQ
---

#. 錯誤消息::

       gmtset: Warning: parameter xxxx is deprecated. Use xxx instead.

   GMT5對所有的配置參數進行了重命令，以使得參數名更容易記憶。出現該報錯的原因是，
   當前命令使用的是GMT4的老參數名。解決辦法是根據警告信息替換爲新的GMT5配置參數名。

相關模塊
--------

:doc:`gmt.conf`,
:doc:`gmtdefaults`,
:doc:`gmtget`
