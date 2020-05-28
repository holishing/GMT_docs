FONT參數
========

這一節列出所有字體相關的參數，參數的默認值在中括號內列出。

.. glossary::

    **FONT**
        同時設置所有FONT類參數（\ ``FONT_LOGO`` 除外）的字體

    **FONT_ANNOT**
        同時設置 ``FONT_ANNOT_PRIMARY`` 和 ``FONT_ANNOT_SECONDARY`` 的值。

    **FONT_ANNOT_PRIMARY**
        一級（Primary）標註的字體 [``12p,Helvetica,black``]

        若在該參數的值前加上 ``+``\ ，則其它字體、偏移量、刻度長度等參數值會
        相對於 ``FONT_ANNOT_PRIMARY`` 成比例縮放。

    **FONT_ANNOT_SECONDARY**
        二級（Secondary）標註的字體 [``14p,Helvetica,black``]

    **FONT_LABEL**
        軸標籤的字體 [``16p,Helvetica,black``]

    **FONT_TITLE**
        圖上方標題的字體 [``24p,Helvetica,black``]

    **FONT_HEADING**
        子圖模式下總標題的字體 [``32p,Helvetica,black``]

    **FONT_TAG**
        子圖模式下每個子圖編號（如 ``a)``\ 、\ ``ii)`` 等）的字體 [``20p,Helvetica,black``]

    **FONT_LOGO**
        GMT時間戳中字符串的字體 [``8p,Helvetica,black``]

        該參數中僅字體ID有效，字號及顏色均無效。

