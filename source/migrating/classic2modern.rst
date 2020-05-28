經典模式 → 現代模式
===================

GMT6引入了一種全新的繪圖命令執行模式，稱之爲現代模式。
GMT5及之前版本的命令風格稱之爲經典模式。
GMT6既支持傳統的經典模式，也支持全新的現代模式。
因而GMT5的經典模式腳本不做任何修改即可直接在GMT6中執行。

經典模式的問題
--------------

下面給出了一個經典模式下常見的繪圖腳本::

    gmt makecpt -Chot -T-1000/1000 > mydata.cpt
    gmt grdimage globe.nc -JQ15c -Rg -Cmydata.cpt -I -P -K > map.ps
    gmt pscoast -J -R -Baf -Gred -K -O >> map.ps
    gmt psxy cities.txt -J -R -Sc0.2c -Gblue -K -O >> map.ps
    gmt pstext labels.txt -J -R -F+f12p -O >> map.ps
    gmt psconvert -A -P -Tf map.ps
    rm gmt.conf gmt.history mydata.cpt

上面的示例腳本以及實際使用中會發現GMT經典模式存在一些明顯的缺點或問題：

#. 默認紙張大小爲A4紙。如果不夠大，則需要自行設定紙張大小
#. 需要使用 **-P** 選項決定畫布的擺放方式（橫着放或豎着放）
#. 需要使用 **-K** 和 **-O** 選項，極易出錯
#. 每個繪圖命令都需要使用重定向符號 **>** 或 **>>**
#. 每個繪圖命令中都需要給定PS文件的名字
#. 每個繪圖命令都需要重複使用 **-J** 和 **-R** 選項
#. 繪圖結束時需要使用 **psconvert** 將生成的PS文件轉換爲PDF、JPG等格式
#. 繪圖結束時要刪除 :file:`gmt.conf` 和 :file:`gmt.history` 文件以免影響接下來的繪圖結果

現代模式的優點
--------------

上面的經典模式示例可以改成爲更簡單的現代模式::

    gmt begin map
        gmt makecpt -Chot -T-1000/1000
        gmt grdimage globe.nc -JQ15c -Rg -C -I
        gmt coast -Baf -Gred
        gmt plot cities.txt -Sc0.2c -Gblue
        gmt text labels.txt -F+f12p
    gmt end show

很顯然，現代模式下的GMT繪圖腳本更加簡潔。與經典模式相比，現代模式具有如下優點：

#. 默認紙張無窮大，不需要再擔心繪圖超過紙張範圍
#. 不再需要使用 **-P** 選項確定畫布的擺放方式（因爲紙張無窮大）
#. 不再需要考慮如何使用 **-K**, **-O** 選項
#. 不再需要使用重定向符號 **>** 或 **>>**\ ，也無需爲每個繪圖命令都指定PS文件名
#. 不再需要爲每個繪圖命令都使用 **-R** 和 **-J** 選項
#. 繪圖結束時會自動生成PDF等格式的圖片，無需調用 **psconvert** 做轉換
#. 生成的圖片會自動進行裁剪去除白邊
#. 整個繪圖過程在獨立的臨時文件下，多個腳本可以同時執行而不互相干擾，用戶完全
   不需要意識到 PS 文件的存在，不需要再手動清理 :file:`gmt.conf` 和
   :file:`gmt.history` 等臨時文件

除了上面列出的優點外，GMT現代模式還提供了更多的模塊/功能以簡化代碼，包括：

- :doc:`/module/subplot` 模塊：極大簡化了多子圖的繪製
- :doc:`/module/inset` 模塊：極大簡化了圖中圖的繪製
- :doc:`gmt:movie` 模塊：極大簡化了動畫的製作
- :doc:`/option/l`\ ：極大簡化了圖例的設置與繪製
- 提供了“當前CPT”的功能，多數情況下無須生成CPT到文件中

這些更方便的功能會在後面的文檔中更詳細地介紹。

從經典到現代
------------

將經典模式的腳本改成現代模式的腳本，基本可以遵循如下幾點：

#. 繪圖腳本以 **gmt begin** *figure* 開頭，以 **gmt end show** 結束
#. 去掉 **-K**, **-O**, **-P**, 重定向符號以及PS文件名
#. 去掉多餘的 **-J**, **-R** 選項
#. 某些模塊重新命名。經典模式下以 **ps** 開頭的模塊省略 **ps**\ ，
   比如 **pscoast** → **coast**\ 、\ **psbasemap** → **basemap**\ 。
   個別幾個模塊是例外，\ **psxy** → **plot**,\ **psxyz** → **plot3d**,
   **psscale** → **colorbar**
#. 在需要繪製多子圖、圖中圖時，考慮使用 **inset** 和 **subplot** 改寫
#. 現代模式下 **makecpt** 和 **grd2cpt** 默認將生成的CPT作爲當前CPT，
   而不輸出到文件中。這一特性在後面會具體介紹。如果需要生成CPT到文件中，
   需要額外使用 **-H** 選項。
