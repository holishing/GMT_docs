GMT子圖模式
===========

有些時候，尤其是發表文章時，需要將多張獨立的圖放在一張圖中，並編號abcd，
一般稱這些獨立的圖爲子圖。

GMT中有兩種方式可以繪製多子圖：

- 常規方式：在繪圖時使用 :doc:`/option/XY` 手動移動每個子圖的原點
- 現代方式：使用 :doc:`/module/subplot` 模塊提供的子圖模式來佈局和管理多子圖

現代方式更加簡潔易用，建議使用現代方式。僅當圖片非常複雜或不規則時，才推薦
使用常規方式。

子圖佈局
--------

:doc:`/module/subplot` 模塊提供的子圖模式可以非常方便地繪製多子圖。

**subplot begin** 用於設計子圖的佈局、尺寸以及其它屬性。其將整張畫布劃分爲
N行M列的規則網格區域，每個網格區域內都可以包含一張獨立的子圖。例如::

    gmt subplot begin 2x3 -Fs5c/3c

定義了一個2行3列的子圖佈局。\ **-Fs5c/3c** 則指定了每個子圖區域的寬度爲5釐米，
高度爲3釐米。相鄰子圖之間的間隔則可以用 **-M** 選項控制。
最終得到的子圖佈局如下圖所示：

.. gmtplot::
    :show-code: false
    :width: 80%

    #!/usr/bin/env bash
    nrow=2
    ncol=3
    gmt begin subplot png,pdf
    gmt subplot begin ${nrow}x${ncol} -Fs5c/3c+d -Blrtb
        for index in $(seq 0 $((nrow*ncol-1))); do
        i=$((index/ncol))
        j=$((index%ncol))
        echo 0.5 0.5 '@;red;'$i,$j'@;;' '(@;blue;'$index'@;;)' | gmt text -R0/1/0/1 -F+f20p -c
        done
    gmt subplot end
    gmt end show

**subplot set** 用於激活指定的子圖，接下來的所有繪圖命令都將在該子圖內進行繪製。
爲了指定某個子圖，則需要知道每個子圖的編號。GMT中可以通過 **行號,列號** 或者
**索引號** （即第幾個子圖）的方式來指定子圖。

.. note::

    行號、列號和索引號，均從0開始起算。因而對於一個N行M列的子圖佈局而言，
    行號爲0到N-1，列號爲0到M-1，索引號爲0到N*M-1。

上圖中同樣給出了每個子圖的編號，圖中紅色數字爲子圖的行列號，而括號中的藍色數字則
是子圖的索引號。因而，你可以使用如下命令中的任意一個來激活第三個子圖，接下來的所有
繪圖命令均只在第三個子圖內進行::

    gmt subplot set 1,0

    gmt subplot set 3

最後記得使用 **subplot end** 退出子圖模式::

    gmt subplot end

第一張子圖
----------

下面就利用上面學到的知識繪製一張2行2列的子圖。

.. gmtplot::
    :width: 60%

    gmt begin map png,pdf
      gmt set FONT_TAG 15p FONT_HEADING 20p MAP_HEADING_OFFSET 0p
      gmt subplot begin 2x2 -Fs5c/3c -A -M0.2c/0.1c -T"My Subplot Heading"
        gmt subplot set 0
        gmt basemap -R0/10/0/10 -JX? -Baf -BWSen

        gmt subplot set 1
        gmt basemap -R0/20/0/10 -JX? -Baf -BWSen

        gmt subplot set 2
        gmt basemap -R0/10/0/20 -JX? -Baf -BWSen

        gmt subplot set 3
        gmt basemap -R0/20/0/20 -JX? -Baf -BWSen
      gmt subplot end
    gmt end show

在這個例子中，我們用 **subplot begin** 定義了一個2行2列（\ **2x2**\ ）的子圖佈局，
每個子圖區域寬5釐米高3釐米（\ **-Fs5c/3c**\ ）。除此之外，我們還使用了一些可選
選項對圖的細節進行微調：

-   **-A**: 對每個子圖進行自動編號abcd
-   **-M0.2c/0.1c**: 調整相鄰子圖之間的空白距離，X方向間隔爲0.2釐米，Y方向間隔爲0.1釐米
-   **-T"My Subplot Heading"**: 爲整張圖加上一個總標題
-   調整子圖編號的大小（:term:`FONT_TAG`\ ）、總標題文字大小（:term:`FONT_HEADING`\ ）
    以及總標題相對於底圖的偏移量（:term:`MAP_HEADING_OFFSET`\ ）

在子圖模式內，我們使用 **subplot set 0** 的方式依次激活每個子圖。在每個子圖內繪圖時，
我們使用了線性投影方式 **-JX?**\ 。通常我們需要指定圖片的寬度或高度，這裏我們使用了
**?** 讓GMT根據子圖區域的大小自動幫我們選擇最合適的子圖寬度。

.. tip::

    本示例中使用瞭如下命令來依次激活四個子圖::

        gmt subplot set 0
        gmt subplot set 1
        gmt subplot set 2
        gmt subplot set 3

    實際上，我們可以直接使用 **subplot set** 而不指定子圖編號，GMT會自動爲我們
    激活“下一個”子圖。

共用X/Y軸
---------

上面示例中的四張子圖，每行的兩張子圖有相同的Y軸範圍，每列的兩張子圖有相同的
X軸範圍。此時可以使用 **-S** 選項設置各子圖之間共用X或Y軸。

.. gmtplot::
    :width: 60%

    gmt begin map png,pdf
      gmt set FONT_TAG 15p FONT_HEADING 20p MAP_HEADING_OFFSET 10p
      gmt subplot begin 2x2 -Fs5c/3c -A -M0.2c/0.2c -T"My Subplot Heading" -SRl -SCb -BWSrt
        gmt basemap -R0/10/0/10 -JX? -c
        gmt basemap -R0/20/0/10 -JX? -c
        gmt basemap -R0/10/0/20 -JX? -c
        gmt basemap -R0/20/0/20 -JX? -c
      gmt subplot end
    gmt end show

**-SRl** 表示一行內（\ **R**\ ow\ ）的子圖共用Y軸，且只在左邊（\ **l**\ ）軸顯示標註，
**-SCb** 表示一列內（\ **C**\ olumn\ ）的子圖共用X軸，且只在底部（\ **b**\ ）軸顯示標註。

當然你也可以不使用 **-S** 選項，而是在每個子圖中使用不同的 **-B** 選項分別
爲每個子圖設置不同的軸屬性。

複雜佈局
--------

**subplot** 目前尚不支持嵌套。如果想要使用更復雜的子圖佈局，則需要更多的人工調整。

下面的例子在一個2行2列的子圖佈局中繪製了三張子圖，其中第一張子圖佔據了第一行。

.. gmtplot::
    :width: 75%

    gmt begin complex-subplot png,pdf
      gmt subplot begin 2x2 -Fs5c/3c -A
        gmt subplot set 0 -A'(a)'
        gmt basemap -R0/10/0/10 -JX11.75c/3c -Baf -BWSen
        echo 5 5 TEXT | gmt text -JX11.75c/3c
        gmt subplot set 2 -A'(b)'
        gmt basemap -R0/5/0/5 -JX? -Baf -BWSen
        gmt subplot set 3 -A'(c)'
        gmt basemap -R0/5/0/5 -JX? -Baf -BWSen
      gmt subplot end
    gmt end show

在繪製三個底圖時，後兩個底圖均使用了 **-JX?**\ ，因而GMT會自動根據子圖區域的
大小確定子圖的尺寸；而爲了使得第一張子圖佔據兩個子圖區域的空間，我們使用了
**-JX11.75c/3c** 來人工指定其子圖寬度，其中子圖寬度11.75釐米是需要人工調整的。

.. note::

    以上示例存在尚未修復的BUG。

    子圖模式下每張子圖的大小是由 **subplot begin** 的 **-F** 選項控制。
    用戶可以使用 **-J** 指定某個子圖的尺寸，但該尺寸不會被記住，接下來的
    命令若不指定 **-J** 則會使用子圖模式默認的尺寸，繼而出錯。

    目前的解決辦法是，在該子圖內的所有命令中均使用相同的 **-J** 選項。
    例如，子圖a強行指定了子圖大小爲 **-JX11.75c/3c**\ ，則該子圖內的其餘命令
    （如 **text** 命令）必須也使用 **-JX11.75c/3c**\ 。若省去，則圖會出錯。

由於我們跳過了第二個子圖區域，自動標籤功能會將三個子圖依次編號爲a、c、d，
這顯然不是我們想要的，因而我們使用了 **-A'(a)'** 選項手動設置子圖編號。
需要注意的是，由於小括號在Bash中有特殊含義，所以這裏 **(a)** 兩邊加了
單引號以避免Bash對小括號進行解釋。

.. note::

    對於Windows Batch用戶，不可使用單引號。可以使用雙引號，或者不使用引號。
