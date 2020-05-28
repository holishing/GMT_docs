COLOR參數
=========

這一節列出所有與顏色相關的配置參數，參數的默認值在中括號內列出。

CPT相關參數
-----------

.. glossary::

    **COLOR_BACKGROUND**
        數據Z值小於CPT文件中最小值時使用的背景色 [``black``]

    **COLOR_FOREGROUND**
        數據Z值大於CPT文件中最大值時使用的前景色 [``white``]

    **COLOR_NAN**
        數值Z值爲 NaN 時使用的顏色 [``127.5``]

    **COLOR_MODEL**
        對CPT文件做插值生成新CPT時所使用的色彩模型 [``none``]

        可以取如下值：

        - ``none``\ ：使用CPT文件中指定的 ``COLOR_MODEL``
        - ``rgb``\ ：在RGB色彩空間中插值
        - ``hsv``\ ：在HSV色彩空間中插值
        - ``cmyk``\ ：假定顏色是CMYK色彩空間，但在RGB空間內插值

光照相關參數
------------

某些繪圖模塊（如 :doc:`/module/grdimage`\ 、\ :doc:`/module/colorbar`\ ）
可以利用強度文件模擬光照效果。
光照效果的實現，本質上是先將任意顏色轉換成HSV模型，然後根據
強度的正負，增大/減小HSV模型中的S（飽和度）和V（明度），以達到模擬光照的效果。
下面的四個參數控制了模擬光照過程中S和V變化的極限值，以避免模擬的光照過亮或過暗。

.. glossary::

    **COLOR_HSV_MIN_S**
        負強度最小值對應的S值，取值範圍0到1 [1.0]

    **COLOR_HSV_MAX_S**
        正強度最大值對應的S值，取值範圍0到1 [0.1]

    **COLOR_HSV_MIN_V**
        負強度最小值對應的V值，取值範圍0到1 [0.3]

    **COLOR_HSV_MAX_V**
        正強度最大值對應的V值，取值範圍0到1 [1.0]
