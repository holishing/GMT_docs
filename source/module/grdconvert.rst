.. index:: ! grdconvert
.. include:: common_SYN_OPTs.rst_

grdconvert
==========

:官方文件: :doc:`gmt:grdconvert`
:簡介: 將網格檔轉換爲其它網格檔格式

語法
----

**gmt grdconvert** *ingrdfile* |-G|\ *outgrdfile*
[ |-N| ]
[ |SYN_OPT-R| ]
[ |SYN_OPT-V| ]
[ |SYN_OPT-f| ]
[ |SYN_OPT--| ]

必選選項
--------

*ingrdfile*\ [=id[**+s**\ *scale*][**+o**\ *offset*][**+n**\ *invalid*]]
    要讀入的網格檔。

    若讀入的網格檔不是標準的netCDF格式文件，則需要加上 **=**\ *id* 以指定
    網格檔格式（見 :doc:`/grid/format`\ ）。此外，

    - **+s**\ *scale* 對數據做比例縮放，即將數據乘以 *scale*
    - **+o**\ *offset* 對數據做偏移，即將數據加上 *offset*
    - **+n**\ *invalid* 數據中哪個值表示無效值

    需要注意的是，在讀入網格檔時，總是先縮放再偏移。

    若 *id*\ =\ *gd*\ ，則使用GDAL庫檢測數據格式並讀入數據。實際上，當GMT遇到
    其無法識別的文件格式時，總是自動使用GDAL庫讀入數據，但可能會遇到問題，
    此時可以設置 *id*\ =\ *gd*\ 強制使用GDAL庫讀取。

.. _-G:

**-G**\ *outgrdfile*\ [=id[**+s**\ *scale*][**+o**\ *offset*][**+n**\ *invalid*]][*:driver*\ [/*datatype*]]]
    要寫入的網格檔。

    若要寫的網格檔格式不是標準的netCDF格式，則需要加上 **=**\ *id* 以指定
    網格檔格式（見 :doc:`/grid/format`\ ）。此外：

    - **+s**\ *scale* 對數據做比例縮放，即將數據乘以 *scale*
    - **+o**\ *offset* 對數據做偏移，即將數據加上 *offset*
    - **+n**\ *invalid* 數據中哪個值表示無效值

    需要注意的是，在寫網格檔時，總是先偏移再縮放。
    若想要將數據以整型保存以減小文件大小，子選項 **+s** 和 **+o** 經常會遇到。
    此外，還可以使用 **+sa+oa** 讓GMT自動選擇合適的比例因子和偏移量以生成
    整型網格檔。

    當 *id*\ = *gd*\ 時，網格檔將使用GDAL庫寫入。此時可以進一步指定 *driver* 和 *datatype*\ 。
    *driver* 由GDAL提供（如 netCDF, GTiff 等），\ *datatype* 則可以取
    *u8*\|\ *u16*\|\ *i16*\|\ *u32*\|\ *i32*\|\ *float32*\ ，
    其中 *i* 和 *u* 分別表示有符號和無符號整型。\ *datatype* 默認值爲 *float32*\ 。

    寫網格檔時，可以考慮設置 :term:`IO_NC4_DEFLATION_LEVEL`
    以減小生成的文件大小，並進一步優化讀寫性能。

可選選項
--------

.. _-N:

**-N**
    在生成native二進制文件時，不將GMT網格檔頭段寫到文件中。

.. include:: explain_-R.rst_

.. include:: explain_-V.rst_

.. include:: explain_-f.rst_

.. include:: explain_help.rst_

注意事項
--------

GMT默認只能讀取並處理2D單變量網格。對於多變量、多維度網格檔，需要使用額外的語法
指定要讀取的變量或維度，詳情見 :doc:`/grid/read`\ 。

示例
----

將網格檔轉換成四字節native浮點型網格::

    gmt grdconvert data.nc ras_data.b4=bf -V

將網格檔轉換成二字節短整型文件，將其乘以10並減去32000，並設置無數據節點的值爲-9999::

    gmt grdconvert values.nc shorts.i2=bs/10/-32000/-9999 -V

從一個三維網格檔中提取第二層數據::

    gmt grdconvert climate.nc?temp[1] temp.nc -V

相關模塊
--------

:doc:`grdmath`
