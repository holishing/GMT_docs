GMT中文效果演示
===============

中文文字
--------

本例中展示瞭如何在繪圖時使用中文標籤和中文標題，以及如何打印橫排和豎排的中文。

- 左圖中Y軸標籤與縱軸平行
- 中圖中Y軸標籤與X軸平行
- 右圖中Y軸標籤單獨繪製並使用了豎排中文字體。

.. literalinclude:: chinese-texts.sh

.. figure:: chinese-texts.*
   :align: center
   :width: 80%

中文月份
--------

.. note::

    GMT中文語言文件是GMT安裝目錄下的文件 ``share/localization/gmt_cn1.locale``\ 。
    該中文語言文件默認爲GB2312編碼方式。對於Linux和macOS用戶，需要人工將其修改爲
    UTF8 編碼才能正常顯示中文的月份和星期。Windows用戶則不需要對其進行處理。

    修改文件編碼方式的方式有很多，請自行查找。我使用的是
    `enca <https://github.com/nijel/enca>`_ 的如下命令修改編碼::

        enca -L zh_CN -x UTF-8 gmt_cn1.locale

GMT支持中文的月份。要想使用中文表示月份，需要設置 :term:`GMT_LANGUAGE` 爲中文，
即 ``cn1``\ ，並設置標註的字體爲中文。

.. literalinclude:: chinese-months.sh

.. figure:: chinese-months.*
   :align: center
   :width: 80%

中文星期
--------

GMT支持中文的星期。要想使用中文表示星期幾，需要設置 :term:`GMT_LANGUAGE` 爲中文，
即 ``cn1``\ ，並設置標註的字體爲中文。

.. literalinclude:: chinese-weeks.sh

.. figure:: chinese-weeks.*
   :align: center
   :width: 80%
