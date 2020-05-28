錨點
====

錨 ⚓是船舶停泊時固定船隻使之不能漂走的工具。GMT中的錨點也具有類似的作用，用於
將某個元素固定在圖中的某個位置。這一節將介紹GMT中錨點的概念，具體的使用場景
及使用方法將在下一節介紹。

對於任意一個矩形元素，GMT爲其定義了9個錨點。每個錨點的位置用一個水平位置代碼和
一個垂直位置代碼組合定義得到。
水平位置代碼可以取 **L**\|\ **C**\|\ **R**\ ，分別表示左中右；
垂直位置代碼可以取 **T**\|\ **M**\|\ **B**\ ，分別表示上中下。
3個水平位置代碼與3個垂直位置代碼自由組合，得到9個錨點，每個錨點均對應矩形元素的
某個特定位置，如下圖中紅點和紅字所示。例如，錨點 **BL** 位於矩形元素的左下角，
而錨點 **MC** 則位於矩形元素的中心。

.. gmtplot::
    :show-code: false
    :width: 70%

    gmt begin anchor-1 png,pdf
    gmt set MAP_TICK_LENGTH_PRIMARY 20p MAP_TICK_PEN_PRIMARY 1p
    gmt basemap -R0/10/0/6 -JX10c/6c -BENlb -Bxf5 -Byf3
    gmt plot -Sc0.3c -Gred -N << EOF
    0 0
    0 3
    0 6
    5 0
    5 3
    5 6
    10 0
    10 3
    10 6
    EOF
    gmt text -F+f15p+j -Dj0.5c/0.5c -N << EOF
    10 6 ML @%1%T@%%op
    10 3 ML @%1%M@%%iddle
    10 0 ML @%1%B@%%ottom
    0  6 BC @%1%L@%%eft
    5  6 BC @%1%C@%%enter
    10 6 BC @%1%R@%%ight
    EOF
    gmt text -F+f15p,1,red+c+j -Dj0.5c/0.5c+v2p << EOF
    TL TL TL
    TC TC TC
    TR TR TR
    ML ML ML
    MC BL MC
    MR MR MR
    BL BL BL
    BC BC BC
    BR BR BR
    EOF
    gmt end

此處的矩形元素並不一定是一個真正的矩形，GMT中很多繪圖元素都可以抽象爲一個矩形元素。
例如常規的矩形底圖、非矩形的地理底圖、比例尺、色標、指南針、文本字符串等，
都可以抽象爲一個矩形元素。

例如，對於一個非矩形的地理底圖來說，其9個錨點的位置如下圖所示：

.. gmtplot::
    :show-code: false
    :width: 70%

    gmt begin anchor-2 png,pdf
    gmt basemap -Rg -JH10c -B0
    gmt text -F+f15p,1,red+c+j -Dj0.5c/0.5c+v2p -N << EOF
    TL TL TL
    TC TC TC
    TR TR TR
    ML ML ML
    MC BL MC
    MR MR MR
    BL BL BL
    BC BC BC
    BR BR BR
    EOF

    gmt plot -R0/10/0/6 -JX10c/5c -Sc0.3c -Gred -N << EOF
    0 0
    0 3
    0 6
    5 0
    5 3
    5 6
    10 0
    10 3
    10 6
    EOF
    gmt end

指南針、比例尺、圖例、色標、文本字符串等也可以抽象爲一個矩形，也有自己的錨點。
下圖展示了色標的9個錨點的位置：

.. gmtplot::
    :show-code: false
    :width: 70%

    gmt begin anchor-3 png,pdf
    gmt colorbar -D0c/0c+w10c/1.5c+h -B0 -Cpolar
    gmt basemap -R0/10/0/6 -JX10c/1.5c -B0
    gmt text -F+f15p,1,red+c+j -Dj0.5c/0.5c+v2p -N << EOF
    TL BR TL
    TC BC TC
    TR BL TR
    ML MR ML
    MC MR MC
    MR ML MR
    BL TR BL
    BC TC BC
    BR TL BR
    EOF

    gmt plot -Sc0.3c -Gred -N << EOF
    0 0
    0 3
    0 6
    5 0
    5 3
    5 6
    10 0
    10 3
    10 6
    EOF
    gmt end
