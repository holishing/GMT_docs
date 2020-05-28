PROJ參數
========

本節列出投影相關參數，參數的默認值在中括號內列出。

.. glossary::

    **PROJ_LENGTH_UNIT**
        長度量的默認單位 [``c``]

        見 :doc:`/basis/unit` 一節的介紹。

    **PROJ_ELLIPSOID**
        地圖投影中使用的地球橢球標準 [``WGS-84``]

        GMT支持幾十種地球橢球標準（此處不一一列舉，詳見官方文檔）。除此之外，GMT還支持
        自定義橢球，用戶只需按照固定的格式對橢球命名，GMT會從橢球名字中提取半長軸
        以及扁率。可用的格式如下：

        - ``a``\ ：球半徑爲a，單位爲 ``m``\ ，扁率爲零。比如 ``6378137``
        - ``a,inv_f``\ ：\ ``inv_f`` 爲扁率的倒數，比如 ``6378137,298.257223563``
        - ``a,b=semi_minor``\ ：\ ``semi_minor`` 爲半短軸長度，單位爲 ``m``\ 。
          比如 ``6378137,b=6356752.3142``
        - ``a,f=flattening``\ ：\ ``flattening`` 爲扁率，比如 ``6378137,f=0.0033528``

        需要注意，對於某些全球投影，GMT會對選中的地球橢球做球狀近似，將扁率設爲零，
        並使用其平均半徑。當GMT做此類近似時，會給出警告信息。

    **PROJ_AUX_LATITUDE**
        球體近似時的輔助緯線 [authalic]

        在使用大圓弧距離計算方式時，需要將真實地球近似爲一個半徑爲
        :term:`PROJ_MEAN_RADIUS <PROJ_MEAN_RADIUS>` 的球體，在做球體近似時需要
        選擇合適的輔助緯線。可選值包括

        - ``authalic``
        - ``geocentric``
        - ``conformal``
        - ``meridional``
        - ``parametric``
        - ``none``

        當設置爲除 ``none`` 外的其他值時，GMT會在計算距離前，將大圓弧距離計算時使用的
        兩點中任意一點的緯度轉換成輔助緯度。

    **PROJ_MEAN_RADIUS**
        地球/行星的平均半徑 [authalic]

        在計算兩點間的大圓弧距離或區域的表面積時纔會被使用。可選值包括

        - ``mean (R_1)``
        - ``authalic (R_2)``
        - ``volumetric(R_3)``
        - ``meridional``
        - ``quadratic``

    **PROJ_SCALE_FACTOR**
        修改某些投影的地圖縮放因子以減小面積失真

        - Polar Stereographic：默認值爲0.9996
        - UTM：默認值爲0.9996
        - Transverse Mercator：默認值爲1

    **PROJ_GEODESIC**
        指定大地測量距離中所使用的算法 [Vincenty]

        可以取：

        #. ``Vincenty`` 默認值，精確到0.5mm
        #. ``Rudoe`` given for legacy purpose
        #. ``Andoyer`` 精度爲10米量級，比 ``Vincenty`` 快5倍
