FORMAT參數
==========

下面列出所有與格式相關的參數，通常包括輸入格式、輸出格式和繪圖格式三類，
參數的默認值在中括號內列出。

日期的輸入/輸出/繪圖格式
~~~~~~~~~~~~~~~~~~~~~~~~

.. glossary::

    **FORMAT_DATE_IN**
        輸入數據中日期字符串的格式模板 [``yyyy-mm-dd``]

        日期字符串可以用公曆表示，也可以用ISO周曆表示。

        對於公曆而言，可以將如下模板做合理組合：

        - ``yyyy``\ ：四位年份
        - ``yy``\ ：兩位年份
        - ``mm``\ ：兩位月份
        - ``o``\ ：月份的名稱簡寫
        - ``dd``\ ：兩位日期
        - ``jjj``\ ：一年中的第幾天

        比如 ``ddmmyyy``\ 、\ ``yy-mm-dd``\ 、\ ``dd-o-yyyy``\ 、\ ``yyyy/dd/mm``\ 、
        ``yyyy-jjj`` 等。

        對於ISO周曆而言，其格式爲 ``yyyy[-]W[-]ww[-]d`` 模板，表示某年的第ww周的第d天。
        比如 ``yyyyWwwd`` 或 ``yyyy-Www`` 等。

    **FORMAT_DATE_OUT**
        輸出日期字符串時所使用的格式 [``yyyy-mm-dd``]

        參考 :term:`FORMAT_DATE_IN <FORMAT_DATE_IN>` 的相關說明。除此之外：

        - 若模板開頭有一個 ``-``\ ，則所有的整數年月日在輸出時會省略前置零。
          比如若使用模板 ``-yyyy-mm-dd`` 則輸出類似於 ``2012-1-3`` 而不是 ``2012-01-03``
        - 若模板爲 ``-``\ ，則輸出時省略日期，日期和時間中的 ``T`` 也會被省略

    **FORMAT_DATE_MAP**
        繪製日期字符串時所使用的格式 [``yyyy-mm-dd``]

        參考 :term:`FORMAT_DATE_IN <FORMAT_DATE_IN>` 和 :term:`FORMAT_DATE_OUT <FORMAT_DATE_OUT>`
        中的相關說明。除此之外，

        - 繪製月份名時的 ``mm`` 可以用 ``o`` 替代，即圖上顯示 ``Jan`` 而不是 ``01``
        - 用 ``u`` 代替 ``W[-]ww``\ ，即圖上顯示 ``Week 10`` 而不是 ``W10``

        所有的日期文本字符串都由 :term:`GMT_LANGUAGE <GMT_LANGUAGE>` 、
        :term:`FORMAT_TIME_PRIMARY_MAP <FORMAT_TIME_PRIMARY_MAP>` 和
        :term:`FORMAT_TIME_SECONDARY_MAP <FORMAT_TIME_SECONDARY_MAP>` 控制。

時間的輸入/輸出/繪圖格式
~~~~~~~~~~~~~~~~~~~~~~~~

.. glossary::

    **FORMAT_CLOCK_OUT**
        輸出時間字符串時所使用的格式 [``hh:mm:ss``]

        默認使用24小時制。若要使用12小時制，可以在字符串的最後加上
        ``am``\ 、\ ``AM``\ 、\ ``a.m.``\ 、\ ``A.M.``\ 。
        比如 ``hh:mm:ss.xxx``\ 、\ ``hh:mm``\ 、\ ``hh:mm.xxx``\ 、\ ``hha.m.`` 等等。

        - 若時間格式模板以 ``-`` 開頭，則輸出時間字符串時不會輸出前置0
        - 若時間格式模板爲 ``-``\ ，則在輸出日期時間時不輸出時間字符串

    **FORMAT_CLOCK_IN**
        輸入數據中時間數據的格式 [``hh:mm:ss``]

        默認使用24小時制，即 ``hh:mm:ss``\ ，若要使用12小時制，則在參數後加上
        ``am|pm|AM|PM``\ 。比如 ``hh:mm`` 或 ``hh:mm:ssAM``

    **FORMAT_CLOCK_MAP**
        圖上繪製時間字符串時所使用的格式 [``hh:mm:ss``]

地理座標的輸出/繪圖格式
~~~~~~~~~~~~~~~~~~~~~~~

.. glossary::

    **FORMAT_GEO_OUT**
        控制地理座標數據的輸出格式 [``D``]

        格式的通用形式有兩類：

        - ``[±]D``\ ：表示將地理數據以浮點數的形式輸出，浮點數的格式由
          :term:`FORMAT_FLOAT_OUT <FORMAT_FLOAT_OUT>` 決定

        - ``D``\ ：經度輸出範圍爲 -180到180
        - ``+D``\ ：經度輸出範圍爲 0到360
        - ``-D``\ ：經度輸出範圍爲 -360到0

        - ``[±]ddd[:mm[:ss]][.xxx][F|G]``

        - ``ddd``\ ：固定格式的整型弧度
        - ``:``\ ：分隔符
        - ``mm``\ ：固定格式的整型弧分
        - ``ss``\ ：固定格式的整型弧秒
        - ``.xxx``\ ：前一個量的小數部分
        - ``F``\ ：用WSEN後綴來表示正負號
        - ``G``\ ：與F相同，但後綴前有一空格
        - ``±``\ ：默認經度範圍爲-180到180，若加正號則範圍爲0到360，加負號則範圍爲-360到0

        示例及效果：

        - ``ddd:mmF`` => ``35:45W``
        - ``ddd:mmG`` => ``35:45 W``
        - ``ddd:mm:ss`` => ``40:34:24``
        - ``ddd.xxx`` => ``36.250``

    **FORMAT_GEO_MAP**
        繪圖時地理座標的顯示格式 [``ddd.mm.ss``]

        格式的具體定義參考 :term:`FORMAT_GEO_OUT <FORMAT_GEO_OUT>`\ ，
        但具體格式會進一步由 ``-B`` 選項中的值控制。除此之外，還可以在格式後面加上
        ``A`` 以表示繪製座標的絕對值。

浮點數的輸出/繪圖格式
~~~~~~~~~~~~~~~~~~~~~

.. glossary::

    **FORMAT_FLOAT_OUT**
        雙精度浮點數在輸出時所使用的格式 [``%.12lg``]

        具體的格式遵循C語言 ``printf`` 函數的格式定義，比如 ``%.3lf``\ 。

        若需要爲不同列指定不同的輸出格式，可以使用多個逗號分隔的 ``cols:format`` 形式。
        其中，\ ``cols`` 可以是列號（比如5代表數據的第六列），也可以是列範圍（比如3-7表示第4到8列），
        不指定 ``cols`` 的格式將用於其他餘下的列。比如 ``0:%.3lf,1-3:%.12lg,%lf``

        也可以列出N個用空格分隔的格式，這些格式分別應用到數據的前N列中，比如 ``%.3lf %.2lf %lf`` 。

        .. note::

            #. 由於 GMT 內部將所有數字以浮點型保存，因而若使用整型格式 ``%d`` 顯示則會出錯
            #. 若設置爲 ``%'lg``\ ，則 ``10000`` 會顯示成 ``10,000`` 。
               由於單引號的特殊意義，因而可能需要轉義，即寫成 ``%\'lg``

    **FORMAT_FLOAT_MAP**
        以雙精度浮點數形式繪製地圖邊框標註或等值線標註時所使用的格式 [``%.12lg``]

        見 :term:`FORMAT_FLOAT_OUT <FORMAT_FLOAT_OUT>` 中的相關說明。

其他數據的繪圖格式
~~~~~~~~~~~~~~~~~~

.. glossary::

    **FORMAT_TIME_MAP**
        同時設置 ``FORMAT_TIME_PRIMARY_MAP`` 和 ``FORMAT_TIME_SECONDARY_MAP`` 的值

    **FORMAT_TIME_PRIMARY_MAP**
        一級標註中月份、周名的格式 [``full``]

        可以取如下值：

        - ``full``\ ：顯示全稱，比如 ``January``
        - ``abbreviate``\ ：顯示簡稱，比如 ``Jan``
        - ``character``\ ：顯示單個字符，比如 ``J``

        還可以使用 ``Full``\ 、\ ``Abbreviate``\ 、\ ``Character`` 表示所有名字均大寫。

        全稱、簡稱以及單字符的定義見GMT安裝目錄下 ``share/localization`` 目錄中的
        語言定義文件。

    **FORMAT_TIME_SECONDARY_MAP**
        二級標註中月份、周名的格式 [full]

        見 :term:`FORMAT_TIME_PRIMARY_MAP <FORMAT_TIME_PRIMARY_MAP>` 中的相關說明。

    **FORMAT_TIME_STAMP**
        GMT時間戳中時間信息的顯示格式 [``%Y %b %d %H:%M:%S``]

        該選項的值用C函數 `strftime <http://www.cplusplus.com/reference/ctime/strftime/>`_
        解析，故而理論上可以包含任意文本。
