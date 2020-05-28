-Jx：笛卡爾變換
===============

GMT中笛卡爾座標變換分爲三類：

- 線性座標
- log\ :math:`_{10}` 座標
- 指數座標

在開始之前，先用 :doc:`gmt:gmtmath` 生成兩個數據以供接下來示例使用::

    gmt math -T0/100/1  T SQRT = sqrt.txt
    gmt math -T0/100/10 T SQRT = sqrt10.txt

笛卡爾線性座標
--------------

笛卡爾線性座標可以通過四種方式指定：

- **-Jx**\ *scale* X軸和Y軸擁有相同的比例尺 *scale*
- **-JX**\ *width* X軸和Y軸擁有相同的長度 *width*
- **-Jx**\ *xscale*/*yscale* 分別爲X軸和Y軸指定不同的比例尺
- **-JX**\ *width*/*height* 分別爲X軸和Y軸指定不同的長度

笛卡爾線性座標的使用場景可以分爲三類：

#. 常規的浮點數座標
#. 地理座標
#. 日期時間座標

常規浮點數座標
~~~~~~~~~~~~~~

對於常規的浮點型數據而言，選擇笛卡爾線性座標意味着對輸入座標做簡單的線性變換
:math:`u' = a u + b`\ ，即將輸入座標 :math:`u` 投影到紙張座標 :math:`u'`\ 。

下面的命令將函數 :math:`y=\sqrt{x}` 用笛卡爾線性變換畫在圖上。

.. gmtplot::
    :caption: 笛卡爾座標的線性變換
    :width: 60%

    gmt begin GMT_linear pdf,png
    gmt plot -R0/100/0/10 -JX3i/1.5i -Bag -BWSne+gsnow -Wthick,blue,- sqrt.txt
    gmt plot -St0.1i -N -Gred -Wfaint sqrt10.txt
    gmt end

說明：

- 正常情況下，X軸向右遞增，Y軸向上遞增。有些時候可能需要X軸向左遞增或者Y軸向下
  遞增（比如Y軸是深度時），只要將軸的比例尺或者軸長度設置爲負值即可。
- 若指定X軸的長度，並設置Y軸的長度爲0，則會根據X軸的長度和範圍計算出X軸的比例尺，
  並對Y軸使用相同的比例尺，進而計算出Y軸的長度，即 **-JX10c/0c**\ ，\ **-JX0c/10c** 同理。

地理座標
~~~~~~~~

理論上地理座標應該用地理投影畫，而不應該用線性投影，但是有時候可能的確需要使用
線性投影。用線性投影繪製地理座標時會碰到一個問題，即經度有一個360度的週期性。
因而在使用線性投影時需要通知GMT數據實際上是地理座標。有三種辦法：

#. 在 **-R** 後、數據範圍前加上 **g** 或 **d**\ ，比如 **-Rg-55/305/-90/90**
#. 在 **-Jx** 或 **-JX** 選項的最後加上 **g** 或 **d**\ ，比如 **-JX10c/6cd**
#. 使用 **-fg** 選項

下面的例子用線性投影繪製了一箇中心位於125°E的世界地圖。

.. gmtplot::
    :caption: 地理座標的線性變換
    :width: 60%

    gmt begin GMT_linear_d pdf,png
    gmt set MAP_GRID_CROSS_SIZE_PRIMARY 0.1i MAP_FRAME_TYPE FANCY FORMAT_GEO_MAP ddd:mm:ssF
    gmt coast -Rg-55/305/-90/90 -Jx0.014i -Bagf -BWSen -Dc -A1000 -Glightbrown -Wthinnest -Slightblue
    gmt end

日期時間座標
~~~~~~~~~~~~

時間日期座標也可以用線性投影繪製，此時需要告訴GMT輸入座標是絕對時間還是相對時間。

可以通過在 **-Jx** 或 **-JX** 的最後加上 **T** 或 **t**\ ，不過實際上 **-R**
選項中已經指定了時間範圍，所以沒有必要在 **-J** 和 **-R** 選項中都指定。
當 **-R** 和 **-J** 選項給出的座標類型相沖突時，GMT會給出警告，並以 **-JX** 選項爲準。

.. gmtplot::
    :caption: 日期時間座標的線性變換
    :width: 60%

    gmt begin GMT_linear_cal pdf,png
    gmt set FORMAT_DATE_MAP o TIME_WEEK_START Sunday FORMAT_CLOCK_MAP=-hham FORMAT_TIME_PRIMARY_MAP full
    gmt basemap -R2001-9-24T/2001-9-29T/T07:0/T15:0 -JX4i/-2i -Bxa1Kf1kg1d -Bya1Hg1h -BWsNe+glightyellow
    gmt end

笛卡爾對數投影
--------------

對數變換 :math:`\log_{10}` 的數學表示是 :math:`u' = a \log_{10}(u) + b` ，
可以通過在比例尺或軸長度後加上 **l** 指定。

下面的命令繪製了一個X軸爲對數軸Y軸爲線性軸的圖。

.. gmtplot::
    :caption: 對數投影
    :width: 60%

    gmt begin GMT_log pdf,png
    gmt plot -R1/100/0/10 -Jx1.5il/0.15i -Bx2g3 -Bya2f1g2 -BWSne+gbisque -Wthick,blue,- -h sqrt.txt
    gmt plot -Ss0.1i -N -Gred -W -h sqrt10.txt
    gmt end

注意：若想要X軸和Y軸都使用對數投影，且X軸和Y軸比例尺不同，則必須在指定每個軸的
比例尺時分別加上 **l**\ ，例如 **-JX10cl/6cl**\ 。

笛卡爾指數投影
--------------

指數投影的函數表示是 :math:`u' = a u^b + c` ，使得用戶可以繪製類似
:math:`x^p` - :math:`y^q` 這樣的函數關係。如果選 p=0.5、q=1
則相對於繪製 **x** 與 :math:`\sqrt{x}` 的函數曲線。

要使用指數投影，需要在比例尺或軸長度後加上 **p**\ *exp*\ ，其中 *exp* 是要使用的指數。

.. gmtplot::
    :caption: 指數變換
    :width: 60%

    gmt begin GMT_pow pdf,png
    gmt plot -R0/100/0/10 -Jx0.3ip0.5/0.15i -Bxa1p -Bya2f1 -BWSne+givory -Wthick sqrt.txt
    gmt plot -Sc0.075i -Ggreen -W sqrt10.txt
    gmt end
