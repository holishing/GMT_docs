跨平臺GMT安裝方案
=================

跨平臺安裝方案是指，以下安裝方式同時適用於Linux、macOS和Windows。

通過 conda 安裝
---------------

`conda <https://conda.io/>`_ 是由 `Anaconda <https://www.anaconda.com/>`_ 提供的
一個跨平臺軟件包管理器。conda的 `conda-forge <https://conda-forge.org/>`_
通道提供了最新的GMT。

如果你是 Anaconda 用戶，則可以直接通過如下命令安裝。

安裝GMT 6.0.0::

    conda install gmt -c conda-forge

注意：由於conda-forge沒有提供Windows下的GraphicsMagick，因而Windows用戶還需
自行下載並安裝 GraphicsmMagick 才能製作GIF格式的動畫。

安裝完成後，在終端執行如下命令以驗證::

    $ gmt --version
    6.0.0
