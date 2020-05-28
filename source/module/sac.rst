.. index:: ! sac
.. include:: common_SYN_OPTs.rst_

sac
===

:官方文件: :doc:`gmt:supplements/seis/sac`
:簡介: 繪製 SAC 格式的地震波形數據

**sac** 模塊可以讀取SAC文件並繪製波形數據。

.. note::

   **sac** 模塊修改自原 pssac 與 pssac2，其功能類似，但語法不同。

**sac** 模塊實現波形繪製的步驟是：

#. 讀入 SAC 文件列表
#. 根據 **-T** 選項確定參考時間
#. 根據 **-C** 選項和參考時間讀入指定的波形數據段
#. 根據 **-F** 選項對數據進行預處理
#. 根據 **-M** 選項確定Y方向的縮放因子並對波形振幅進行縮放
#. 根據 **-Q** 決定是否交換X和Y
#. 根據 **-E** 以及其他信息確定波形在地圖上的位置
#. 根據 **-W** 選項繪製波形
#. 根據 **-G** 選項爲波形塗色

語法
----

**gmt sac** [ *saclist*\|\ *SACfiles* ] |-J|\ *parameters*
|SYN_OPT-R|
[ |SYN_OPT-B| ]
[ |-C|\ [*t0/t1*] ]
[ |-D|\ *dx*\ [/*dy*] ]
[ |-E|\ **a**\|\ **b**\|\ **k**\|\ **d**\|\ **n**\ [*n*]\|\ **u**\ [*n*] ]
[ |-F|\ [**i**][**q**][**r**] ]
[ |-G|\ [**p**\|\ **n**][**+g**\ *fill*][**+z**\ *zero*][**+t**\ *t0/t1*] ]
[ |-M|\ *size*\ [*u*][/*alpha*] ]
[ |-Q| ]
[ |-S|\ [**i**]\ *scale*\ [*unit*] ]
[ |-T|\ [**+t**\ *n*][**+r**\ *reduce_vel*][**+s**\ *shift*] ]
[ |SYN_OPT-U| ]
[ |SYN_OPT-V| ]
[ |-W|\ *pen* ]
[ |SYN_OPT-X| ]
[ |SYN_OPT-Y| ]
[ |SYN_OPT-h| ]
[ |SYN_OPT-p| ]
[ |SYN_OPT-t| ]
[ |SYN_OPT--| ]

必選選項
--------

*SACfiles*
    要繪製在圖上的一系列SAC文件名，目前僅支持等間隔SAC數據

*saclist*
    SAC 文件列表，每行包含一個SAC文件名及其對應的控制參數。

    文件格式爲::

        filename [X  Y [pen]]

    - *filename* 是要繪製的SAC文件名
    - *X* 和 *Y* 控制SAC波形的第一個數據點在地圖上的位置。若省略 *X* 和
      *Y* ，則使用其默認值，否則此處指定的 *X* 和 *Y* 將具有最高優先級

      - 對於線性投影而言，\ *X* 默認是SAC文件的開始時間。使用 **-T** 選項會
        調整 *X* 的默認值，\ *Y* 值則由 *-E* 選項控制；
      - 對於地理投影而言，\ *X* 和 *Y* 默認是臺站的經度和緯度。

    - *pen* 控制當前SAC波形的線條屬性

.. include:: explain_-J.rst_

.. include:: explain_-R.rst_

可選選項
--------

.. include:: explain_-B.rst_

.. _-C:

**-C**\ [*t0/t1*]
    只讀取並繪製時間窗 *t0* 到 *t1* 範圍內的波形。

    *t0* 和 *t1* 均是相對於參考時間的秒數，參考時間由 **-T** 選項決定。
    若未使用 **-T** 選項，則使用SAC頭段中的參考時間（kzdate和kztime）。

    若只使用了 **-C** 但未指定時間窗，則 *t0*/*t1* 由 **-R** 選項的
    *xmin*/*xmax* 決定。

.. _-D:

**-D**\ *dx*\ [**/**\ *dy*]
    使得波形偏離指定位置 *dx*/*dy*\ 。若未指定 *dy* 則默認與 *dx* 相同。

.. _-E:

**-Ea**\|\ **b**\|\ **k**\|\ **d**\|\ **n**\ [*n*]\|\ **u**\ [*n*]
    選擇剖面類型（即Y軸類型）

    - **a** 方位角剖面
    - **b** 反方位角剖面
    - **k** 震中距剖面（單位 km）
    - **d** 震中距剖面（單位 degree）
    - **n** 波形編號剖面，第一個波形的編號爲 *n* [*n* 默認值爲0]
    - **u** 用戶自定義剖面，SAC波形的Y位置由SAC頭段變量 **user**\ *n* 決定 [默認使用 user0]

.. _-F:

**-F**\ [**i**][**q**][**r**]
    繪圖之前的數據預處理

    - **i** 積分
    - **q** 平方
    - **r** 去均值

    **i**\|\ **q**\|\ **r** 可以重複多次，比如 **-Frii** 會將加速度轉化爲位移。
    **i**\|\ **q**\|\ **r** 出現的順序決定了數據預處理的流程。

.. _-G:

**-G**\ [**p**\|\ **n**][**+g**\ *fill*][**+z**\ *zero*][**+t**\ *t0/t1*]
    爲波形的正/負部分塗色。

    - 若 **-G** 後不接任何參數，則默認將正值部分填充爲黑色
    - **p**\|\ **n** 控制是要填充正值區域還是負值區域，重複使用 **-G** 選項以分別爲
      正/負部分設置不同的填充屬性
    - **+g**\ *fill* 設置填充色
    - **+t**\ *t0*/*t1* 只填充 *t0*/*t1* 時間範圍內的波形。參考時間由 **-T** 選項決定。
    - **+z**\ *zero* 定義“零”參考線。從“零”到頂部爲正值區域，從“零”到底部爲負值區域

.. _-M:

**-M**\ *size*\ [*u*][*/alpha*]
    控制Y方向的縮放。不使用的話，Y方向即爲振幅

    - *size*\ [*u*] 將所有波形在地圖上的高度縮放到 *size*\ [*u*]，
      其中 *u* 可以取 **i**\|\ **c**\|\ **p** ，默認單位由 :term:`PROJ_LENGTH_UNIT` 控制。
    - *size*/*alpha*

      - 若 *alpha* 小於0，則所有波形使用相同的比例因子。比例因子由第一個
        波形決定，第一個波形將被縮放到 *size*\ [*u*]
      - 若 *alpha* 等於0，則將所有波形乘以 *size* ，此時不允許有單位
      - 若 *alpha* 大於0，則將所有波形乘以 *size*\*r^\ *alpha*\ ，其中
        r 是以 km 爲單位的距離

.. _-Q:

**-Q**
    垂直繪製波形，即Y軸是時間，X軸是振幅

.. _-S:

**-S**\ [**i**]\ *scale*\ [*unit*]
    指定時間比例尺。

    對於地理投影而言，即表示圖上一個單位距離所代表的波形描述。
    其中單位 *unit* 可以取 **c**\|\ **i**\|\ **p**\ 。
    若未指定 *unit*\ ，則默認使用 :term:`PROJ_LENGTH_UNIT` 所指定的單位。

    在 *scale* 前加上 **i** 則時間比例尺的含義反過來，即 *scale* 表示
    1秒長度的波形在圖上的實際長度。

.. _-T:

**-T**\ [**+t**\ *n*][**+r**\ *reduce_vel*][**+s**\ *shift*]
    指定參考時間及偏移量

    - **+t**\ *tmark* 指定參考時間（即將所有波形沿着參考時間對齊），其中
      *tmark* 可以取-5(b), -4(e), -3(o), -2(a), 0-9(t0-t9)
    - **+r**\ *reduce_vel* 設置reduce速度，單位 km/s
    - **+s**\ *shift* 將所有波形偏移 *shift* 秒

.. include:: explain_-U.rst_

.. include:: explain_-V.rst_

.. _-W:

**-W**\ *pen*
    設置波形的畫筆屬性

.. include:: explain_-XY.rst_

.. include:: explain_-h.rst_

.. include:: explain_perspective.rst_

.. include:: explain_-t.rst_

.. include:: explain_help.rst_

示例
----

利用 SAC 的命令 **funcgen seismogram** 生成了波形，想要繪製單個波形，並分別爲
正負部分塗色::

    gmt sac seis.SAC -JX10c/5c -R9/20/-2/2 -Baf -Fr -Gp+gblack -Gn+gred -png single

利用 SAC 命令 **datagen sub tel *.z** 生成多個波形，將其繪製在距離剖面上::

    gmt sac *.z -R200/1600/12/45 -JX15c/5c -Bx200+l"T(s)" -By5+lDegree -BWSen \
         -Ed -M1.5c -W0.5p,red -png distance_profile

利用 SAC 命令 **datagen sub tel *.z** 生成多個波形，將其繪製在地圖上::

    gmt begin map pdf
    gmt sac *.z -JM15c -R-120/-40/35/65 -Baf -M1i -S300c
    saclst stlo stla f *.z | gmt plot -St0.4c -Gblack -i1,2
    gmt end

相關模塊
--------

:doc:`meca`,
:doc:`polar`,
:doc:`coupe`,
:doc:`basemap`,
:doc:`plot`
