其他參數
========

本節介紹GMT中的其他參數，參數的默認值在中括號內列出。

數據下載相關參數
----------------

.. glossary::

    **GMT_AUTO_DOWNLOAD**
        是否允許GMT自動從GMT服務器（由 :term`GMT_DATA_SERVER` 控制）下載數據文件到
        緩存目錄，可以取 **on** 或者 **off** [``on``]

    **GMT_DATA_SERVER**
        GMT數據服務器地址，默認使用SOEST官方鏡像 [https://oceania.generic-mapping-tools.org/]

    **GMT_DATA_SERVER_LIMIT**
        從GMT服務器上下載的單個文件的大小上限，默認無限制。
        可以給定文件大小上限的字節數，也可以加上 ``k``\ 、\ ``m``\ 或 ``g`` 表示
        KB、MB 或 GB。

算法選擇相關參數
----------------

.. glossary::

    **GMT_TRIANGULATE**
        設置 :doc:`gmt:triangulate` 模塊中算法代碼的來源 [Watson]

        :doc:`gmt:triangulate` 模塊的核心源碼有兩個版本，
        ``Watson`` 的版本遵循GPL，\ ``Shewchuk`` 的版本不遵循GPL。
        該選項用於控制要使用哪個版本，\ ``Shewchuk`` 版本擁有更多功能。

    **GMT_FFT**
        要使用的FFT算法 [auto]

        可以取：

        #. ``auto``\ ：自動選擇合適的算法
        #. ``fftw[,planner]``\ ：FFTW算法，其中 ``planner`` 可以取 ``measure|patient|exhaustive``
        #. ``accelerate`` OS X下使用Accelerate Framework
        #. ``kiss``\ ：kiss FFT
        #. ``brenner``\ ：Brenner Legacy FFT

    **GMT_INTERPOLANT**
        程序中一維插值所使用的算法 [``akima``]

        #. ``linear``\ ：線性插值
        #. ``akima``\ ：akima's spline
        #. ``cubic``\ ：natural cubic spline
        #. ``none``\ ：不插值

    **GMT_EXTRAPOLATE_VAL**
        外插時超過數據區時如何處理 [NaN]

        可選值包括：

        #. ``NaN``\ ：區域範圍外的值一律爲NaN
        #. ``extrap``\ ： 使用外插算法計算的區域外的值
        #. ``extrapval,val``\ ：設置區域外的值爲 ``val``

其他參數
--------

.. glossary::

    **GMT_EXPORT_TYPE**
        控制表數據的數據類型，僅被外部接口使用 [``double``]

        可以取 ``double``\ 、\ ``single``\ 、\ ``[u]long``\ 、\ ``[u]int``\ 、
        ``[u]short``\ 、\ ``[u]char``\ 。

    **GMT_CUSTOM_LIBS**
        要鏈接的自定義GMT庫文件，默認值爲空

        GMT支持自定義模塊。用戶可以寫一個GMT模塊，並將其編譯成動態函數庫。通過設置
        該參數告知GMT該函數庫的位置，即可通過 ``gmt xxx`` 的語法調用自定義模塊，以
        實現擴充GMT功能的目的。

        該參數用於指定自定義動態庫函數的路徑，多個路徑之間用逗號分隔。
        路徑可以是共享庫文件的絕對路徑，也可以是其所在的目錄。若路徑是一個目錄名，
        該目錄必須需斜槓或反斜槓結尾，表明使用該目錄下的全部共享庫文件。
        在Windows下，若目錄名是 ``/``\ ，則表示在GMT的bin目錄下的 ``gmt_plugins``
        子目錄下尋找庫文件。

    **GMT_LANGUAGE**
        設置GMT繪圖時使用的語言 [``us``]

        不同的語言中，月份、星期幾、東西南北的表達方法是不同的。
        該參數用於設置GMT繪圖時所使用的語言。GMT支持多種語言，各語言的定義文件
        位於GMT安裝目錄中 ``share/localization`` 目錄下的文件。

        此處僅列舉幾個常見語言如下：

        - ``cn1``\ 簡體中文
        - ``cn2``\ 繁體中文
        - ``uk``\ 英式英語
        - ``us``\ 美式英語
        - ``jp``\ 日語
        - ``kr``\ 韓語
        - ...

        實際使用時，除了需要修改該參數外，可能還需要修改相應的字符編碼和字體。

        若設置語言爲 ``cn1`` 即簡體中文並正確設置中文字體，則GMT在繪製時可以顯式
        “一月”、“星期一”、“週一”等中文。相關示例見
        :doc:`/chinese/showcase`\ 。

    **GMT_COMPATIBILITY**
        是否開啓兼容模式 [4]

        - 若值爲4，表示兼容GMT4語法並給出警告
        - 若值爲5，則表示不兼容GMT4語法，嚴格遵守GMT5語法，遇到GMT4語法時直接報錯

    **GMT_VERBOSE**
        控制GMT命令的verbose級別 [``c``]

        可選值包括 ``quiet``\ 、\ ``normal``\ 、\ ``compat``\ 、\ ``verbose``\ 、
        ``long``\ 、\ ``debug``\ 。
        也可以直接使用每個級別的第一個字母。每個級別的具體含義見 :doc:`/option/V` 一節。

    **GMT_HISTORY**
        GMT歷史文件 ``gmt.history`` 的處理方式 [true]

        - ``true`` 可以讀寫
        - ``readonly`` 只能讀不能寫
        - ``false`` 不顯示歷史文件

    **GMT_GRAPHICS_FORMAT**
        現代模式下默認的圖片文件格式 [pdf]
