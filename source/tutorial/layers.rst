理解圖層
========

在前面幾節中，我們已經學會了如何使用GMT繪製底圖、海岸線、線段、符號、文字、
地形起伏等等。這一節我們將把前面學到的內容綜合起來，試着去繪製下面這張
地震學經常見到的大圓弧路徑圖。在這一過程中，我們將試着去理解GMT中圖層的概念。

.. gmtplot:: layers-5.sh
    :width: 75%
    :show-code: false

圖件分析與拆解
--------------

上面這張圖看上去有些複雜，實際上是由很多部分構成的。將整張圖拆解一下可知，
上圖由如下幾個部分構成：

#. 地形起伏作爲底圖
#. 震中位置（五角星）
#. 臺站位置（三角形）
#. 射線路徑（圖中大圓弧）
#. 臺站名（文字）

這幾個部分，在教程的前幾節都已經做過介紹，因而只需要將前幾節的內容綜合起來即可。

繪製底圖
--------

我們首先使用 :doc:`/module/grdimage` 模塊繪製底圖，並使用 :doc:`/module/colorbar`
模塊添加色標：

.. gmtplot:: layers-1.sh
    :width: 75%

繪製震中和臺站位置
------------------

接下來，使用 :doc:`/module/plot` 模塊繪製五角星和三角形。

.. gmtplot:: layers-2.sh
    :width: 75%

繪製射線路徑
------------

再使用 :doc:`/module/plot` 模塊繪製線段。
默認情況下，\ **plot**\ 會自動用大圓路徑連接地球上的兩個位置，
因而我們只需要用 ``>`` 分隔多個線段，每個線段給定兩個座標點（即地震位置和臺站位置）
即可。

.. gmtplot:: layers-3.sh
    :width: 75%

添加臺站名
----------

最後還需要往圖畫裏添加臺站所在地區的名字。添加文字使用 :doc:`/module/text` 模塊。
這裏我們使用了 **-F+f9p,1,black+j** 選項，因而輸入數據是4列::

    X   Y   對齊方式    TEXT

**-Dj0.1c/0.1c** 則是將文本在對齊方式的基礎上做進一步的偏移以避免文字覆蓋線段或符號。

.. gmtplot:: layers-4.sh
    :width: 75%

圖層的先後順序
--------------

上面的繪圖腳本已經基本繪製出我們最初想要的圖件了。細細看會發現，還有一些不完美的
地方：比如黃色五角星和三角形被線段蓋住了。

這是因爲，GMT的每一個繪圖命令都會產生一個圖層，後繪製的圖層會覆蓋在先繪製的圖層
的上面，即後來者居上。解決辦法也很簡單，先繪製線段，再繪製三角形和五角星即可。

對腳本中命令的先後順序進行微調，如下所示：

.. gmtplot:: layers-5.sh
    :width: 75%

這樣我們就通過組合一系列簡單的GMT命令，得到了一個複雜的GMT圖件。
