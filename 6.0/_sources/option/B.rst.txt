-B 選項
=======

**-B** 選項用於控制底圖邊框的繪製。

**-B** 選項有兩套語法，分別用於設置底圖邊框以及每條邊的屬性，因而在一個命令中
可能需要多次使用 **-B** 選項。若命令中沒有出現 **-B** 選項，則不繪製底圖邊框。

邊框設置
--------

**-B** 選項在設置邊框屬性時的語法爲:

**-B**\ [*axe*][**+b**][**+g**\ *fill*][**+n**][**+o**\ *lon*/*lat*][**+t**\ *title*]

其中：

- *axes* 控制顯示底圖的哪幾條邊，具體寫法在下面會進一步介紹
- **+t**\ *title* 指定當前底圖的標題。該標題位於底圖上方的中間位置。
  標題可以是任意字符串，如果是字符串中有空格，則必須用引號將字符串括起來。
  標題的文本屬性由 :term:`FONT_TITLE` 控制。
  標題與上邊框之間的距離由 :term:`MAP_TITLE_OFFSET` 控制。
- **+g**\ *fill* 爲底圖內部填充背景色，見 :doc:`/basis/fill`
- **+n** 只繪製邊框，而不繪製刻度線和標註
- **+b** 僅適用於3D底圖，使用該子選項則會根據繪製3D底圖的12條邊
- **+oi**\ *lon*/*lat* 指定網格線的參考點。默認情況下，網格線是以北極點作爲參考的，
  如果你想要以另一個點作爲參考繪製傾斜的網格線，則可以使用 **+o** 子選項

通常情況下，只需要使用 *axes* 和 **+t**\ *title* 選項。

*axes*
~~~~~~~~~~

*axes* 用於控制要繪製哪些邊以及這些邊是否有刻度或標註。\ *axes* 的格式爲::

    WSENZ[1234]wesez[1234]lrbtu

.. gmtplot:: B/axes.sh
   :show-code: false

二維底圖（上圖左圖）有四條邊，分別用東西南北（WSEN或wsen）或左右上下（lrtb）的
單詞首字母表示。每條邊都有四種狀態：

#. 不出現某個字母 => 不繪製該字母所對應的邊
#. 出現大寫字母WSEN => 繪製某條邊，該邊有刻度、有標註
#. 出現小寫字母wsen => 繪製某條邊，該邊有刻度、無標註
#. 出現小寫字母lrtb => 繪製某條邊，該邊無刻度、無標註

下圖給出了不同的 **-B** 選項繪製出來的效果圖。讀者可以修改如下命令中的 **-B**
選項來嘗試不同搭配的效果::

    gmt basemap -R0/4/0/4 -JX10c -BWS -pdf axes

.. gmtplot:: B/2D-axes-examples.sh
   :show-code: false

3D底圖有12條邊（上圖右圖）。對於3D底圖而言，**Zzu** 用於控制Z軸的繪製。

- **Z** 表示有刻度和標註
- **z** 表示有刻度無標註
- **u** 表示無刻度無標註

默認只繪製一條Z軸，可以額外加上 **1234** 的任意組合來表示要繪製哪些Z軸。
其中 **1** 始終表示位於左下角的Z軸，其他Z軸按逆時針順序編號。
加上 **+b** 子選項則繪製全部12條邊。

下圖展示了3D繪圖中 **-B** 選項的不同用法。讀者可以修改如下命令中的 **-B** 選項
來實現不同搭配的效果::

    gmt basemap -R0/10/0/10/0/10 -JX5c -JZ5c -Bxaf -Byaf -Bzaf -BwesnZ+t"-BwesnZ" -p130/30 -pdf map

.. gmtplot:: B/3D-axes-examples.sh
   :show-code: false

軸設置
------

X軸、Y軸、Z軸，每條軸都有很多屬性，包括刻度間隔、網格線間隔、軸標籤以及標註的
間隔、前綴和單位。軸屬性可以用如下語法控制:

**-B**\ [**p**\|\ **s**][**x**\|\ **y**\|\ **z**]\ *intervals*\ [**+a**\ *angle*\|\ **n**\|\ **p**][**+l**\|\ **L**\ *label*][**+s**\ *label*][**+p**\ *prefix*][**+u**\ *unit*]

以上語法也可以被拆分爲兩部分:

*-B**\ [**p**\|\ **s**][**x**\|\ **y**\|\ **z**]\ *intervals*
和
*-B**\ [**p**\|\ **s**][**x**\|\ **y**\|\ **z**]\ [**+a**\ *angle*\|\ **n**\|\ **p**][**+l**\|\ **L**\ *label*][**+s**\ *label*][**+p**\ *prefix*][**+u**\ *unit*]

其中，

- **p|s** 表示一級屬性（primary）和二級屬性(secondary)
- **x|y|z** 表示設置哪一條軸的屬性
- *interval* 設置刻度、網格線、標註的間隔
- **+a**\ *angle*\|\ **n**\|\ **p** 用於設置標註的傾斜角度，其中 *angle* 是相對於水平方向的
  旋轉角度，取值範圍爲-90到90。\ **+an** 等效於 **+a90** 即垂直標註，
  **+ap** 等效於 **+a0** 即平行標註。對於Y軸標註而言，不支持任意角度的標註，僅
  支持 **+ap** 和 **+an**\ 。
- **+l**\ *label* 用於給指定的軸加標籤。默認情況下，X軸標籤文字方向平行於X軸，
  Y軸標籤文字方向平行於Y軸。對於Y軸，可以使用 **+L**\ *label* 使得Y軸標籤文字方向
  平行於X軸
- **+s**\ *label* 與 **+l**\ *label* 類似，也用於給指定的軸添加標籤。當同時使用
  **+l**\ *label* 和 **+s**\ *label* 時，前者用於指定左軸或下軸的標籤，而後者用於
  指定右軸和上軸的標籤。
- **+p**\ *prefix* 在選中的軸的標註加前綴
- **+u**\ *unit* 給選中的軸的標註加單位。對於地圖而言，標註的單位爲度，該符號是
  自動添加的，由 :term:`FORMAT_GEO_MAP` 控制

**x**\|\ **y**\|\ **z**
~~~~~~~~~~~~~~~~~~~~~~~

**x**\|\ **y**\|\ **z** 用於指明要設置哪條邊的屬性，默認值爲 **xy**\ ，即同時設置X軸和Y軸的屬性。
可以指定單個軸（比如只有 **x**\ ），也可以同時指定多個軸（比如 **xy** 和 **xyz**\ ）。
如果想要不同軸有不同的設置，則需要多次使用 **-B** 選項，每個指定不同的軸。例如::

    -Bxaf -Byaf
    -Bxyzaf

*interval*
~~~~~~~~~~~~~~

每個軸都有三個屬性，分別是標註（annotation）、刻度（frame）和網格線（grid）。
下圖展示了這三個名詞在繪圖時的具體含義。

.. gmtplot:: /scripts/GMT_-B_afg.sh
    :show-code: false
    :caption: GMT座標軸中的標註、刻度和網格線

*interval* 用於設置這三個屬性的間隔，它是一個或多個 [*t*]\ *stride*\ [±\ *phase*][*u*]
的組合。

- *t* 可以取 **a**\ （標註）、\ **f**\ （刻度）、\ **g**\ （網格線），
  表明要設置軸的哪個屬性的間隔
- *stride* 用於設置間隔，\ *stride* 爲0，表示不繪製
- ±\ *phase* 可以用於控制標註、刻度或網格線的起算點
- *u* 是間隔的單位，通常只在繪製時間軸時才使用

**-B** 選項還有一個可以自動計算間隔的功能，\ **-Bafg** 會根據當前的區域大小等
信息自動計算合適的間隔，\ **-Bxafg -Byafg** 則會對X軸和Y軸分別計算合適的間隔。

讀者可以將命令::

    gmt basemap -JX10c/10c -R0/10/0/10 -Ba2f1g1 -pdf test

中的 **-B** 選項替換成如下不同的值並查看繪圖效果以理解各個參數的含義：

- **-Ba2f1g1**
- **-Bxa2 -Bya1**
- **-Bxafg -Byafg**
- **-Ba2+1f1g1**

**p**\|\ **s**
~~~~~~~~~~~~~~

對於每個軸來說，都有兩個等級的屬性可以設置，分別稱爲p（Primary）和s（Secondary）。

對於地理座標而言，通常只需要使用默認的Primary屬性即可，而Secondary則主要用於
座標軸爲時間軸的情況下，此時 **p** 和 **s** 分別用於指定不同尺度的時間間隔。
在GMT默認的情況下，\ **p** 屬性的標註比較靠近座標軸，而 **s** 屬性的標註離座標軸
稍遠。\ **p** 和 **s** 的用法與區別，可以參考後面給出的例子。

地理底圖
--------

地理底圖與一般的座標軸不同，其底圖類型 :term:`MAP_FRAME_TYPE`
使用 **fancy** 形式。

.. gmtplot:: /scripts/GMT_-B_geo_1.sh
   :show-code: false

   地理底圖示例1

   **-Ba1f15mg5m -BS**

下圖同時使用了 **p** 和 **s** 兩級屬性。這裏 **p** 屬性用於顯示弧度，\ **s**
屬性用於顯示弧分。

.. gmtplot:: /scripts/GMT_-B_geo_2.sh
   :show-code: false

   地理底圖示例2

   同時使用P和S兩級屬性 **-Bpa15mf5mg5m -BwSe -Bs1f30mg15m**

笛卡爾線性軸
------------

對於一般的線性軸而言，標註的格式由 :term:`FORMAT_FLOAT_OUT`
決定，其默認值爲 ``%g``\ ，即根據數據的大小決定用一般表示還是指數表示，小數位的
數目會根據 *stride* 自動決定。若設置 :term:`FORMAT_FLOAT_OUT`
爲其他值，則會嚴格使用其定義的格式，比如 ``%.2f`` 表示顯示兩位小數。

.. gmtplot:: /scripts/GMT_-B_linear.sh
   :show-code: false

   笛卡爾線性軸

   **-R0/12/0/0.95 -JX3i/0.3i -Ba4f2g1+lFrequency+u" %" -BS**

笛卡爾log\ :sub:`10`\ 軸
------------------------

由於對數座標的特殊性，\ *stride* 參數具有特殊的含義。下面說明 *stride*
在對數座標下的特殊性：

- *stride* 必須是1、2、3或負整數-n。

  - **1**\ ：每10的指數
  - **2**\ ：每10的指數的1、2、5倍
  - **3**\ ：每10的指數的0.1倍
  - **-n**\ ：每10的n次方出現一次

- 在 *stride* 後加 **l**\ ，則標註會以log\ :sub:`10`\ 的值顯示，比如100會顯示成2
- 在 *stride* 後加 **p**\ ，則標註會以10的n次方的形式顯示，比如10\ :sup:`-5`

.. gmtplot:: /scripts/GMT_-B_log.sh
   :show-code: false

   對數座標軸

   (上) \ **-R1/1000/0/1 -JX3il/0.25i -Ba1f2g3**\
   (中) \ **-R1/1000/0/1 -JX3il/0.25i -Ba1f2g3l**\
   (下) \ **-R1/1000/0/1 -JX3il/0.25i -Ba1f2g3p**\

笛卡爾指數軸
------------

正常情況下，\ *stride* 用於生成等間隔的標註或刻度，但是由於指數函數的特性，
這樣的標註會在座標軸的某一端擠在一起。爲了避免這個問題，可以在 *stride* 後
加 **p**\ ，則標註會按照轉換後的值等間隔出現，而標註本身依然使用未轉換的值。
比如，若stride=1，pow=0.5（即sqrt），則在1、4、處會出現標註。

.. gmtplot:: /scripts/GMT_-B_pow.sh
   :show-code: false

   指數投影座標軸

   (上) **-R0/100/0/0.9 -JX3ip0.5/0.25i -Ba20f10g5**
   (下) **-R0/100/0/0.9 -JX3ip0.5/0.25i -Ba3f2g1p**

時間軸
------

時間軸與其他軸不同的地方在於，時間軸可以有多種不同的標註方式。下面會用一系列
示例來演示時間軸的靈活性。在下面的例子中，儘管只繪製了X軸（繪圖時使用了 **-BS**\ ），
實際上時間軸標註的各種用法使用於全部軸。

在繪製時間軸時，需要指定時間間隔，時間間隔的單位可以取如下值：

.. table:: GMT時間單位
   :align: center

   +------------+------------------+--------------------------------------------------------------------------+
   | **Flag**   | **Unit**         | **Description**                                                          |
   +============+==================+==========================================================================+
   | **Y**      | year             | Plot using all 4 digits                                                  |
   +------------+------------------+--------------------------------------------------------------------------+
   | **y**      | year             | Plot using last 2 digits                                                 |
   +------------+------------------+--------------------------------------------------------------------------+
   | **O**      | month            | Format annotation using **FORMAT_DATE_MAP**                              |
   +------------+------------------+--------------------------------------------------------------------------+
   | **o**      | month            | Plot as 2-digit integer (1--12)                                          |
   +------------+------------------+--------------------------------------------------------------------------+
   | **U**      | ISO week         | Format annotation using **FORMAT_DATE_MAP**                              |
   +------------+------------------+--------------------------------------------------------------------------+
   | **u**      | ISO week         | Plot as 2-digit integer (1--53)                                          |
   +------------+------------------+--------------------------------------------------------------------------+
   | **r**      | Gregorian week   | 7-day stride from start of week (see **TIME_WEEK_START**)                |
   +------------+------------------+--------------------------------------------------------------------------+
   | **K**      | ISO weekday      | Plot name of weekday in selected language                                |
   +------------+------------------+--------------------------------------------------------------------------+
   | **k**      | weekday          | Plot number of day in the week (1--7) (see **TIME_WEEK_START**)          |
   +------------+------------------+--------------------------------------------------------------------------+
   | **D**      | date             | Format annotation using **FORMAT_DATE_MAP**                              |
   +------------+------------------+--------------------------------------------------------------------------+
   | **d**      | day              | Plot day of month (1--31) or day of year (1--366) (FORMAT_DATE_MAP)      |
   +------------+------------------+--------------------------------------------------------------------------+
   | **R**      | day              | Same as **d**; annotations aligned with week (see **TIME_WEEK_START**)   |
   +------------+------------------+--------------------------------------------------------------------------+
   | **H**      | hour             | Format annotation using **FORMAT_CLOCK_MAP**                             |
   +------------+------------------+--------------------------------------------------------------------------+
   | **h**      | hour             | Plot as 2-digit integer (0--24)                                          |
   +------------+------------------+--------------------------------------------------------------------------+
   | **M**      | minute           | Format annotation using **FORMAT_CLOCK_MAP**                             |
   +------------+------------------+--------------------------------------------------------------------------+
   | **m**      | minute           | Plot as 2-digit integer (0--60)                                          |
   +------------+------------------+--------------------------------------------------------------------------+
   | **S**      | seconds          | Format annotation using **FORMAT_CLOCK_MAP**                             |
   +------------+------------------+--------------------------------------------------------------------------+
   | **s**      | seconds          | Plot as 2-digit integer (0--60)                                          |
   +------------+------------------+--------------------------------------------------------------------------+

第一個例子展示了2000年春天的兩個月，想要將這兩個月的每週的第一天的日期標註出來。

.. gmtplot::
   :caption: 時間軸示例1

   gmt begin GMT_-B_time1 pdf,png
   gmt set FORMAT_DATE_MAP=-o FONT_ANNOT_PRIMARY +9p
   gmt basemap -R2000-4-1T/2000-5-25T/0/1 -JX5i/0.2i -Bpa7Rf1d -Bsa1O -BS
   gmt end

需要注意，\ **-Bsa1O** 指定了次級標註的間隔爲一個月，由於此處使用的是大寫的 **O**\ ，
因而具體的顯式方式由 :term:`FORMAT_DATE_MAP` 決定。
根據 :term:`FORMAT_DATE_MAP` 的說明可知，其值爲 **-o** 表明
以月份名格式顯式。破折號表示要去掉日期前面的前置零（即02變成2）。

下面的例子用兩種不同的方式標註了1969年的兩天。圖中下面的例子使用周來標註，
上面的例子使用日期來標註。

.. gmtplot::
    :caption: 時間軸示例2

    gmt begin GMT_-B_time2 pdf,png
    gmt set FORMAT_DATE_MAP "o dd" FORMAT_CLOCK_MAP hh:mm FONT_ANNOT_PRIMARY +9p
    gmt basemap -R1969-7-21T/1969-7-23T/0/1 -JX5i/0.2i -Bpa6Hf1h -Bsa1K -BS
    gmt basemap -Bpa6Hf1h -Bsa1D -BS -Y0.65i
    gmt end

第三個例子展示了兩年的時間，並標註了每年以及每三個月。
年標註位於一年間隔的中間，月標註位於對應月的中間而不是三個月間隔的中間。

.. gmtplot::
    :caption: 時間示例3

    gmt begin GMT_-B_time3 pdf,png
    gmt set FORMAT_DATE_MAP o FORMAT_TIME_PRIMARY_MAP Character FONT_ANNOT_PRIMARY +9p
    gmt basemap -R1997T/1999T/0/1 -JX5i/0.2i -Bpa3Of1o -Bsa1Y -BS
    gmt end

第四個例子展示了一天中的幾個小時，通過在R選項中指定 **t** 來使用相對時間座標。
這裏使用了 **p** 屬性和 **s** 屬性，12小時制，時間從右向左增加：

.. gmtplot::
    :caption: 時間軸示例4

    gmt begin GMT_-B_time4 pdf,png
    gmt set FORMAT_CLOCK_MAP=-hham FONT_ANNOT_PRIMARY +9p TIME_UNIT d
    gmt basemap -R0.2t/0.35t/0/1 -JX-5i/0.2i -Bpa15mf5m -Bsa1H -BS
    gmt end

第五個例子用兩種方式展示了幾周的時間：

.. gmtplot::
    :caption: 時間軸示例5

    gmt begin GMT_-B_time5 png,pdf
    gmt set FORMAT_DATE_MAP u FORMAT_TIME_PRIMARY_MAP Character \
           FORMAT_TIME_SECONDARY_MAP full FONT_ANNOT_PRIMARY +9p
    gmt basemap -R1969-7-21T/1969-8-9T/0/1 -JX5i/0.2i -Bpa1K -Bsa1U -BS
    gmt set FORMAT_DATE_MAP o TIME_WEEK_START Sunday FORMAT_TIME_SECONDARY_MAP Chararacter
    gmt basemap -Bpa3Kf1k -Bsa1r -BS -Y0.65i
    gmt end

第六個例子展示了1996年的前5個月，每個月用月份的簡寫以及兩位年份標註：

.. gmtplot::
    :caption: 時間軸示例6

    gmt begin GMT_-B_time6 pdf,png
    gmt set FORMAT_DATE_MAP "o yy" FORMAT_TIME_PRIMARY_MAP Abbreviated
    gmt basemap -R1996T/1996-6T/0/1 -JX5i/0.2i -Ba1Of1d -BS
    gmt end

第七個例子：

.. gmtplot::
    :caption: 時間軸示例7

    gmt begin GMT_-B_time7 pdf,png
    gmt set FORMAT_DATE_MAP jjj TIME_INTERVAL_FRACTION 0.05 FONT_ANNOT_PRIMARY +9p
    gmt basemap -R2000-12-15T/2001-1-15T/0/1 -JX5i/0.2i -Bpa5Df1d -Bsa1Y -BS
    gmt end

弧度軸 :math:`\pi` 的標註
-------------------------

如果座標軸以弧度爲單位，用戶可以直接指定 :math:`\pi` 的整數倍或分數倍作爲標註
間隔，其格式爲 **[+|-][s]pi[f]** ，其中 s 表示標註間隔是 :math:`\pi` 的 s 倍，
而 f 表示標註間隔爲 :math:`\pi` 的 f 分之一。

示例::

    gmt basemap -JX10c/5c -R-12pi/12pi/-1/1 -Bxa3pi -pdf test1
    gmt basemap -JX10c/5c -R-pi/pi/-1/1 -Bxapi4 -pdf test2

自定義軸
--------

GMT允許用戶定義標註來實現不規則間隔的標註，用法是 **-Bc** 後接標註文件名。

標註文件中以“#”開頭的行爲註釋行，其餘爲記錄行，記錄行的格式爲::

    coord   type   [label]

- *coord* 是需要標註、刻度或網格線的位置
- *type* 是如下幾個字符的組合

  - **a** 或 **i** 前者爲annotation，後者表示interval annotation
  - 在一個標註文件中，\ **a** 和 **i** 只能出現其中的任意一個
  - **f** 表示刻度，即frame tick
  - **g** 表示網格線，即gridline

- *label* 默認的標註爲 *coord* 的值，若指定 *label*\ ，則使用 *label* 的值

需要注意，\ *coord* 必須按遞增順序排列。

下面的例子展示中展示了自定義標註的用法，\ **xannots.txt** 和 **yannots.txt**
分別是X軸和Y軸的標註文件：

.. gmtplot::
    :caption: 自定義座標軸

    cat << EOF > xannots.txt
    416.0 ig Devonian
    443.7 ig Silurian
    488.3 ig Ordovician
    542 ig Cambrian
    EOF
    cat << EOF > yannots.txt
    0 a
    1 a
    2 f
    2.71828 ag e
    3 f
    3.1415926 ag @~p@~
    4 f
    5 f
    6 f
    6.2831852 ag 2@~p@~
    EOF

    gmt begin GMT_-B_custom pdf,png
    gmt basemap -R416/542/0/6.2831852 -JX-5i/2.5i -Bpx25f5g25+u" Ma" -Bpycyannots.txt -BWS+glightblue
    gmt basemap -R416/542/0/6.2831852 -JX-5i/2.5i -Bsxcxannots.txt -BWS \
                  --MAP_ANNOT_OFFSET_SECONDARY=10p --MAP_GRID_PEN_SECONDARY=2p
    gmt end
    rm -f [xy]annots.txt
