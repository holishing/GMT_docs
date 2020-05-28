.. index:: ! begin
.. include:: common_SYN_OPTs.rst_

begin
=====

:官方文件: :doc:`gmt:begin`
:簡介: 初始化一個新的GMT現代模式會話

在GMT現代模式下，一個GMT繪圖總是以 **gmt begin** 開始，以 **gmt end** 結束。

**begin** 模塊告訴GMT要開始一個新的現代模式會話。如果你的腳本只繪製一張圖，
那麼你可以直接指定要生成的圖片的文件名和文件格式。如果你的腳本繪製多張圖，
則你需要使用 :doc:`figure` 來分別爲每張圖指定文件名和文件格式。
現代會話模式下，每個會話均獨立於其他進程，每個會話負責管理各自的配置參數、
命令歷史等，因而可以同時執行多個GMT會話而不會互相干擾。

除了可以指定圖片文件名和文件格式之外，還可以通過 *options* 指定生成圖片過程
中所使用的 :doc:`psconvert` 選項。

語法
----

**gmt begin**
[ *prefix* ]
[ *formats* ]
[ *options* ]
[ |SYN_OPT-V| ]

可選選項
--------

*prefix*
    圖片文件名前綴，默認值爲 **gmtsession**\ 。
    圖片文件名後綴由 *formats* 自動決定。

    如果一個GMT會話只用於進行計算而不繪圖，或者需要繪製多張圖，則不需要指定該參數。

    .. note::

        文件名中應儘量避免出現空格。若存在空格，則文件名必須用單引號括起來。

.. _fig-formats:

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

示例
----

開始一個會話，並使用默認值。此時會生成名爲 gmtsession.pdf 的圖片文件::

    gmt begin
    gmt ...
    gmt end

開始一個GMT會話，並指定圖片名爲 *Figure_2*\ ，圖片格式爲PDF和PNG格式::

    gmt begin Figure_2 pdf,png
    gmt ...
    gmt end show

設置額外的參數以控制生成圖片時的額外空白::

    gmt begin map pdf,png A+m1c
    gmt ...
    gmt end show

PS文件注意事項
--------------

如果用戶想要輸出PS格式的圖片，則應額外留意畫布尺寸。對於其他圖片格式而言，
GMT默認使用無窮大（10米x10米）的畫布。而對於PS格式而言，GMT則默認使用A4大小的畫布。
若用戶繪製的圖片超過A4紙張的大小，則可能會造成顯示不完全。針對這種情況，
建議用戶修改參數 :ref:`PS_MEDIA` 以顯式指定紙張大小。例如::

    gmt begin map ps
    gmt set PS_MEDIA A3
    gmt ...
    gmt end

UNIX shell 注意事項
-------------------

現代模式的工作原理是，在使用 **gmt begin** 時利用父進程ID創建唯一的會話目錄，
並將很多信息保存到該會話目錄中。腳本中接下來的命令擁有共同的父進程ID，因而
接下來的命令可以向唯一會話目錄中寫入信息或讀取信息，以實現多個命令之間的互相
通信。然而，UNIX下某些shell的實現不完全統一，腳本執行過程中父進程ID可能出現變化，
後面執行的命令無法正確獲取前面命令的父進程ID，因而導致命令之間的信息交流出現
錯誤。最常見的情況是在使用UNIX管道時，可能會生成子shell進而導致父進程ID出現變化。

如果你在GMT現代模式腳本中使用了管道，執行過程中出現了類似無法找到目錄 ``gmt6.#####``
這樣的錯誤，這極有可能是你所使用的UNIX shell存在此類問題。解決辦法是，
在腳本開始的地方設置環境變量 **GMT_SESSION_NAME** 爲進程ID。在Bash shell應該是::

    export GMT_SESSION_NAME=$$
    gmt begin
    gmt ...
    gmt end show

在C shell中應該是::

    setenv GMT_SESSION_NAME $$
    gmt begin
    gmt ..
    gmt end show

相關模塊
--------

:doc:`clear`,
:doc:`docs`,
:doc:`end`,
:doc:`figure`,
:doc:`inset`,
:doc:`subplot`,
:doc:`gmt`
