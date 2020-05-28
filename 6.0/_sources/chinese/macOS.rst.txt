macOS 下的 GMT 中文支持
=======================

本文介紹如何讓 GMT 在 macOS 下支持中文。

ghostscript的中文支持
---------------------

首先需要使 ghostscript 支持中文，這可以通過
`cjk-gs-support <https://github.com/texjporg/cjk-gs-support>`_ 項目提供的腳本
`cjk-gs-integrate.pl`_ 實現。

1.  下載腳本 `cjk-gs-integrate.pl`_
2.  ``cjk-gs-integrate.pl`` 腳本的執行依賴於命令 ``kpsewhich``\ ，該命令由 TeXLive 提供。
    執行 ``kpsewhich --version`` 檢查 ``kpsewhich`` 這個命令是否存在。若不存在，則
    需要單獨安裝。使用homebrew安裝 basictex 或 mactex-no-gui::

        # 以下二選一即可，第一個更小，第二個更完整
        brew cask install basictex
        brew cask install mactex-no-gui

3.  執行腳本::

        $ sudo perl cjk-gs-integrate.pl

    該腳本會自動搜索系統中自帶的中文字體，並生成gs支持中文所需的配置文件。

.. _cjk-gs-integrate.pl: https://raw.githubusercontent.com/texjporg/cjk-gs-support/master/cjk-gs-integrate.pl

GMT的中文支持
-------------

在 ``~/.gmt``\ （若無該文件夾，請自行新建）下創建字體配置文件::

    $ touch ~/.gmt/PSL_custom_fonts.txt
    $ open ~/.gmt/PSL_custom_fonts.txt

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

.. note::

    生成的 PNG、JPG格式的圖片中可直接顯示中文，
    而生成的 PDF 文件用 macOS 自帶的 PDF 預覽工具打開
    無法顯示中文，使用 Adobe Reader 打開則可以正常顯示中文。
