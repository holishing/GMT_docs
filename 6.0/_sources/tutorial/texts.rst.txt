添加文字
========

GMT的 :doc:`/module/text` 模塊可以用於添加文字。

最簡單的示例
------------

若需要添加文字，則輸入數據中必須給出文字的X和Y座標以及具體的文字。
因而，輸入數據有三列::

    X   Y   text

下面的示例首先用 **basemap** 模塊繪製了一張底圖，然後使用 **text** 模塊
在底圖的不同位置添加了文字。

.. gmtplot::
    :width: 60%

    gmt begin map png,pdf
    gmt basemap -R0/10/0/6 -JX10c/6c -Bafg1 -BWSen
    gmt text << EOF
    5 1 GMT TEXT1
    5 3 GMT TEXT2
    5 5 GMT TEXT3
    EOF
    gmt end show

文字屬性
--------

當然，我們可以爲文字設置更豐富的屬性，比如文字大小、字體、文字顏色以及文字旋轉角度等。
這可以通過 **-F** 選項來實現。

**-F+f**\ *font* 可以設置文字的屬性，包括文字大小、字體和顏色，三者之間用逗號分隔。
**-F+a** 則可以設置文字的旋轉角度。

.. note::

    GMT默認支持35種字體，可以使用 ``gmt text -L`` 查看GMT支持的字體名及其對應的字體編號。

下面的示例中，\ **-F+f16p,1,red+a30** 即表示文字大小爲16p，字體爲1號字體，顏色爲紅色，
文字旋轉角度爲30度。

.. gmtplot::
    :width: 60%

    gmt begin map png,pdf
    gmt basemap -R0/10/0/6 -JX10c/6c -Bafg1 -BWSen
    gmt text -F+f16p,1,red+a30 << EOF
    5 1 GMT TEXT1
    5 3 GMT TEXT2
    5 5 GMT TEXT3
    EOF
    gmt end show

文本框
------

對於每個文本字符串，我們還可以爲其加上文本框。

- **-W** 選項控制文本框的畫筆屬性
- **-G** 選項控制文本框的填充色
- **-C** 選項控制文字與文本框之間的空白

.. gmtplot::
    :width: 60%

    gmt begin map png,pdf
    gmt basemap -R0/10/0/6 -JX10c/6c -Bafg1 -BWSen
    gmt text -F+f16p,1,red+a30 -W1p -Glightblue -C25%/25% << EOF
    5 1 GMT TEXT1
    5 3 GMT TEXT2
    5 5 GMT TEXT3
    EOF
    gmt end show

對齊方式
--------

對於任意一個文本，我們還可以設置其對齊方式與偏移量。GMT中文本的默認對齊方式
爲居中對齊，即將整個文本的中心放在指定的X和Y座標處。當然，用戶也可以自行指定
文本的對齊方式。

文本的對齊方式由水平對齊方式和垂直對齊方式共同決定。水平對齊方式有三種：
左對齊（\ **L**\ eft）、居中對齊（\ **C**\ enter）和右對齊（\ **R**\ ight）。
垂直對齊方式有三種：頂部對齊（\ **T**\ op）、居中對齊（\ **M**\ iddle）和
底部對齊（\ **B**\ ottom）。三種水平對齊方式和三種垂直對齊方式，構成了文本的9種
對齊方式。

**-F+j** 用於指定文本對齊方式。下面的示例中，\ **-F+jTL** 表示文本對齊方式
爲 **TL**\ （Top + Left），即表示以左上角方式對齊。從下圖中可以看到，三個
文本框的左上角被放在了(5,1)、(5,3)和(5,5) 處。

.. gmtplot::
    :width: 60%

    gmt begin map png,pdf
    gmt basemap -R0/10/0/6 -JX10c/6c -Bafg1 -BWSen
    gmt text -F+f16p,1,red+jTL -W1p << EOF
    5 1 GMT TEXT1
    5 3 GMT TEXT2
    5 5 GMT TEXT3
    EOF
    gmt end show

文本偏移量
----------

使用 **-D** 選項還可以對文本設置額外的偏移量。下面的示例中，
**-D0.5c/0.5c** 分別設置了文本在X方向和Y方向的偏移量。

.. gmtplot::
    :width: 60%

    gmt begin map png,pdf
    gmt basemap -R0/10/0/6 -JX10c/6c -Bafg1 -BWSen
    gmt text -F+f16p,1,red+jTL -D0.5c/0.5c -W1p << EOF
    5 1 GMT TEXT1
    5 3 GMT TEXT2
    5 5 GMT TEXT3
    EOF
    gmt end show

變化的文字屬性
--------------

如果想要不同的文字有不同的文本屬性，可以多次調用 **text** 模塊，每次設置不同的
文本屬性。當然，還有更加靈活的辦法，可以一個命令中實現變化的文字屬性。

下面的例子中，使用了 **-F+f+a+j** 選項。上面已經介紹到，\ **+f** 設置文本屬性，
**+a** 設置文本旋轉角度，\ **+j** 設置文本對齊方式。但我們並沒有指定具體的屬性
值，因而需要在輸入數據中增加額外的數據列。輸入數據的格式由 **+f**\ 、\ **+a**\ 和
**+j** 的順序決定，因而此時輸入數據的格式爲::

    X   Y   font    angle   justification   text

下面的示例中，第三列爲字體屬性，第四列爲文本旋轉角度，第五列爲文本對齊方式。

.. gmtplot::
    :width: 60%

    gmt begin map png,pdf
    gmt basemap -R0/10/0/6 -JX10c/6c -Bafg1 -BWSen
    gmt text -F+f+a+j -W1p -Glightblue << EOF
    5 1 12p,0,red       0   TL GMT TEXT1
    5 3 15p,1,blue      30  MC GMT TEXT2
    5 5 18p,2,yellow    180 TL GMT TEXT3
    EOF
    gmt end show
