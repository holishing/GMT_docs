添加圖例
========

繪製了線條與符號後，通常還需要添加圖例，以解釋不同數據的含義。
GMT中使用 :doc:`/module/legend` 模塊添加圖例。

自動圖例
--------

在使用 :doc:`/module/plot` 模塊繪製線條或符號時，可以額外加上 **-l**\ *label*
選項以指定當前線段或符號的圖例標籤。

下面的示例中，我們利用前面學到的知識繪製了線段和兩種符號，同時使用了 **-l**
選項爲線段和符號均添加了標籤。在繪圖結束時，GMT會自動根據命令中提供的信息
在右上角繪製了圖例。

.. gmtplot::
    :width: 50%

    gmt begin auto-legend png,pdf
    gmt basemap -R0/10/0/10 -JX10c -Baf
    gmt plot -W1p,blue -l"Profile" << EOF
    3 3
    6 8
    EOF
    gmt plot -Gred -Sa0.3c -W0.5p -l"Event" << EOF
    5  5
    EOF
    gmt plot -Gblue -St0.3c -W0.5p -l"Station" << EOF
    2 3
    4 6
    8 5
    EOF
    gmt end show

還可以爲 **-l** 選項加上其它子選項以控制圖例的位置、大小以及其它顯示效果，
在本教程中不再贅述。

設置圖例屬性
------------

GMT 使用 **legend** 模塊添加圖例。上面的示例中我們並沒有調用 **legend** 模塊，
而是 GMT 在繪圖結束時自動調用了 **legend** 添加圖例。我們也可以顯式調用
**legend** 模塊，並設置圖例的更多屬性。

.. gmtplot::
    :width: 50%

    gmt begin auto-legend png,pdf
    gmt basemap -R0/10/0/10 -JX10c -Baf
    gmt plot -W1p,blue -l"Profile" << EOF
    3 3
    6 8
    EOF
    gmt plot -Gred -Sa0.3c -W0.5p -l"Event" << EOF
    5  5
    EOF
    gmt plot -Gblue -St0.3c -W0.5p -l"Station" << EOF
    2 3
    4 6
    8 5
    EOF
    gmt legend -DjBR+o0.1c/0.1c -F+p1p+glightblue
    gmt end show

這個示例中，我們顯式調用了 **legend** 選項，並設置了 **-D** 和 **-F** 選項。

- **jBR** 表示將圖例放在底圖的右下角（BottomRight）
- **+o0.1c/0.1c** 表示將圖例在右下角的基礎上再加上額外的偏移量
- **-F+p1p+glightblue** 則設置了圖例框的輪廓和填充色

手動設置圖例
------------

如果對於自動生成的圖例不滿意，還可以使用 :doc:`/module/legend` 模塊繪製更復雜的圖例，
其輸入文件有自己的一套規則，詳情見 :doc:`/module/legend` 模塊的說明文檔。
這節只介紹最簡單也最常用的圖例，即符號和線條的圖例。
針對繪製符號和線條，\ :doc:`/module/legend` 的輸入格式爲：

    **S** *dx1* *symbol* *size* *fill* *pen* *dx2* *text*

- **S** 表明這一行用於繪製符號或線段。
- *dx1* 是符號或線段與圖例左邊框的距離
- *symbol* 是要繪製的符號類型代碼；若想要繪製線段，則設置 *symbol* 爲 **-**
- *size* 符號尺寸或線段長度
- *fill* 符號填充色；若不需要填充色，則可設置爲 **-**
- *pen* 符號輪廓的畫筆顏色；若不需要繪製符號輪廓，則可設置爲 **-**
- *text* 符號對應的文字說明
- *dx2* 文字與左邊框之間的距離

下面的示例中，我們繪製了四種符號，以及線段、矢量線和斷層線。

.. gmtplot::
    :width: 70%

	gmt begin map png,pdf
	gmt basemap -R0/10/0/8 -JX10c/8c -Baf -BWSen
	cat > legend.txt << EOF
	# symbols
	S 0.25c c 0.3c -      0.25p,blue 0.8c circle
	S 0.25c t 0.3c cyan   0.25p      0.8c triangle
	S 0.25c i 0.3c blue   0.25p,red  0.8c triangle2
	S 0.25c e 0.3c yellow 0.25p      0.8c ellipse
	# lines
	S 0.25c - 0.5c - 0.25p 0.8c line
	S 0.25c - 0.5c - 0.25p,- 0.8c dashline
	S 0.25c v0.1i+a40+e 0.25i magenta 0.25p 0.8c vector
	S 0.25c f0.1i+l+t 0.25i blue 0.25p 0.8c fault
	EOF
	gmt legend legend.txt -DjBR+w2.8c+o0.1c/0.1c -F+p1p+glightblue
	gmt end show
