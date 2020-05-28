Windows 下的 GMT 中文支持
=========================

ghostscript 的中文支持
----------------------

通常，在 ``C:\Program Files\gs\gs9.26\examples\cjk`` 目錄下可以找到文件 ``gscjk_ag.ps``\ 。

.. note::

   如果找不到該文件，請嘗試重新安裝ghostscript。在安裝的過程中，會有一個生成
   cidmap 的選項，選中該選項則表示會爲當前系統自動生成中文所需的 cidmap 文件。
   默認該選項是被選中的，一定 **不要** 將該選項取消；

啓動 cmd，鍵入如下命令::

    cd "C:\Program Files\gs\gs9.26\bin"
    gswin64.exe ..\examples\cjk\gscjk_ag.ps

該命令用命令行版本的 ``gswin64c`` 打開 ``gscjk_ag.ps``\ ，若能看到中文，則說明
ghostscript 是可以正常支持中文的。

配置Ghostscript環境變量
-----------------------

爲了能夠在將PS文件轉換爲其他圖片格式時也支持中文，需要設置環境變量 ``GS_FONTPATH``\ 。
具體步驟如下：

1. 點擊“計算機”->“屬性”->“高級系統設置”->“環境變量”打開“環境變量”編輯工具
2. 在“系統變量”部分中，新建變量 ``GS_FONTPATH`` 並設置其值爲 ``C:\Windows\fonts``

gsview 的中文支持
-----------------

.. note::

   如果你需要用gsview查看PS文件，則需要爲gsview配置中文顯示。否則，則可以跳過這一部分。

安裝好 gsview 之後，PS 格式會自動與 gsview 關聯。一般情況下，直接雙擊 PS 文件，
就會用 gsview 打開該 PS 文件。

雙擊打開 ``gscjk_ag.ps``\ ，一般情況下不會正確顯示漢字。這是因爲 gsview 在打開
PS 文件時沒有找到漢字所對應的字體文件。

在 gsview 的 “選項”->“高級配置” 中，將 Ghostscript Options 由
``-dNOPLATFONTS -sFONTPATH="c:\psfonts"``
改成 ``-dNOPLATFONTS -sFONTPATH="C:\Windows\Fonts"``\ ，
此時 gsview 在調用 gswin64 時會將選項傳遞給 gswin64，gswin64 則會在 ``FONTPATH``
中搜索字體。

配置完畢後，重新打開 ``gscjk_ag.ps``\ ，若中文正常顯示，則表示 gsview 已支持中文。


GMT 的中文支持
--------------

新建GMT自定義字體配置文件 ``C:\Users\用戶名\.gmt\PSL_custom_fonts.txt``
（若不存在 ``C:\Users\用戶名\.gmt`` 目錄則需新建該目錄。Windows的文件管理器無法新建
以 **.** 開頭的文件夾，因而需要打開CMD，然後執行命令 ``mkdir .gmt`` 以創建該文件夾）。

向 GMT自定義字體配置文件 ``C:\Users\用戶名\.gmt\PSL_custom_fonts.txt`` 中加入如下語句::

    STSong-Light--GB-EUC-H  0.700    1
    STFangsong-Light--GB-EUC-H  0.700    1
    STHeiti-Regular--GB-EUC-H   0.700   1
    STKaiti-Regular--GB-EUC-H   0.700   1
    STSong-Light--GB-EUC-V  0.700    1
    STFangsong-Light--GB-EUC-V  0.700    1
    STHeiti-Regular--GB-EUC-V   0.700   1
    STKaiti-Regular--GB-EUC-V   0.700   1

用 ``gmt text -L`` 查看 GMT 字體::

    $ gmt text -L
    Font #  Font Name
    ------------------------------------
    0   Helvetica
    1   Helvetica-Bold
    ...    ......
    39 STSong-Light--GB-EUC-H
    40 STFangsong-Light--GB-EUC-H
    41 STHeiti-Regular--GB-EUC-H
    42 STKaiti-Regular--GB-EUC-H
    43 STSong-Light--GB-EUC-V
    44 STFangsong-Light--GB-EUC-V
    45 STHeiti-Regular--GB-EUC-V
    46 STKaiti-Regular--GB-EUC-V

可以看到，新添加的四種中文字體對應的字體編號爲 39 到 46。
其中 ``STSong-Light-GB-EUC-H`` 即爲宋體，\ ``GB-EUC`` 是文字編碼方式，
``H`` 表示文字水平排列，\ ``V`` 表示豎排文字。
強烈建議在執行測試腳本前確認自己的中文字體編號。

GMT 中文測試
------------

.. note::

   請自行確認你的中文字體編號。如果編號不是39到46，請自行修改以下測試腳本。

.. literalinclude:: GMT_Chinese.bat

.. note::

    GMT 6.x 目前在Windows下處理中文時存在BUG，可能會出現某些中文正常顯示，某些
    不正常顯示的情況。使用::

        gmt set PS_CHAR_ENCODING Standard+

    可臨時避免這一BUG。

成圖效果如下：

.. figure:: GMT_Chinese.png
   :width: 100%
   :align: center

.. note::

   若使用記事本編輯 bat 文件，則保存時應注意編碼方式爲 ANSI、Unicode 或
   Unicode big endian，若使用 UTF-8 編碼則會出現亂碼；另外，很多編輯器默認將文本
   文件以 UTF-8 編碼保存，需要將編輯器的默認編碼修改爲 GB-2321、ANSI或GB-EUC。
