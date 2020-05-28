.. index:: !psconvert
.. include:: common_SYN_OPTs.rst_

psconvert
=========

:官方文件: :doc:`gmt:psconvert`
:簡介: 將 GMT 生成的 PS/EPS 文件轉換爲其它圖片格式

**psconvert** 模塊通過調用 Ghostscript 將 PS/EPS 文件轉換爲其它圖片格式，
包括BMP、EPS、JPEG、PDF、PNG、PPM、SVG、TIFF 格式。

語法
----

**gmt psconvert** *psfile(s)*
[ |-A|\ *params* ]
[ |-C|\ *gs_option* ]
[ |-D|\ *outdir* ]
[ |-E|\ *resolution* ]
[ |-F|\ *out_name* ]
[ |-G|\ *ghost_path* ]
[ |-H|\ *factor* ]
[ |-I| ]
[ |-L|\ *listfile* ]
[ **-Mb**\|\ **f**\ *pslayer* ]
[ |-Q|\ [**g**\|\ **p**\|\ **t**][1\|2\|4] ]
[ |-S| ]
[ |-T|\ **b**\|\ **e**\|\ **E**\|\ **f**\|\ **F**\|\ **j**\|\ **g**\|\ **G**\|\ **m**\|\ **s**\|\ **t**\ [**+m**] ]
[ |SYN_OPT-V| ]
[ |-W|\ *params* ]
[ |-Z| ]
[ |SYN_OPT--| ]

必須選項
--------

*psfiles*
    要轉換格式的 PS 文件名

    默認會在當前目錄下生成與與原始PS文件相同文件名的新格式文件，文件後綴由文件格式決定。
    可以使用 **-F** 設置文件名，使用 **-D** 設置文件後綴。

可選選項
--------

.. _-A:

**-A**\ [**+g**\ *paint*][**+m**\ *margins*][**+n**][**+p**\ [*pen*]][**+r**][**+s**\ [**m**]\|\ **S**\ *width*\ [**u**]/\ *height*\ [**u**]][**+u**]
    對輸出的圖片做裁邊。

    默認情況下，轉換得到的圖片的大小由PS文件的紙張尺寸決定。通常畫圖的時候是
    不會把一張A4紙畫滿的，所以在圖片周圍就會出現多餘的白色部分。

    **-A** 選項會對PS文件進行裁剪，僅保留其中有繪圖的部分，即裁去白邊::

        gmt psconvert -A test.ps

    默認的裁剪方式會將圖片裁剪到儘可能小。如果想要圖片周圍有額外的白色區域，
    可以使用 **+m**\ *margins* 指定額外的空白量。其中 *margins* 可以取：

    - 一個數，表示四條邊的額外邊距相同，如 ``-A0.5c``
    - 兩個數字，表示分別指定X和Y方向的額外邊距，如 ``-A0.5c/1c``
    - 四個數字，表示分別指定左右下上四條邊的邊距，如 ``-A0.5c/0.5c/0.5c/0.5c``

    **-A+s** 可以直接指定最終圖片的尺寸：

    - **-A+s**\ *width* 指定最終生成的圖片的寬度，高度自動決定。程序會對圖片做
      插值以保證 **-E** 設置的DPI值
    - **-A+S**\ *scale* 指定圖片的縮放比例
    - **-A+sm**\ *width*/*height* 設置圖片所允許的最大尺寸。若原始圖片的寬度
      不大於 *width* 則使用圖片的原始尺寸，\ *height* 同理。

    其它子選項：

    - **-A+r** 使得在計算圖片大小時使用 ``round`` 函數而不是 ``ceil`` 函數，
      這會對裁剪造成極其微小的區別，僅當要處理非常小的圖片時才需要使用。
    - ``-A+g<paint>`` 爲BoundingBox指定填充色
    - ``-A+p<pen>`` 爲BoundingBox指定邊框顏色，默認顏色爲 ``0.25p,black``

    - **+g**\ *paint* 爲圖片的BoundingBox指定背景填充色
    - **+p**\ [*pen*] 爲圖片的BoundingBox繪製邊界 [若不指定 *pen*\ ，則默認 0.25p,black]
    - **+n** 不做任何裁剪，以用於忽略到默認的裁剪設置
    - **+u** 先去掉GMT繪製的時間戳再裁剪

.. _-C:

**-C**\ *gs_option*
    額外傳遞給 Ghostscript 的選項

    該選項用於在調用 Ghostscript 時傳給 Ghostscript 額外的選項，若要額外給
    Ghostscript增加多個選項，可重複使用 **-C** 命令。

    在Windows下，若PS文件中含中文，則可能需要使用 **-C** 選項告訴Ghostscript字體路徑::

        gmt psconvert -C-sFONTPATH=C:\Windows\Fonts chinese.ps

.. _-D:

**-D**\ *outdir*
    設置輸出目錄

    默認情況下，會在PS文件同一目錄中生成其他圖片文件，使用 **-D** 選項
    可以指定輸出目錄。\ **-D.** 表示在當前目錄輸出。

.. _-E:

**-E**\ *dpi*
    設置圖片精度

    值越大，圖片越清晰，文件也越大。PDF格式默認值爲720，其他格式默認值爲300，單位爲dpi。

.. _-F:

**-F**\ *out_name*
    指定輸出的文件名

    默認使用使用輸入的PS文件名，並修改其後綴作爲輸出文件的文件名。
    比如 *test.ps* 轉換出的JPG格式的圖片則爲 *test.jpg*\ 。

    **-F** 選項可強制指定輸出文件名，文件後綴由輸出的文件格式自動決定。

.. _-G:

**-G**\ *ghost_path*
    指定Ghostscript可執行文件的路徑

    **psconvert** 底層調用了 Ghostscript 來實現PS到其他格式的轉換，因而成功轉換的
    前提是必須能夠找到 Ghostscript 的可執行文件。\ **-G** 選項即用於顯式指定
    ghostscript可執行文件的路徑。

    說明：

    - Linux下一般不需要設置Ghostscript的路徑，除非你自己重新編譯並安裝到了非標準路徑下
    - Windows下，一般也不需要使用該選項，程序會自動從註冊表裏獲取路徑信息
    - 如果從註冊表中獲取路徑失敗，則必須使用 **-G** 選項指定路徑，如 ``-GC:\programs\gs\gs9.02\bin\gswin64c``

.. _-H:

**-H**\ *factor*
    在生成光柵格式圖片時，先將圖片精度DPI提高 *factor* 倍，然後進行光柵化，
    再減採樣 *factor* 倍，以此來提升光柵圖片的平滑度，避免鋸齒現象。

    *factor* 越大，最終的光柵圖片越平滑。但 *factor* 太大也會使得圖片轉換變慢。
    建議的取值範圍是2到5。

.. _-I:

**-I**
    Enforce gray-shades by using ICC profiles.  Ghostscript versions
    >= 9.00 change gray-shades by using ICC profiles.  Ghostscript 9.05
    and above provide the '-dUseFastColor=true' option to prevent that
    and that is what **psconvert** does by default, unless option **-I** is
    set.  Note that for Ghostscript >= 9.00 and < 9.05 the gray-shade
    shifting is applied to all but PDF format.  We have no solution to
    offer other than upgrade Ghostscript.

.. _-L:

**-L**\ *listfile*
    *listfile* 中列出要轉換的所有PS文件名

.. _-M:

**-Mb**\|\ **f**\ *pslayer*
    將 PS 文件 *pslayer* 作爲背景或前景 PS 圖層。

.. _-P:

**-P**
    強制轉換後的圖片爲Portrait模式。

.. _-Q:

**-Q**\ [**g**\|\ **p**\|\ **t**][1\|2\|4]
    設置圖片(**g**) 或文字(**t**) 的抗鋸齒選項。

    對於矢量格式，默認不做抗鋸齒處理。對於光柵格式，默認參數爲 **-Qt4**\ ；
    對於透明PNG格式而言，默認參數是 **-Qt4 -Qg2**\ 。

    **-Qp** 表示打開生成GeoPDF開頭（需要使用 **-Tf** 選項）。

.. _-S:

**-S**
    在執行Ghostscript命令後，將具體的命令打印到標準錯誤流中，且保留轉換過程中的
    所有臨時文件。該選項主要用於調試。

.. _-T:

**-Tb**\|\ **e**\|\ **E**\|\ **f**\|\ **F**\|\ **j**\|\ **g**\|\ **G**\|\ **m**\|\ **s**\|\ **t**\ [**+m**]
    指定要轉換的圖片格式。

    可以取值：

    - **b** ：BMP；
    - **e** ：EPS；
    - **E** ：帶有PageSize命令的EPS；
    - **f** ：PDF；
    - **F** ：多頁PDF；
    - **j** ：JPEG（默認值）；
    - **g** ：PNG（不透明背景）；
    - **G** ：PNG（透明背景）；
    - **m** ：PPM；
    - **s** ：SVG；
    - **t** ：TIFF；

    說明：

    - **g** 和 **G** 的區別在於前者背景色爲白色，後者背景色爲透明；
    - 對於 **bjgt** 格式可以在其後加 **+m** 將PS文件轉換爲灰度圖；
    - EPS格式可以與其他格式合在一起使用。比如 **-Tef** 會同時生成EPS和PDF文件。
      除此之外，該模塊一次只能轉換一種格式，比如 **-Tbf** 則只會生成PDF格式
    - **-TF** 會將多個PS/PDF文件轉換併合併成一個多頁的PDF文件，需要使用
      **-F** 選項指定輸出的文件名

    轉換爲PDF格式::

        gmt psconvert -Tf test.ps

    利用一堆PS文件生成一個多頁PDF::

        gmt psconvert -TF -Fout *.ps

.. include:: explain_-V.rst_

.. _-W:

**-W**
    生成geoTIFF或KML文件

    該選項很複雜，見官方文件的說明。

.. _-Z:

**-Z**
    轉換完成後刪除輸入的PS文件。若轉換失敗，輸入的PS文件不會被刪除。

.. include:: explain_help.rst_
