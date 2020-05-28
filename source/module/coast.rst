.. index:: ! coast
.. include:: common_SYN_OPTs.rst_

coast
=====

:官方文檔: :doc:`gmt:coast`
:簡介: 在地圖上繪製海岸線、河流、國界線

**coast** 模塊利用 GMT 自帶的 :doc:`GSHHG數據</dataset/gshhg>` 和
:doc:`DCW數據 </dataset/dcw/index>` 繪製海岸線、河流、政治邊界，
還可以裁剪陸地區域或水域，也可以將數據導出到文件中。

語法
----

**gmt coast** |-J|\ *parameters*
|SYN_OPT-R|
[ |SYN_OPT-Area| ]
[ |SYN_OPT-B| ]
[ |-C|\ *fill*\ [**+l**\|\ **+r**] ]
[ |-D|\ *resolution*\ [**+f**] ]
[ |-E|\ *dcw* ]
[ |-F|\ *box* ]
[ |-G|\ *fill* ]
[ |-I|\ *river*\ [/\ *pen*] ]
[ |-J|\ **z**\|\ **Z**\ *parameters* ]
[ |-L|\ *scalebar* ]
[ |-M| ]
[ |-N|\ *border*\ [/*pen*] ]
[ |-Q| ]
[ |-S|\ *fill* ]
[ |-T|\ *rose* ]
[ |SYN_OPT-U| ]
[ |SYN_OPT-V| ]
[ |-W|\ [*level*/]\ *pen* ]
[ |SYN_OPT-X| ]
[ |SYN_OPT-Y| ]
[ |SYN_OPT-bo| ]
[ |SYN_OPT-p| ]
[ |SYN_OPT-t| ]
[ |SYN_OPT--| ]

必選選項
--------

.. include:: explain_-J.rst_

.. include:: explain_-R.rst_

.. include:: explain_-Rz.rst_

可選選項
--------

.. include:: explain_-A.rst_

.. include:: explain_-B.rst_

.. _-C:

**-C**\ *fill*\ [**+l**\|\ **+r**]
    設置湖泊與河流湖的顏色。

    默認情況下，湖泊與河流湖會被當做wet區域，直接使用 **-S** 指定的填充值。
    使用 **+l** 或 **+r** 可以爲湖泊或河流湖單獨指定顏色。

.. _-D:

**-D**\ *resolution*\ [**+f**]
    選擇海岸線數據精度。

    GMT自帶的GSHHG海岸線數據有5個不同精度的版本，從高到低依次爲：full、high、
    intermediate、low和crude。GMT默認使用低精度數據。該選項可以指定要使用的
    數據精度，其中 **f**\|\ **h**\|\ **i**\|\ **l**\|\ **c**
    分別代表5種不同的數據精度。也可以用 **-Da** 選項，此時GMT會根據當前繪圖區域的
    大小自動選擇合適的數據精度 [默認使用 **-Da**]

    默認情況下，若找不到指定精度的海岸線數據，程序會自動報錯退出。該選項中
    加上 **+f** 則命令在找不到當前指定的精度數據時，自動尋找更低精度的數據。

.. _-E:

**-E**\ *code1,code2,...*\ [**+l**\|\ **L**][**+g**\ *fill*][**+p**\ *pen*][**+r**\|\ **R**\ [*inc*]]
    利用DCW數據繪製或導出行政區劃邊界（洲界、國界、省界）

    GMT自帶了DCW（Digital Chart of World）數據，即全球的行政區劃數據。
    其包含了全球各國國界和省界數據。該數據獨立於GSHHG數據，因而 **-A** 和 **-D**
    選項對該數據無效。關於DCW數據及其用法的詳細介紹見 :doc:`/dataset/dcw/index`\ 。

    通過指定一個或多個以逗號分隔的區域代碼 *code* 即可指定一個或多個行政區域。
    *code* 可以取如下幾種形式：

    - 洲代碼前加上 **=** 則繪製整個洲內所有國家邊界。
      比如 **=AS** 會繪製所有亞洲國家的邊界
    - 直接使用國界代碼，則繪製國界邊界。比如 **US** 繪製美國邊界
    - 使用 *國家代碼*.*州代碼* 則繪製州（省）邊界。比如 **US.TX** 繪製
      美國Texas州的邊界

    可以使用如下子選項列出可使用的 *code*:

    - **+l** 僅列出所有國家及其對應代碼，不繪製邊界也不提取數據
    - **+L** 列出部分國界的省及其代碼

    通過加上子選項，可以進一步設置指定區域的邊界屬性或填充屬性：

    - **+p**\ *pen* 表示繪製多邊形輪廓 [默認無輪廓]
    - **+g**\ *fill* 表示設置多邊形的填充色 [默認無填充色]

    若想要不同的區域有不同的畫筆或填充屬性，則需要多次使用 **-E** 選項，每次
    指定不同的區域以及不同的畫筆或填充屬性。

    若使用了 **-E** 但不指定 **-J** 和 **-M** 則會以 **-R**\ *w/e/s/n* 的
    形式輸出對應行政區域的區域範圍。

.. _-F:

**-F**\ [**l**\|\ **t**][**+c**\ *clearances*][**+g**\ *fill*][**+i**\ [[*gap*/]\ *pen*]][**+p**\ [*pen*]][**+r**\ [*radius*]][**+s**\ [[*dx*/*dy*/][*shade*]]]
    控制比例尺和玫瑰圖的背景邊框

    若只使用 **-F** 而不使用其它子選項，則會在比例尺或方向玫瑰的周圍繪製矩形邊框。
    下面簡單介紹各子選項，詳細用法見 :doc:`/basis/embellishment`

    - **+p**\ *pen* 指定背景面板的畫筆屬性（默認畫筆屬性由 :term:`MAP_FRAME_PEN` 決定）
    - **+g**\ *fill* 設置背景面板的填充色 [默認不填充]
    - **+c**\ *clearances* 以設置不同方向的空白間隔
    - **+i**\ *gap*/*pen* 在背景面板內部繪製一個額外的內邊框。\ *gap* 爲外邊框
      與內邊界之間的距離 [2p]，默認邊界屬性由 :term:`MAP_DEFAULT_PEN` 控制
    - **+r**\ *radius* 控制圓角矩形邊框，圓角矩形半徑 *radius* 默認爲 6p
    - **+s** 繪製背景面板陰影區。\ *dx*/*dy* 是陰影區相對於背景面板的偏移量 [4p/4p]。
      *shade* 爲陰影區的顏色 [gray50]。

    該選項默認會同時控制比例尺和方向玫瑰的背景邊框。
    加上 **l**\|\ **t** 則表示只控制 **-L**\ 或 **-T** 選項繪製的特徵。

.. _-G:

**-G**\ *fill*
    設置dry區域的填充色或裁剪dry區域

    **-G**\ *fill* 設置dry區域（一般指陸地）的填充色。
    若不指定 *fill* 則會將dry區域裁剪出來，使得接下來的繪圖只有dry區域內的纔會被繪製。

.. _-I:

**-I**\ *river*\ [/*pen*]
    繪製河流。

    河流 *river* 可以取：

    - 0 = Double-lined rivers (river-lakes)
    - 1 = Permanent major rivers
    - 2 = Additional major rivers
    - 3 = Additional rivers
    - 4 = Minor rivers
    - 5 = Intermittent rivers - major
    - 6 = Intermittent rivers - additional
    - 7 = Intermittent rivers - minor
    - 8 = Major canals
    - 9 = Minor canals
    - 10 = Irrigation canals
    - a = All rivers and canals (0-10)
    - A = All rivers and canals except river-lakes (1-10)
    - r = All permanent rivers (0-4)
    - R = All permanent rivers except river-lakes (1-4)
    - i = All intermittent rivers (5-7)
    - c = All canals (8-10)

    *pen* 的默認值爲 **default,black,solid**\ ，該選項可重複使用多次
    以分別指定不同等級河流的畫筆屬性。

.. include:: explain_-L_scale.rst_

.. _-M:

**-M**
    將邊界數據以多段ASCII表或二進制表的形式導出到標準輸出

    使用該選項，則只導出數據而不繪圖。
    該選項需要與 **-E**, **-I**, **-N** 或 **-W** 選項一起使用。

.. _-N:

**-N**\ *border*\ [/*pen*]
    繪製政治邊界。

    該選項在某些地方與 **-E** 選項有重疊。邊界類型 *border* 可以取：

    - ``1`` ：國界
    - ``2`` ：州界；（目前只有美國、加拿大、澳大利亞以及南美各國的數據）
    - ``3`` ：Marine boundaries
    - ``a`` ：1-3的全部邊界；

    *pen* 的默認屬性爲 **default,black,solid**\ 。該選項可重複多次
    使用，以指定不同級別邊界的不同畫筆屬性。

.. _-Q:

**-Q**
    關閉區域裁剪。

    使用 **-G** 和 **-S** 可以分別裁剪出dry區域和wet區域，接下來的其他繪圖命令
    中只有在裁剪區域內的部分纔會被繪製。在繪圖結束後，需要關閉裁剪，就需要再次調用
    **coast**\ ，並加上 **-Q** 選項。若在開啓裁剪後使用了 **-X** 和 **-Y** 選項，
    則在關閉時也要記得使用 **-X** 和  **-Y**\ 。

.. _-S:

**-S**\ *fill*
    設置wet區域的填充色或裁剪wet區域

    **-S**\ *fill* 設置wet區域（一般指海洋或湖泊）的填充色。
    若不指定 *fill* 則將wet區域裁剪出來，使得接下來的繪圖只有wet區域內的纔會被繪製。

.. include:: explain_-T_rose.rst_

.. include:: explain_-U.rst_

.. include:: explain_-V.rst_

.. _-W:

**-W**\ [*level*/]\ *pen*
    繪製岸線（shoreline）

    shore指水與陸地交界的“岸”（如：海岸、湖岸、河岸等），是一個較爲籠統的說法。

    GMT中岸線分成四個等級（\ *level* 取1-4）：

    #. coastline：海岸線
    #. lakeshore：湖泊與陸地的岸線
    #. island-in-lake shore：首先要有陸地，陸地中有個湖，湖裏有個島。即島的岸線
    #. lake-in-island-in-lake shore：首先有陸地，陸地中有個湖，湖中有個島，島裏
       又有個湖。這裏指的是湖的岸線

    使用時需要注意：

    - 不使用 **-W** 選項，則不繪製任何shore
    - 使用 **-W** ，給定畫筆屬性 *pen*\ ，但不給出 *level*\ ，則繪製
      四個level的shore
    - 在同一個命令中可以多次使用 **-W**\ ，以指定不同 *level* 的shore的畫筆屬性
    - **-W** 選項中 *level* 是可選的，而 *pen* 是必須的！因而 **-W2**
      會被解釋爲所有level的畫筆屬性，而不是level 2

.. include:: explain_-XY.rst_

.. include:: explain_-bo.rst_

.. include:: explain_perspective.rst_

.. include:: explain_-t.rst_

.. include:: explain_help.rst_

示例
----

在入門教程 :doc:`/tutorial/coastline` 和 :doc:`/dataset/gshhg` 均提供了
一些 **coast** 的使用實例。

繪製非洲地圖，並繪製河流、國界，以及設置不同的填充色::

    gmt coast -R-30/30/-40/40 -Jm0.1i -B5 -I1/1p,blue -N1/0.25p,- \
            -I2/0.25p,blue -W0.25p,white -Ggreen -Sblue -png africa

繪製Iceland地圖，使用pattern #28做填充::

    gmt coast -RIS+r1 -Jm1c -B -Wthin -Gp28+r100 -pdf iceland

將非洲區域裁剪出來，並在其中的陸地部分繪製地形::

    gmt begin map png
        gmt coast -R-30/30/-40/40 -Jm0.1i -B -G
        gmt grdimage @earth_relief_05m
        gmt coast -Q
    gmt end show

繪製部分國家的國界線::

    gmt coast -JM6i -Baf -EGB,IT,FR+gblue+p0.25p,red -EES,PT,GR+gyellow -pdf map

提取冰島的高精度海岸線數據::

    gmt coast -RIS -Dh -W -M > iceland.txt

FAQ
---

#. 錯誤消息::

       coast: low resolution shoreline data base not installed.

   出現該錯誤的原因有如下幾種：

   #. 未安裝GSHHG海岸線數據
   #. 安裝了但路徑不正確（建議的做法是把所有GSHHG的文件放在 ``$GMTHOME/share/coast`` 目錄下）
   #. 安裝的netCDF版本號爲3.x而不是4.x
   #. 自行編譯了netCDF 4.x，且編譯時使用了 ``--disbale-netcdf4`` 選項

相關模塊
--------

:doc:`grdlandmask`,
:doc:`basemap`
