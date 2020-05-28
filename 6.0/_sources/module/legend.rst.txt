.. index:: ! legend
.. include:: common_SYN_OPTs.rst_

legend
======

:官方文件: :doc:`gmt:legend`
:簡介: 在圖上添加圖例

**legend** 模塊用於繪製圖例，圖例由圖例文件控制。如無特別說明，
標註的字體由 :ref:`FONT_ANNOT_PRIMARY <FONT\_ANNOT\_PRIMARY>` 控制。

語法
----

**gmt legend** [ *specfile* ]
|-D|\ *refpoint*
[ |SYN_OPT-B| ]
[ |-C|\ *dx*/*dy* ]
[ |-F|\ *box* ]
[ |-J|\ *parameters* ]
[ |SYN_OPT-R| ]
[ |-S|\ *scale* ]
[ |-T|\ *file* ]
[ |SYN_OPT-U| ]
[ |SYN_OPT-V| ]
[ |SYN_OPT-X| ]
[ |SYN_OPT-Y| ]
[ |SYN_OPT-p| ]
[ |SYN_OPT-t| ]
[ |SYN_OPT--| ]

必須選項
--------

.. _-D:

**-D**\ [**g**\|\ **j**\|\ **J**\|\ **n**\|\ **x**]\ *refpoint*\ **+w**\ *width*\ [/*height*]\ [**+j**\ *justify*]\ [**+l**\ *spacing*]\ [**+o**\ *dx*\ [/*dy*]]
    指定圖例框的尺寸和位置

    簡單介紹各子選項的含義，詳情見 :doc:`/basis/embellishment`

    - **g**\|\ **j**\|\ **J**\|\ **n**\|\ **x**]\ *refpoint*\ 指定地圖上的參考點

      - **g** 指定某地圖座標位參考點
      - **j**\|\ **J** 通過2字母的對齊方式碼指定矩形區域的某個錨點作爲參考點
      - **n** 在歸一化座標系（即0-1）中指定參考點
      - **x** 在繪圖座標系下指定參考點

    - **+j**\ *justify* 指定圖例框的錨點（默認錨點在左下角(BL)）
    - **+o**\ *dx*/*dy* 在參考點的基礎上設置圖例框的額外偏移量
    - **+w**\ *width*\ [/*height*] 指定圖例框的尺寸。若 *height* 爲0或未指定，
      則根據圖例內容自動估算圖例框高度。
    - **+l**\ *spacing* 設置圖例裏的行間距 [默認值1.1，即當前字體大小的1.1倍]

    該選項幾個比較有用的用法是：

    - 將圖例放在左下角： **-DjBL+w4c+o0.2c/0.2c**
    - 將圖例放在左上角： **-DjTL+w4c+o0.2c/0.2c**
    - 將圖例放在右下角： **-DjBR+w4c+o0.2c/0.2c**
    - 將圖例放在右上角： **-DjTR+w4c+o0.2c/0.2c**


可選選項
--------

.. include:: explain_-B.rst_

.. _-C:

**-C**\ *dx*/*dy*
    設置圖例邊框與內部圖例之間的空白 [默認值 4p/4p]

.. _-F:

**-F**\ [**+c**\ *clearances*][**+g**\ *fill*][**+i**\ [[*gap*/]\ *pen*]][**+p**\ [*pen*]][**+r**\ [*radius*]][**+s**\ [[*dx*/*dy*/][*shade*]]]
    控制圖例的背景面板屬性

    若只使用 **-F** 而不使用其它子選項，則繪製圖例框。
    下面簡單介紹各子選項，詳細用法見 :doc:`/basis/embellishment`

    - **+p**\ *pen* 指定背景面板的畫筆屬性（默認畫筆屬性由 :term:`MAP_FRAME_PEN` 決定）
    - **+g**\ *fill* 設置背景面板的填充色 [默認不填充]
    - **+c**\ *clearances* 以設置不同方向的空白間隔
    - **+i**\ *gap*/*pen* 在背景面板內部繪製一個額外的內邊框。\ *gap* 爲外邊框
      與內邊界之間的距離 [2p]，默認邊界屬性由 :term:`MAP_DEFAULT_PEN` 控制
    - **+r**\ *radius* 控制圓角矩形邊框，圓角矩形半徑 *radius* 默認爲 6p
    - **+s** 繪製背景面板陰影區。\ *dx*/*dy* 是陰影區相對於背景面板的偏移量 [4p/4p]。
      *shade* 爲陰影區的顏色 [gray50]。

.. include:: explain_-J.rst_

.. include:: explain_-R.rst_

.. _-S:

**-S**\ *scale*
    對圖例中的所有符號大小乘以 *scale* [默認值爲 1]

.. _-T:

**-T**\ *file*
    將隱藏的圖例文件輸出到文件中 [僅適用於現代模式]

    現代模式下，某些模塊（如 :doc:`plot`\ ）可以使用 **-l** 選項自動編輯一個隱藏的圖例文件。
    在最終成圖時，會根據這一圖例文件繪製圖例。
    該選項可將該隱藏圖例文件的內容保存到新文件中，使得用戶可以在自動圖例文件的基礎
    上做進一步自定義。

.. include:: explain_-U.rst_

.. include:: explain_-V.rst_

.. include:: explain_-XY.rst_

.. include:: explain_perspective.rst_

.. include:: explain_-t.rst_

.. include:: explain_help.rst_

圖例文件格式
------------

圖例文件用於控制圖例中各項的佈局。圖例文件中的每個記錄對應圖例中的一項，圖例中
每項的順序由記錄的先後順序決定。每個記錄的第一個字符決定了當前記錄的圖例類型。
GMT中共有14種圖例類型，列舉如下：

**#** *comment*
    以 # 開頭的行或空行是註釋行，會被跳過

**A** *cptname*
    指定CPT文件，使得某些記錄可以通過指定Z值來設定顏色，可以多次使用該記錄以
    指定不同的CPT文件

**B** *cptname offset height* [ *optional arguments* ]
    繪製水平colorbar

    - *offset* 是colorbar相對於圖例框左邊界的距離
    - *height* 是colorbar高度，其後可以加上子選項 [**+e**\ [**b**\|\ **f**][*length*]][**+h**][**+m**\ [**a**\|\ **c**\|\ **l**\|\ **u**]][**+n**\ [*txt*]]
    - *optional arguments* 爲 :doc:`colorbar` 模塊的其它選項，如 **-B** **-I** **-L** **-M** **-N** **-S** **-Z** **-p**

**C** *textcolor*
    接下來的文本所使用的顏色

    可以直接指定顏色，也可以用 z=\ *val* 指定Z值，以從CPT文件中查找相應的顏色
    （CPT文件由 **A** 記錄指定）。
    若 *textcolor* 爲 **-**\ ，則使用默認顏色。

**D** [*offset*] *pen* [**-**\|\ **+**\|\ **=**]
    繪製一條水平線

    - *offset* 爲線條左右頂端與圖例邊框的空白距離 [默認爲0]
    - *pen* 爲線條的畫筆屬性。若未指定 *pen*\ ，則使用 :term:`MAP_GRID_PEN_PRIMARY`\ 。
      若 *pen* 設置爲 **-**\ ，則繪製一條不可見的線（供 **V** 記錄使用）
    - 默認情況下，線條上下各留出四分之一的行間距，\ **-**\|\ **+**\|\ **=**
      分別表示線條上方無空白、線條下方無空白和線條上下均無空白。

**F** *fill1 fill2 ... filln*
    指定單元的填充色。

    可以直接指定顏色，也可使用 z=\ *value* 形式指定從CPT文件（由 **A** 記錄指定）中查找顏色。
    若只給定了一個 *fill*\ ，則整行都使用相同的填充色，否則依次爲當前行的
    每列應用不同的 *fill*\ （列數由 **N** 記錄控制）。若 *fill* 爲 **-**\ ，則不填充。

**G** *gap*
    給定一個垂直空白

    空白的高度由 *gap* 決定，\ *gap* 可以用 **i**\|\ **c**\|\ **p** 單位，
    也可以用 **l**  作爲單位表示幾倍行距的空白，\ *gap* 也可以取負值，表示將當前行上移。

*H** *font*\|\ **-** *header*
    爲圖例指定一個居中的標題。

    *header* 爲標題，\ *font* 爲文字屬性。若字體爲 **-** 則使用默認字體 :term:`FONT_TITLE`\ 。

**I** *imagefile width justification*
    將EPS或光柵文件放在圖例中

    *width* 爲圖片寬度；\ *justification* 爲圖片的對齊方式。

**L** *font*\|\ **-** *justification label*
    在某一列增加指定的文字

    *label* 爲顯示的文本，\ *font* 爲字體。若 *font* 爲 **-** 則使用默認字體
    :term:`FONT_LABEL`\ 。\ *justification* 爲對齊方式，可以取
    **L**\|\ **C**\|\ **R**\ ，分別表示左對齊、居中對齊和右對齊

**M** *slon*\|\ **-** *slat* *length*\ [**+f**][**+l**\ [*label*]][**+u**] [**-F**\ *param*] [ **-R**\ *w/e/s/n* **-J**\ *param* ]
    在圖例中繪製比例尺。

    *slon* 和 *slat* 用於指定繪製哪一點的比例尺。\ *slon* 僅對特定的傾斜投影有效。
    對於一般投影，應設置爲 **-**\ 。

    *length* 爲比例尺長度，其後可以接長度單位，以及多個子選項。子選項的具體含義見
    :doc:`basemap` 模塊的 **-L** 選項。

    若想要爲比例尺加上背景面板，則可以使用 :doc:`basemap` 的 **-F** 選項。
    此外，還可以加上 **-R** 和 **-J** 指定比例尺所使用的投影參數。

**N** [*ncolumns* or *relwidth1 relwidth2 ... relwidthn*]
    修改圖例中的列數 [默認爲1列]

    該記錄僅對 **S** 和 **L** 記錄有效。該記錄指定的列數會一直有效直到再次
    使用 **N** 記錄。
    *ncolumns* 用於指定若干個等寬的列，\ *relwidth1 relwidth2 ... relwidthn*
    用於指定每列所佔的相對寬度，所有寬度的和應等於 **-D** 選項所設置的寬度相等。

**P** *paragraph-mode-header-for-pstext*
    在圖例中添加文本段落，參考 :doc:`text` 命令中的段落模式

**S** [*dx1 symbol size fill pen* [ *dx2 text* ]]
    在圖例中繪製符號

    - *dx1* 符號中心與左邊框的距離。若爲 **-** 則自動設置爲最大的符號大小的一半。
      *dx1* 除了可以指定距離，還可以使用 **L**\|\ **C**\|\ **R** 表示符號在
      當前列的對齊方式
    - *symbol* 指定要繪製的符號類型，見 :doc:`plot` 命令的 **-S** 選項。\ *symbol* 爲 **-** 表示繪製線段
    - *size* 符號大小
    - *fill* 符號的填充色。使用 **-** 表示不填充。\ *fill* 也可以用 z=\ *val* 的形式從CPT文件中根據Z值查找顏色
    - *pen* 符號的輪廓屬性。使用 **-** 表示不繪製輪廓
    - *dx2* 是 *text* 與左邊框的距離。使用 **-** 則自動設置爲最大符號大小的1.5倍
    - *text* 是符號的文字說明，字體由 :term:`FONT_ANNOT_PRIMARY` 控制

    若只有 **S** 而不接其它任何信息，則直接跳至下一列。若 *symbol* 取 **f** **q** 或 **v**\ ，
    可以在符號後加上更多的子選項，詳情見 :doc:`plot` 模塊 **-S** 選項。
    某些符號（例如矩形、橢圓等）需要指定多個 *size*\ ，應將多個 *size* 用逗號
    分隔作爲 *size* 即可。如果只給了一個 *size*\ ，則其餘 *size* 由GMT默認值決定。

**T** *paragraph-text*
    打印一段文本，字體由 :term:`FONT_ANNOT_PRIMARY` 控制

**V** [*offset*] *pen*
    在兩列之間繪製垂直的線條

    *offset* 爲線條上下兩端與圖例邊框的空白距離 [默認爲0]。

默認值
------

對於如下符號，若用戶不顯式指定屬性，繪製圖例時使用如下默認值：

- front符號 **f**\ ：front 符號位於左側，其大小爲指定符號大小的30%
- 矢量符號 **v**\ ：箭頭大小爲符號大小的30%
- 橢圓符號 **e|E**\ ：主軸長度爲符號大小，次軸長度是符號大小的65%，方位角爲0
- 矩形符號 **r**\ ：寬度爲符號大小，高度爲寬度的65%
- 旋轉矩形符號 **j|J**\ ：寬度爲符號大小，高度爲寬度的65%，旋轉角度爲30度
- 圓角矩形符號 **R**\ ：寬度爲符號大小，高度爲寬度的65%，角半徑爲寬度的10%
- 數學圓弧符號 **m|M**\ ：角度在-10°-45°，箭頭大小爲符號大小的30%
- 楔形符號 **w**\ ：角度爲-30°到30°

示例
----

.. gmtplot:: legend/legend_ex1.sh
   :width: 100%
   :align: center

   legend示例圖1

相關模塊
--------

:doc:`gmtlogo`,
:doc:`basemap`,
:doc:`text`,
:doc:`plot`
