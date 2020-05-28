畫布
====

要畫一張圖，首先需要準備一個畫布。GMT默認的畫布是一個PDF文件。

圖片格式
--------

GMT支持多種矢量圖片格式和位圖圖片格式。

矢量圖片格式包括PDF（推薦使用）、PS 和 EPS 格式；位圖圖片格式包括PNG（推薦）、
JPG（推薦）、BMP、PPM和TIFF格式。

在開始GMT繪圖時，即可指定要生成的圖片格式。例如，下面的示例指明同時生成PDF和PNG格式的圖片::

    gmt begin figname pdf,png
    gmt ...
    gmt end show

.. tip::

    如無特殊需求，不建議使用PS圖片格式。PS圖片格式具有如下缺點（在後面會提到）：

    #. 不支持透明色
    #. 默認畫布大小爲A4，而其它格式默認畫布大小均爲11.55米x11.55米（允許的最大尺寸）
    #. PS閱讀器只有一兩款，不如PDF或其它圖片格式選擇性多

畫布顏色
--------

默認的畫布顏色爲白色，可以通過修改GMT參數 :term:`PS_PAGE_COLOR` 來修改畫布顏色::

    gmt begin map pdf,png
    gmt set PS_PAGE_COLOR lightred
    gmt ...
    gmt end show

畫布大小
--------

GMT中默認使用寬11.55米、高11.55米的畫布，繪圖原點位於畫布左下角。
在最終生成圖片文件時會自動將未使用的白色區域裁減掉，因而用戶無需關心畫布大小。

若需要生成特定尺寸的圖片，而不裁剪周邊的白色區域，可以修改GMT參數
:term:`PS_MEDIA` 來指定紙張尺寸::

    gmt begin map
    gmt set PS_MEDIA A4
    gmt ...
    gmt end show

PS圖片格式是一個例外。若選擇PS作爲圖片格式，則默認畫布大小爲 A4 紙大小。
當用戶需要更大的畫布時，則必須修改GMT參數 :term:`PS_MEDIA` 來修改畫布尺寸::

    gmt begin map ps
    gmt set PS_MEDIA A1
    gmt ...
    gmt end

