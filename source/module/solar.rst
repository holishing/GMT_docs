.. index:: ! solar
.. include:: common_SYN_OPTs.rst_

solar
=====

:官方文檔: :doc:`gmt:solar`
:簡介: 計算或/和繪製晨昏線以及民用、航海用以及天文用曙暮光區域

語法
----

**gmt solar**
[ |SYN_OPT-B| ]
[ |-C| ]
[ |-G|\ [*fill*] ]
[ |-I|\ [*lon/lat*][**+d**\ *date*][**+z**\ *TZ*] ]
[ |-J|\ *parameters* ]
[ |-M| ]
[ |-N| ]
[ |SYN_OPT-R| ]
[ |-T|\ **dcna**\ [**+d**\ *date*][**+z**\ *TZ*]]
[ |SYN_OPT-U| ]
[ |SYN_OPT-V| ]
[ |-W|\ *pen* ]
[ |SYN_OPT-X| ]
[ |SYN_OPT-Y| ]
[ |SYN_OPT-bo| ]
[ |SYN_OPT-h| ]
[ |SYN_OPT-o| ]
[ |SYN_OPT-p| ]
[ |SYN_OPT-t| ]
[ |SYN_OPT--| ]

必選選項
--------

**-I** 和 **-T** 必須使用一個。

可選選項
--------

.. include:: explain_-B.rst_

.. _-C:

**-C**
    在一行內格式化打印（以Tab鍵分隔）\ **-I** 選項輸出的信息。輸出內容包括：

    - 太陽的經度、緯度、方位角、高度角，單位爲度
    - 日出、日落、正午的時間，單位爲天
    - 日長，單位爲分鐘
    - 考慮折射效應矯正後的太陽高度較正以及均時差，單位爲分鐘

    .. note::

       若沒有通過 **-I**\ *lon*/*lat* 提供經緯度，則太陽高度角之後的數據均以 (0,0)
       作爲參考點。

    示例::

        $ gmt solar -I120/40+d2016-11-01T01:00:00+z8 -C
        160.885755836	-14.5068940782	38.6719503593	-59.513608404	0.270214374769	0.706928713211	0.48857154399	628.868647356	-59.5102114599	16.4569766548

.. _-G:

**-G**\ [*fill*]
    根據晨昏線對黑夜區域填充顏色或圖案，見 :doc:`/basis/fill`\。
    若不指定 *fill* 則剪裁黑夜區域，且需要通過 **gmt clip -C** 停止區域剪裁，
    見 :doc:`clip`\ 。

.. _-I:

**-I**\ [*lon/lat*][**+d**\ *date*][**+z**\ *TZ*]
    輸出太陽的當前位置、方位角和高度角。加上 *lon*/*lat* 則輸出日出、日落、
    正午時間以及一天時間長度。用 **+d**\ *data* 指定ISO格式的日期時間
    （比如 **+d2000-04-25T10:00:00** ）來計算特定時刻的太陽參數。如果有需要，
    也可以通過 **+z**\ *TZ* 加上時區。

    ::

        $ gmt solar -I120/40+d2016-11-01T01:00:00+z8
              Sun current position:    long = 160.885756    lat = -14.506894
                                  Azimuth = 38.6720    Elevation = -59.5136
              Sunrise  = 06:29
              Sunset   = 16:58
              Noon     = 11:44
              Duration = 10:29

.. include:: explain_-J.rst_

.. _-M:

**-M**
    將晨昏線數據以多段ASCII表格式寫到標準輸出（或二進制格式，
    見 :doc:`/option/binary`\ ）。使用該選項，則只輸出數據不繪圖。

.. _-N:

**-N**
    反轉晨昏線“內”和“外”概念顛倒。僅可與 **-Gc** 一起使用以剪裁出白晝區，
    不可與 **-B** 一同使用。

.. include:: explain_-R.rst_

.. _-T:

**-Tdcna**\ [**+d**\ *date*][**+z**\ *TZ*]
    繪製一個或多個不同定義的晨昏線。若需要導出晨昏線數據，見 **-M** 選項。

    通過添加 **dcna** 來繪製一個或多個不同定義的晨昏線。其中，

    - **d** 指晨昏線
    - **c** 指民用曙暮光
    - **n** 指航海曙暮光
    - **a** 指天文曙暮光

    **+d**\ *date* 爲ISO格式的日期時間（例如 **+d2000-04-25T12:15:00**\ ），
    以得到該時刻晨昏交替的位置。也可以通過 **+z**\ *TZ* 加上時區。

    不同曙暮光區的定義如下圖所示：

    .. figure:: https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Twilight_subcategories.svg/640px-Twilight_subcategories.svg.png
       :align: center
       :width: 80%

       曙暮光區的多種定義（圖片來自於 https://en.wikipedia.org/wiki/Twilight）

    - 民用曙暮光分爲晨間曙光區和晚間暮光區：

      - 晨間曙光區是指太陽的幾何中心位於地平線以下6˚至地平線以下0˚50'（或日出，
        即太陽上邊緣接觸地平線）這段時間
      - 晚間曙光區是指太陽的幾何中心位於地平線以下 0˚50'（或日落，即太陽下邊
        緣接觸地平線）至地平線以下6˚ 這段時間

    - 航海曙暮光指太陽中心位於地平線以下 0˚50' 至 12˚ 這段時間
    - 天文曙暮光指太陽中心位於地平線以下 0˚50' 至 18˚ 這段時間

    下面的命令繪製了晨昏線以及三條曙暮光線:

    .. gmtplot::
       :caption: 晨昏線和曙暮光線
       :width: 80%
       :show-code: true

       gmt begin terminator png
         gmt coast -Rd -W0.1p -JQ0/14c -Ba -BWSen -Dl -A1000
         gmt solar -W1p -Tdcna
       gmt end

.. include:: explain_-U.rst_

.. include:: explain_-V.rst_

.. _-W:

**-W**\ [*pen*]
    設置晨昏線的畫筆屬性，見 :doc:`/basis/pen`\ 。

.. include:: explain_-XY.rst_

.. include:: explain_-bo.rst_

.. include:: explain_-ocols.rst_

.. include:: explain_perspective.rst_

.. include:: explain_-t.rst_

示例
----

.. gmtplot::
   :width: 60%

   gmt begin solar png
     gmt coast -Rd -JKs0/10i -Dl -A5000 -W0.5p -N1/0.5p,gray -S175/210/255 -Bafg --MAP_FRAME_TYPE=plain

     gmt solar -Td+d2016-02-09T16:00:00 -Gnavy@95

     gmt solar -Tc+d2016-02-09T16:00:00 -Gnavy@85
     gmt solar -Tn+d2016-02-09T16:00:00 -Gnavy@80
     gmt solar -Ta+d2016-02-09T16:00:00 -Gnavy@80

     gmt solar -I+d2016-02-09T16:00:00 -C | gmt plot -Sksunglasses/1.5c -Gyellow
   gmt end

相關模塊
--------

:doc:`clip`,
:doc:`coast`,
:doc:`plot`
