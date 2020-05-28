IO參數
======

表數據相關參數
--------------

.. glossary::

    **IO_HEADER**
        指定輸入/輸出的表文件中是否有文件頭記錄 [false]

        可以取 ``true|false``\ 。若值爲 ``true``\ ，則等效於使用 :doc:`/option/h`

    **IO_HEADER_MARKER**
        輸入ASCII表文件中文件頭記錄的標識符 [``#``]

        若希望輸入和輸出數據中使用不同的文件頭標識符，則可以使用逗號分隔輸入和
        輸出數據的文件頭標識符，比如 ``#,:``\ 。

    **IO_N_HEADER_RECS**
        在使用 ``-h`` 選項時，要跳過的文件頭記錄的數目 [0]

        見 :doc:`/option/h` 和 :doc:`/table/ascii`\ 。

    **IO_FIRST_HEADER**
        若整個數據中只有一個數據段時，是否要寫這個數據段的文件頭記錄。
        默認情況下，只有當這個單獨段的頭段記錄中有額外的內容時纔會寫該頭記錄。
        可選的值包括 ``always``\ 、\ ``never`` 和 ``maybe`` [``maybe``]

    **IO_COL_SEPARATOR**
        GMT輸出ASCII表數據時列與列之間的分隔符 [tab]

        可以取 ``tab``\ 、\ ``space``\ 、\ ``comma`` 和 ``none``

    **IO_SEGMENT_MARKER**
        多段數據中每段數據開始的標識符 [``>``]

        見 :doc:`/table/ascii` 中的相關介紹。
        若希望輸入和輸出數據中使用不同的數據段標識符，則可以使用逗號分隔輸入和
        輸出數據的段標識符，比如 ``>,:``\ 。

        有兩個特殊的標識符：

        #. ``B`` 表示將空行作爲數據段開始的標識符
        #. ``N`` 表示將一個NaN記錄作爲數據段開始的標識符

        若想要將字符 ``B`` 或 ``N`` 作爲段數據標識符，而不是使用上面提到的特殊含義，
        則必須使用 ``\B`` 或 ``\N``\ 。

    **IO_SEGMENT_BINARY**
        二進制數據中，某個記錄的所有值都是NaN時該如何解釋 [2]

        默認情況下，當二進制數據中某個記錄的值爲NaN的列數超過了 ``IO_SEGMENT_BINARY``
        的值時，則將該記錄解釋爲二進制數據中的數據段頭記錄。將該參數賦值爲0或off可以
        關閉這一特性。

網格檔相關參數
----------------

.. glossary::

    **IO_NC4_CHUNK_SIZE**
        控制寫netCDF文件時的分塊大小 [auto]

    **IO_NC4_DEFLATION_LEVEL**
        輸出netCDF4格式的數據時所使用的壓縮等級 [3]

        可以取0到9的整數，0表示不壓縮，9表示最大壓縮。低壓縮率可以提高性能並減少文件尺寸，
        而高壓縮率雖然可以進一步減小文件尺寸，但卻需要更多的處理時間。

    **IO_GRIDFILE_SHORTHAND**
        是否支持自動識別網格檔後綴的功能 [false]

        GMT中也可以將網格檔的後綴與網格檔格式關聯起來
        這樣GMT就可以直接根據文件後綴確定網格檔的格式了。

        這一特性通過一個叫 ``gmt.io`` 的文件來實現。GMT會依次在當前目錄、家目錄或
        ``~/.gmt`` 目錄下尋找 ``gmt.io``\ 。

        ``gmt.io`` 的示例格式如下::

            # GMT i/o shorthand file

            # It can have any number of comment lines like this one anywhere
            # suffix format_id scale offset NaN Comments
            grd        nf        -     -      -    Default format
            b          bf        -     -      -    Native binary floats
            i2         bs        -     -    32767  2-byte integers with NaN value
            ras        rb        -     -      -    Sun raster files
            byte       bb        -     -     255   Native binary 1-byte grids
            bit        bm        -     -      -    Native binary 0 or 1 grids
            mask       bm        -     -      0    Native binary 1 or NaN masks
            faa        bs       0.1    -    32767  Native binary gravity in 0.1 mGal
            ns         ns        a     a      -    16-bit integer netCDF grid with auto-scale and auto-offset

        要使用這一特性，需要將參數 :term:`IO_GRIDFILE_SHORTHAND <IO_GRIDFILE_SHORTHAND>`
        設置爲 ``true``\ 。此時，文件名 ``file.i2`` 等效於 ``file.i2=bs///32767``\ ，
        ``wet.mask`` 等效於 ``wet.mask=bm+n0``\ 。

    **IO_GRIDFILE_FORMAT**
        GMT默認使用的網格檔格式 [nf]

        見 :doc:`/grid/format` 一節。

其他IO參數
----------

.. glossary::

    **IO_LONLAT_TOGGLE**
        數據的前兩列是緯度、經度而不是經度、緯度 [false]

        該參數的作用與 :doc:`/option/colon` 功能相同。其可以取如下值：

        #. ``false`` 默認值，輸入/輸出數據均爲 (x, y)
        #. ``true`` 輸入/輸出數據均爲 (y, x)
        #. ``IN`` 僅輸入數據爲 (y, x)
        #. ``OUT`` 僅輸出數據爲 (y, x)

    **IO_NAN_RECORDS**
        控制當讀入的記錄中的X、Y或Z包含NaN記錄時的處理方式 [pass]

        可以取如下值：

        - ``skip``\ ：直接跳過NaN記錄，並報告NaN記錄的數目
        - ``pass``\ ：將所有記錄傳遞給程序
