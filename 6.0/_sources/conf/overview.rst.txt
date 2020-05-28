配置參數簡介
============

除了豐富的命令行選項之外，GMT提供了150多個配置參數，用於控制圖像的外觀
（如底圖邊框的畫筆粗細、顏色，文字標註的字體、大小和顏色等）和
數據的處理方式（如默認的插值方式、地圖投影使用的橢球等）等。

查看配置參數的值
----------------

每個配置參數都有一個系統默認值。使用::

    gmt defaults -D

即可查看所有GMT配置參數及其默認值。

使用::

    gmt get FORMAT_GEO_MAP

可以查看單個配置參數 ``FORMAT_GEO_MAP`` 的當前值。

修改配置參數的值
----------------

GMT提供了多種方法來控制或修改配置參數的值。

設置全局參數
    用 :doc:`/module/gmtset` 模塊可以爲GMT設置全局參數，此類參數會影響到接下來
    所有GMT命令的執行，直到繪圖結束或者被 :doc:`/module/gmtset` 再次修改爲
    其他值爲止。例如::

        gmt begin map png
        # 設置全局參數 FONT_ANNOT_PRIMARY 的值爲 12p,Times-Bold,red
        gmt set FONT_ANNOT_PRIMARY 12p,Times-Bold,red
        gmt basemap ...
        gmt end

設置臨時參數
    在單個命令上加上 ``--KEY=value`` 可以臨時設置配置參數的值。此類參數僅對當前
    命令有效，而不影響接下來其他命令的執行效果。例如::

        gmt begin map png
        # 使用默認參數繪製底圖
        gmt basemap ...
        # 該底圖的 FONT_ANNOT_PRIMARY 爲 12p,Times-Bold,red
        gmt basemap ... --FONT_ANNOT_PRIMARY=12p,Times-Bold,red
        # 使用默認參數繪製底圖
        gmt basemap ...
        gmt end

使用配置文件設置全局參數
    可以將需要配置的一系列參數值寫到GMT配置文件 :file:`gmt.conf` 中。
    當GMT在執行時，會在當前目錄->\ ``~/.gmt/``\ 以及家目錄下尋找GMT配置文件
    :file:`gmt.conf`\ 。若找到該配置文件，則會讀取該配置文件中參數的值作爲
    全局參數。

    此種方式通常用於製作某個特定風格的圖件（比如黑底白線）或者某個符合某個期刊
    特定要求的圖件。可以使用::

        gmt defaults -D > gmt.conf

    生成一個包含所有參數的配置文件，然後手動修改。
