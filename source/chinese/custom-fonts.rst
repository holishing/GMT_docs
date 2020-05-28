自定義字體原理
==============

GMT默認支持35種PS標準字體。如果想要使用額外的字體（比如其他西文字體或中日韓字體），
則需要用戶自行配置。在 :doc:`/install/index` 一章中已經簡要介紹瞭如何利用第三方
提供的配置腳本在Linux、macOS下修改ghostscript配置文件以使得GMT支持中文字體。
這一節則更詳細地介紹修改ghostscript配置文件和GMT字體配置文件的基本原理。

本文依然以四個基本的中文字體爲例。

基本原理
--------

GMT本質上是生成PS文件，並利用ghostscript將其轉換爲其他圖片格式。因而，爲GMT自定義
字體本質上分爲兩步：

#. 修改ghostscript配置文件
#. 修改GMT配置文件

ghostscript中文配置
-------------------

中文配置文件
~~~~~~~~~~~~

不同系統下ghostscript的的中文配置文件的位置不同。此處以CentOS 7 爲例。

CentOS 7下，ghostscript的中文配置文件的路徑爲 ``/usr/share/ghostscript/conf.d/cidfmap.zh_CN``\ 。
若該文件不存在，則表明系統中未安裝ghostscript中文配置文件。

CentOS 7下ghostscript簡體中文配置文件可以通過如下命令安裝::

    $ sudo yum install ghostscript-chinese-zh_CN

配置文件的內容
~~~~~~~~~~~~~~

CentOS 7 中 ghostscript 中文配置文件的默認內容爲::

    /BousungEG-Light-GB <</FileType /TrueType /Path (/usr/share/fonts/wqy-zenhei/wqy-zenhei.ttc) /SubfontId 0 /CSI [(GB1) 4] >> ;
    /GBZenKai-Medium    <</FileType /TrueType /Path (/usr/share/fonts/wqy-zenhei/wqy-zenhei.ttc) /SubfontId 0 /CSI [(GB1) 4] >> ;
    /MSungGBK-Light     /BousungEG-Light-GB ;
    /Adobe-GB1      /BousungEG-Light-GB ;

其中的細節不管，其大致意義爲：

- 第一行定義了字體名爲 ``/BousungEG-Light-GB``\ ，
  對應的字體文件爲 ``/usr/share/fonts/wqy-zenhei/wqy-zenhei.ttc``\ ，
  也就是文泉驛正黑；
- 第二行定義了字體名爲 ``/GBZenKai-Medium``\ ，對應的字體文件也是文泉驛正黑；
- 第三行和第四行分別定義了字體名 ``/MSungGBK-Light`` 和 ``/Adobe-GB1``\ ，
  這兩種都對應於 ``/BousungEG-Light-GB``\ ，相當於給字體定義了別名。

關於配置文件的幾點說明：

- 字體名是任意的，比如字體名可以取爲 ``/ABC`` ；
- 字體文件似乎只能是 ``ttc`` 或 ``ttf`` 格式的，當然修改參數也有可能可以使用其他格式的字體；
- 要注意確認字體文件是否存在，比如 CentOS7 下的 ``wqy-zenhei.ttc`` 字體實際上
  位於軟件包 ``wqy-zenhei-fonts`` 中。若字體不存在，則需要安裝相應軟件包。

添加 Windows 中文字體
~~~~~~~~~~~~~~~~~~~~~

Linux 的中文字體較少，所以這裏使用 Windows 下中的中文字體，這裏只考慮 Windows 下的
宋體、仿宋、黑體和楷體四個基本字體。對於 Windows 下的其他中文字體、Linux 的
其他中文字體甚至日韓字體來說，方法類似。

將這四個字體文件複製到 ``/usr/share/fonts/winfonts/`` 目錄下，
然後對 ghostscript 的中文配置文件做如下修改::

    % 原內容保持不變
    /BousungEG-Light-GB <</FileType /TrueType /Path (/usr/share/fonts/wqy-zenhei/wqy-zenhei.ttc) /SubfontId 0 /CSI [(GB1) 4] >> ;
    /GBZenKai-Medium    <</FileType /TrueType /Path (/usr/share/fonts/wqy-zenhei/wqy-zenhei.ttc) /SubfontId 0 /CSI [(GB1) 4] >> ;
    /MSungGBK-Light     /BousungEG-Light-GB ;
    /Adobe-GB1      /BousungEG-Light-GB ;

    % 新增 Windows 字體的支持
    /STSong-Light <</FileType /TrueType /Path (/usr/share/fonts/winfonts/simsun.ttc) /SubfontId 0 /CSI [(GB1) 4] >> ;
    /STFangsong-Light <</FileType /TrueType /Path (/usr/share/fonts/winfonts/simfang.ttf) /SubfontId 0 /CSI [(GB1) 4] >> ;
    /STHeiti-Regular <</FileType /TrueType /Path (/usr/share/fonts/winfonts/simhei.ttf) /SubfontId 0 /CSI [(GB1) 4] >> ;
    /STKaiti-Regular <</FileType /TrueType /Path (/usr/share/fonts/winfonts/simkai.ttf) /SubfontId 0 /CSI [(GB1) 4] >> ;

測試 ghostscript 對 Windows 中文字體的支持
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

下載PS測試文件 :download:`GMT_Chinese_Linux.ps </chinese/GMT_Chinese_Linux.ps>`\ ，
並打開終端用 ``gs GMT_Chinese_Linux.ps`` 命令查看該PS文件。
若正確顯示中文如下圖，則表明 ghostscript 已支持 Windows 中文字體。

.. figure:: /images/GMT_chinese_windows_fonts.png
   :width: 100%
   :align: center

.. note::

    PS文件本質上是一個純文本文件，可以用\ **編輯器**\ 打開該PS文件以查看其內容。

    PS 文件中要使用某個中文字體，需要用 ``FontName-CMap`` 的格式來調用。
    其中 ``FontName`` 即 gs 中文配置文件中給定的字體名。CMap 可以取 ``UniGB-UTF8-H``
    和 ``GB-EUC-H``\ ， Linux 下一般用前者，Windows 下一般用後者，用於指定漢字或中文
    字體的編碼。

GMT 中文支持
------------

新建GMT自定義字體配置文件 ``~/.gmt/PSL_custom_fonts.txt`` （若不存在 ``~/.gmt``
目錄則需新建該目錄）。

向 GMT自定義字體配置文件 ``~/.gmt/PSL_custom_fonts.txt`` 中加入如下語句::

    STSong-Light-UniGB-UTF8-H  0.700    1
    STFangsong-Light-UniGB-UTF8-H  0.700    1
    STHeiti-Regular-UniGB-UTF8-H   0.700   1
    STKaiti-Regular-UniGB-UTF8-H   0.700   1

第一列爲字體名，第二列爲字母 A 的高度，第三列與編碼有關。

用 ``gmt pstext -L`` 命令查看 GMT 當前的字體配置::

    $ gmt pstext -L
    Font #  Font Name
    ------------------------------------
    0   Helvetica
    1   Helvetica-Bold
    ...    ......
    39 STSong-Light-UniGB-UTF8-H
    40 STFangsong-Light-UniGB-UTF8-H
    41 STHeiti-Regular-UniGB-UTF8-H
    42 STKaiti-Regular-UniGB-UTF8-H

其中 0-38 爲 GMT/gs 默認支持的字體，39-42 爲新添加的中文字體。
以後要用中文字體時，需要用這些編號來指定字體，也許你的機器上的編號和這裏不同。

GMT 中文測試
------------

測試腳本：

.. code-block:: bash

   #!/bin/bash
   gmt begin GMT_Chinese png,pdf
   gmt set FONT_TITLE 30p,39,black
   gmt set FONT_LABEL 15p,39,black

   gmt text -R0/10/0/4 -JX15c/5c -Bxafg+l"X軸" -Byafg+l"Y軸" \
            -BWSen+t"中文標題" -F+f << EOF
   3 2.5 35p,39,black GMT宋體
   3 1.0 35p,40,blue GMT仿宋
   7 2.5 35p,41,yellow GMT黑體
   7 1.0 35p,42,green GMT楷體
   EOF
   gmt end

成圖效果如下：

.. figure:: /images/GMT_chinese.png
   :width: 100%
   :align: center

對其他發行版的若干說明
----------------------

其他發行版與 CentOS 7 之間或多或少有一些區別，列舉如下。

CentOS 6
~~~~~~~~

1.  ghostscript 中文配置文件需要用如下命令安裝::

        sudo yum install cjkuni-fonts-ghostscript

    在安裝配置文件的同時會安裝中文字體 uming 和 ukai。

2.  ghostscript 中文配置文件中給定的字體路徑： ``/usr/share/fonts/cjkuni/uming.ttc``
    和 ``/usr/share/fonts/cjkuni/ukai.ttc`` 是錯誤的。正確的字體路徑是
    ``/usr/share/fonts/cjkui-uming/uming.ttc`` 和
    ``/usr/share/fonts/cjkuni-ukai/ukai.ttc``\ ，要注意改正。

Ubuntu 14.04/15.04
~~~~~~~~~~~~~~~~~~

1.  ghostscript 中文配置文件可以用如下命令安裝（默認已安裝）::

        sudo apt-get install poppler-data

2.  ghostscript 中文配置文件路徑爲： ``/etc/ghostscript/cidfmap.d/90gs-cjk-resource-gb1.conf``
3.  ghostscript 中文配置文件中默認使用的 Linux 字體爲 uming 和 ukai，需要通過如下命令安裝::

        sudo apt-get install fonts-arphic-uming fonts-arphic-ukai

4.  gs 中文配置文件的默認內容爲::

        /BousungEG-Light-GB <</FileType /TrueType /Path (/usr/share/fonts/truetype/arphic/uming.ttc) /SubfontId 0 /CSI [(GB1) 4] >> ;
        /GBZenKai-Medium    <</FileType /TrueType /Path (/usr/share/fonts/truetype/arphic/ukai.ttc) /SubfontId 0 /CSI [(GB1) 4] >> ;
        /Song-Medium /GBZenKai-Medium ;
        /STSong-Light /BousungEG-Light-GB ;
        /STFangsong-Light /BousungEG-Light-GB ;
        /STHeiti-Regular /BousungEG-Light-GB ;
        /STKaiti-Regular /BousungEG-Light-GB ;
        /Adobe-GB1      /BousungEG-Light-GB ;
        /Adobe-GB1-Bold /GBZenKai-Medium ;

    需要將該文件改成::

        % 原配置文件的內容，與 STSong-Light 等相關的四行必須刪除
        /BousungEG-Light-GB <</FileType /TrueType /Path (/usr/share/fonts/truetype/arphic/uming.ttc) /SubfontId 0 /CSI [(GB1) 4] >> ;
        /GBZenKai-Medium    <</FileType /TrueType /Path (/usr/share/fonts/truetype/arphic/ukai.ttc) /SubfontId 0 /CSI [(GB1) 4] >> ;
        /Song-Medium /GBZenKai-Medium ;
        /Adobe-GB1      /BousungEG-Light-GB ;
        /Adobe-GB1-Bold /GBZenKai-Medium ;

        % 新增 Windows 字體的支持
        /STSong-Light <</FileType /TrueType /Path (/usr/share/fonts/winfonts/simsun.ttc) /SubfontId 0 /CSI [(GB1) 4] >> ;
        /STFangsong-Light <</FileType /TrueType /Path (/usr/share/fonts/winfonts/simfang.ttf) /SubfontId 0 /CSI [(GB1) 4] >> ;
        /STHeiti-Regular <</FileType /TrueType /Path (/usr/share/fonts/winfonts/simhei.ttf) /SubfontId 0 /CSI [(GB1) 4] >> ;
        /STKaiti-Regular <</FileType /TrueType /Path (/usr/share/fonts/winfonts/simkai.ttf) /SubfontId 0 /CSI [(GB1) 4] >> ;

    修改完 ghostscript 中文配置文件後，必須要執行如下命令::

        $ sudo update-gsfontmap

    該命令會將 ``/etc/ghostscript/cidfmap.d/*.conf`` 合併成單獨的文件
    ``/var/lib/ghostscript/fonts/cidfmap``\ 。gs 在需要中文字體時會讀取
    ``/var/lib/ghostscript/fonts/cidfmap`` 而不是
    ``/etc/ghostscript/cidfmap.d/*.conf``\ 。這是 Ubuntu/Debian 和 CentOS 的
    一個很大不同。

Ubuntu 12.04
~~~~~~~~~~~~

1.  ghostscript 中文配置文件需要用如下命令安裝::

        sudo apt-get install gs-cjk-resource

2.  其他部分未做測試，估計跟 Ubuntu 15.05 差不多。

參考資料
--------

1. GMT 軟件顯示漢字的技術原理與實現，趙桂儒，《測繪通報》
2. `ghostscript 中文打印經驗 <https://web.archive.org/web/20180112111635/http://guoyoooping.blog.163.com/blog/static/13570518320101291442176>`_
3. `GMT 中文支持 <https://web.archive.org/web/20171130081550/http://xxqhome.blog.163.com/blog/static/1967330202011112810120598/>`_
4. `維基詞條：PostScript <https://en.wikipedia.org/wiki/PostScript>`_
5. `Debian Wiki <https://wiki.debian.org/gs-undefoma>`_
