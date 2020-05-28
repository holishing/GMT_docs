Linux 下的 GMT 中文支持
=======================

本文介紹如何讓 GMT 在 Linux 下支持中文。

.. warning::

    據用戶反映，按照本文的步驟操作可能會導致ghostscript無法正常使用。

    若出現該問題，可以執行 ``sudo perl cjk-gs-integrate.pl --remove`` 命令
    撤銷 cjk-gs-integrate.pl 腳本的操作。

    若需要GMT中文支持，請轉向 :doc:`custom-fonts` 一文。

ghostscript的中文支持
---------------------

Linux 的中文字體較少，這裏使用 Windows 下提供的四個基本字體：宋體、仿宋、黑體和楷體。
對於 Windows 下的其他中文字體、Linux 的其他中文字體甚至日韓字體來說，方法類似。

可以使用 `cjk-gs-support <https://github.com/texjporg/cjk-gs-support>`_
項目提供的腳本 `cjk-gs-integrate.pl`_ 來實現ghostscript的中文支持。

1.  從Windows下獲取四種基本字體的字體文件（文件名類似於 ``simsun.ttc``\ ）並複製到
    ``/usr/share/fonts/winfonts/`` 目錄下
2.  下載腳本 `cjk-gs-integrate.pl`_
3.  ``cjk-gs-integrate.pl`` 腳本的執行依賴於命令 ``kpsewhich``\ ，該命令由 TeXLive 提供。
    執行 ``kpsewhich --version`` 檢查 ``kpsewhich`` 這個命令是否存在。若不存在，則
    需要單獨安裝。

    對於Ubuntu/Debian用戶，執行::

        sudo apt-get install texlive-binaries

    對於CentOS/RHEL/Fedora用戶，執行::

        sudo yum install texlive-kpathsea-bin

4.  執行腳本::

        $ sudo perl cjk-gs-integrate.pl

    該腳本會自動搜索系統中自帶的中文字體，並生成gs支持中文所需的配置文件。

.. _cjk-gs-integrate.pl: https://raw.githubusercontent.com/texjporg/cjk-gs-support/master/cjk-gs-integrate.pl

GMT的中文支持
-------------

在 ``~/.gmt``\ （若無該文件夾，請自行新建）下創建字體配置文件::

    $ touch ~/.gmt/PSL_custom_fonts.txt
    $ gedit ~/.gmt/PSL_custom_fonts.txt

打開 GMT 字體配置文件，在文件中加入如下語句::

    STSong-Light--UniGB-UTF8-H  0.700    1
    STFangsong-Light--UniGB-UTF8-H  0.700    1
    STHeiti-Regular--UniGB-UTF8-H   0.700   1
    STKaiti-Regular--UniGB-UTF8-H   0.700   1
    STSong-Light--UniGB-UTF8-V  0.700    1
    STFangsong-Light--UniGB-UTF8-V  0.700    1
    STHeiti-Regular--UniGB-UTF8-V   0.700   1
    STKaiti-Regular--UniGB-UTF8-V   0.700   1

這幾句話分別添加了宋體、仿宋、黑體和楷體四種字體的橫排和豎排兩種方式。

用 ``gmt text -L`` 命令查看 GMT 當前的字體配置::

    $ gmt text -L
    Font #  Font Name
    ------------------------------------
    0   Helvetica
    1   Helvetica-Bold
    ...    ......
    39 STSong-Light--UniGB-UTF8-H
    40 STFangsong-Light--UniGB-UTF8-H
    41 STHeiti-Regular--UniGB-UTF8-H
    42 STKaiti-Regular--UniGB-UTF8-H
    43 STSong-Light--UniGB-UTF8-V
    44 STFangsong-Light--UniGB-UTF8-V
    45 STHeiti-Regular--UniGB-UTF8-V
    46 STKaiti-Regular--UniGB-UTF8-V

其中 39-46 號字體爲新添加的中文字體。
以後要用中文字體時，需要用這些編號來指定字體，也許你的機器上的編號和這裏不同。

GMT 中文測試
------------

.. note::

   請自行確認你的中文字體編號。如果編號不是39到46，請自行修改以下測試腳本。

.. literalinclude:: GMT_Chinese.sh

成圖效果如下：

.. figure:: GMT_Chinese.*
   :width: 100%
   :align: center
