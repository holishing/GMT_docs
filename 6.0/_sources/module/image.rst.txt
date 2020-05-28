.. index:: ! image
.. include:: common_SYN_OPTs.rst_

image
=====

:官方文件: :doc:`gmt:image`
:簡介: 將圖片或EPS文件放在圖上

**image** 模塊可以讀取EPS文件或任意一個光柵圖片文件，並將其畫在圖上。

該模塊的幾個主要用途：

- 將多張圖合併到一張圖上
- 將自己單位的 logo 放在 GMT 生成的圖上
- 將一般圖片放在圖上

必須選項
--------

*imagefile*
    EPS文件或其他光柵圖片格式（GIF、PNG等）的文件

    - EPS文件必須包含合適的BoundingBox
    - 光柵文件的顏色深度可以是1、8、24、32位
    - 光柵文件是通過GDAL讀入的，若安裝GMT時未配置GDAL，則該命令只支持EPS文件

可選選項
--------

.. _-D:

**-D**\ [**g**\|\ **j**\|\ **J**\|\ **n**\|\ **x**]\ *refpoint*\ **+r**\ *dpi*\ **+w**\ [**-**]\ *width*\ [/*height*]\ [**+j**\ *justify*]\ [**+n**\ *nx*\ [/*ny*] ]\ [**+o**\ *dx*\ [/*dy*]]
    指定圖片的尺寸和位置

    簡單介紹各子選項的含義，詳情見 :doc:`/basis/embellishment`

    - **g**\|\ **j**\|\ **J**\|\ **n**\|\ **x**]\ *refpoint*\ 指定地圖上的參考點

      - **g** 指定某地圖座標位參考點
      - **j**\|\ **J** 通過2字母的對齊方式碼指定矩形區域的某個錨點作爲參考點
      - **n** 在歸一化座標系（即0-1）中指定參考點
      - **x** 在繪圖座標系下指定參考點

    - **+j**\ *justify* 指定logo上的錨點（默認錨點爲logo的左下角(BL)）
    - **+o**\ *dx*/*dy* 在參考點的基礎上設置圖片的額外偏移量
    - **+r**\ *dpi* 指定圖片的DPI以間接指定圖片的尺寸
    - **+w**\ [**-**]\ *width*\ [/*height*] 直接指定圖片的尺寸。若未給定 *height*
      則按照 *width* 以及原圖的橫縱比進行縮放；若 *width* 爲負值，則使用其絕對值作爲寬度，
      並使用PS的圖片操作符將圖片插值到設備的分辨率
    - **+n**\ *nx*\ [/*ny*] 使圖片在水平方向重複 *nx* 次，垂直方向重複 *ny* 次。
      若省略 *ny* 則默認其與 *nx* 相等 [默認值爲 **1/1**]

.. _-F:

**-F**\ [**+c**\ *clearances*][**+g**\ *fill*][**+i**\ [[*gap*/]\ *pen*]][**+p**\ [*pen*]][**+r**\ [*radius*]][**+s**\ [[*dx*/*dy*/][*shade*]]]
    控制圖片的背景面板屬性

    若只使用 **-F** 而不使用其它子選項，則會在 GMT logo 周圍繪製矩形邊框。
    下面簡單介紹各子選項，詳細用法見 :doc:`/basis/embellishment`

    - **+p**\ *pen* 指定背景面板的畫筆屬性（默認畫筆屬性由 :term:`MAP_FRAME_PEN` 決定）
    - **+g**\ *fill* 設置背景面板的填充色 [默認不填充]
    - **+c**\ *clearances* 以設置不同方向的空白間隔
    - **+i**\ *gap*/*pen* 在背景面板內部繪製一個額外的內邊框。\ *gap* 爲外邊框
      與內邊界之間的距離 [2p]，默認邊界屬性由 :term:`MAP_DEFAULT_PEN` 控制
    - **+r**\ *radius* 控制圓角矩形邊框，圓角矩形半徑 *radius* 默認爲 6p
    - **+s** 繪製背景面板陰影區。\ *dx*/*dy* 是陰影區相對於背景面板的偏移量 [4p/4p]。
      *shade* 爲陰影區的顏色 [gray50]。

.. _-G:

**-G**\ [*color*][**+b**\|\ **+f**\|\ **+t**]
    修改特定像素值爲其它顏色或透明（該選項可重複使用）

    對於1-bit光柵圖片，可以通過 **+b** 或 **+f** 指定背景色或前景色爲 *color*\ 。
    若不給 *color* 則表示設置背景色或前景色爲透明色。
    對於其它圖片而言，還可以使用 **-G**\ *color*\ **+t** 將顏色 *color* 設置爲
    透明。

.. _-I:

**-I**
    繪圖前對1-bit圖片進行反轉，即黑色變白色，白色變黑色

.. include:: explain_-J.rst_
..
    僅與 **-p** 一起使用。

.. _-M:

**-M**
    使用YIQ變換將彩圖轉換成灰度圖

.. include:: explain_-R.rst_
..
    僅與 **-p** 選項一起使用。

.. include:: explain_-Rz.rst_

.. include:: explain_-U.rst_

.. include:: explain_-V.rst_

.. include:: explain_-XY.rst_

.. include:: explain_perspective.rst_

.. include:: explain_-t.rst_

.. include:: explain_help.rst_

注意事項
--------

**-G** 和 **-I** 選項僅適用於光柵圖片文件，對於EPS文件無效。

示例
----

繪製GMT示例圖片 needle.jpg，其寬度爲7釐米::

    gmt image @needle.jpg -Dx0/0+w7c -pdf plot

繪製相同的文件，但是反轉其RGB帶::

    gmt image @needle.jpg+b2,1,0 -Dx0/0+w7c -pdf plot

相同的文件，只繪製其紅色帶，但以灰度方式繪製::

    gmt image @needle.jpg+b0 -Dx0/0+w7c -pdf plot

繪製EPS文件::

    gmt image @gallo.eps -Dx2i/1i+jTR+w3i -png image

以一個1-bit光柵圖片爲模板，設其背景色爲darkgray、前景色爲yellow，並設置重複6x12次，寬度爲2.5釐米::

    gmt image @vader1.png -Gdarkgray+b -Gyellow+f -Dx0/0+w2.5c+n6/12 -pdf image

相關模塊
--------

:doc:`gmtlogo`
:doc:`legend`,
:doc:`colorbar`
:doc:`plot`,
:doc:`psconvert`
