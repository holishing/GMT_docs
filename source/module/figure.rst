.. index:: ! figure
.. include:: common_SYN_OPTs.rst_

figure
======

:官方文件: :doc:`gmt:figure`
:簡介: 設置當前圖片的屬性

一個GMT現代模式會話下可以繪製一張或多張圖件。對於一個會話中繪製多張圖件的情況，
**figure** 模塊可以指定當前圖件的文件名和格式。

該模塊必須在你開始向當前圖件繪圖之前執行，且每次調用 **figure** 模塊都會開啓一張新的圖件。
你也可以再次使用 **figure** 模塊在多個圖件之間來回切換，但此時不能再指定 *formats*
或 *options* 等選項。一個會話中的每張圖都有各自的歷史記錄和配置參數，因而不同圖之間的
**-R** 和 **-J** 選項等信息不會出現錯亂。

語法
----

**gmt figure**
*prefix*
[ *formats* ]
[ *options* ]
[ |SYN_OPT-V| ]

必須選項
--------

*prefix*
    圖片文件名前綴，默認值爲 **gmtsession**\ 。
    圖片文件名後綴由 *formats* 自動決定。

    .. note::

        文件名中應儘量避免出現空格。若存在空格，則文件名必須用單引號括起來。

可選選項
--------

*formats*
    圖片文件格式。多個格式之間可以用逗號分開。默認圖片格式爲 **pdf**\ ，由
    參數 :term:`GMT_GRAPHICS_FORMAT` 控制。

    GMT支持輸出如下矢量圖片格式：

    - ``pdf``\ ：\ `Portable Document Format <https://zh.wikipedia.org/wiki/可移植文件格式>`_ [默認格式]
    - ``ps``\ ：\  `Plain PostScript <https://zh.wikipedia.org/wiki/PostScript>`_
    - ``eps``\ ：\ `Encapsulated PostScript <https://zh.wikipedia.org/wiki/EPS>`_

    GMT支持輸出如下位圖圖片格式：

    - ``bmp``\ ：\ `Microsoft Bit Map <https://zh.wikipedia.org/wiki/BMP>`_
    - ``jpg``\ ：\ `Joint Photographic Experts Group Format <https://zh.wikipedia.org/wiki/JPEG>`_
    - ``png``\ ：\ `Portable Network Graphics <https://zh.wikipedia.org/wiki/PNG>`_ （不透明背景）
    - ``PNG``\ ：\ `Portable Network Graphics <https://zh.wikipedia.org/wiki/PNG>`_ （透明背景）
    - ``ppm``\ ：\ `Portable Pixel Map <https://zh.wikipedia.org/wiki/PBM格式>`_
    - ``tif``\ ：\ `Tagged Image Format File <https://zh.wikipedia.org/wiki/TIFF>`_

*options*
    GMT現代模式本質上是先生成PS文件，再通過調用 :doc:`psconvert` 自動轉換成用戶
    指定的圖片格式。此處可以設置要傳遞給模塊 :doc:`psconvert` 的選項，
    多個選項之間用逗號分隔。

    默認值爲 **A**\ ，表示將 **-A** 選項傳給 :doc:`psconvert`\ 。

    其他可選的選項包括：

    - **A**\ [*args*]: 裁剪圖片
    - **C**\ *args*: 額外傳遞給Ghostscript的選項
    - **D**\ *dir*: 指定圖片的輸出目錄
    - **E**\ *dpi*: 設置圖片分辨率
    - **H**\ *factor*: 對圖片做平滑以避免混疊
    - **M**\ *args*: 爲當前圖片疊加前景圖片或背景圖片
    - **Q**\ *args*: 設置圖像和文本的抗鋸齒選項
    - **S** : 把 Ghostscript 命令輸出到標準錯誤輸出，且不刪除所有中間文件

    詳細解釋見 :doc:`psconvert` 的說明文件。

.. include:: explain_-V.rst_

.. include:: explain_help_nopar.rst_

PS文件注意事項
--------------

如果用戶想要輸出PS格式的圖片，則應額外留意畫布尺寸。對於其他圖片格式而言，
GMT默認使用無窮大（10米x10米）的畫布。而對於PS格式而言，GMT則默認使用A4大小的畫布。
若用戶繪製的圖片超過A4紙張的大小，則可能會造成顯示不完全。針對這種情況，
建議用戶修改參數 :ref:`PS_MEDIA` 以顯式指定紙張大小。例如::

    gmt begin
    gmt figure map ps
    gmt set PS_MEDIA A3
    gmt ...
    gmt end

示例
----

在當前的現代模式下開啓一個新繪圖，圖片名爲 Regional，格式爲PDF和EPS格式::

    gmt begin
    gmt figure Regional pdf,eps
    gmt ...
    gmt end show

開啓一個新繪圖，名爲GlobalMap，圖片格式爲JPEG，並對圖片進行裁剪，四邊均保留1釐米的空白::

    gmt begin
    gmt figure GlobalMap jpg A+m1c
    gmt ...
    gmt end show

在一個會話中繪製兩張圖，並在兩張圖之間來回切換::

    gmt begin

    # 在 Fig1 中繪製
    gmt figure Fig1 png
    gmt ...

    # 在 Fig2 中繪製
    gmt figure Fig2 png
    gmt ...

    # 切換回 Fig1
    gmt figure Fig1
    gmt ...

    # 切換回 Fig2
    gmt figure Fig2
    gmt ...

    gmt end show

技術細節
--------

如果你在爲GMT設計外部接口並且你不希望在會話結束時自動轉換並生成圖片，
你可以指定圖片文件名或圖片格式爲 **-**\ 。

相關模塊
--------

:doc:`begin`,
:doc:`clear`,
:doc:`docs`,
:doc:`end`,
:doc:`inset`,
:doc:`subplot`,
:doc:`gmt`
