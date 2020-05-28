GSHHG: 全球高分辨率海岸線數據
=============================

.. figure:: /images/gshhg.*
   :width: 75%
   :align: center

   GSHHG: 全球高分辨率海岸線數據

**GSHHG數據主頁**\ ： http://www.soest.hawaii.edu/wessel/gshhg/

GSHHG，全稱爲 A Global Self-consistent, Hierarchical, High-resolution Geography Database。
GMT提供的GSHHG數據中包含了海岸線、河流和國界等數據。

.. warning::

    GSHHG提供的中國國界數據不符合中國的領土主張，在正式刊物中發表使用此類國界
    數據的圖件時都可能存在問題。

GMT的 :doc:`/module/coast` 模塊可以直接繪製GSHHG中的數據，也可以使用
:doc:`/module/coast` 的 **-M** 選項將數據導出爲純文本文件供其它程序使用。
這一節將利用 :doc:`/module/coast` 模塊介紹GSHHG數據。
關於 :doc:`/module/coast` 模塊的詳細用法，見 :doc:`/module/coast` 模塊的說明文檔。

數據分辨率
----------

GSHHG提供了五種不同分辨率的數據，以滿足不同的需求。五種分辨率從高到低分別爲：

**f**\ ull > **h**\ igh > **i**\ ntermediate > **l**\ ow > **c**\ rude

:doc:`/module/coast` 模塊的 **-D** 選項加上每種分辨率的單詞首字母即可指定使用何種分辨率的數據。
在繪製全球地圖時，可以用 **-Dc** 指定使用最低分辨率的數據，以避免繪製了大量細節而導致
繪圖速度慢且文件太大；
在繪製幾度範圍的小區域地圖時，則可以使用 **-Df** 指定使用最高分辨率的數據。
GMT現代模式下，默認使用 **-Da** 選項，\ **a** 表示 **a**\ uto，
即GMT會根據當前繪圖區域的大小自動選擇合適的數據分辨率。

下面的示例繪製了一個小區域的海岸線邊界，可以看到 **-D** 取不同分辨率時邊界
精細程度的差異:

.. gmtplot::
    :show-code: false

    gmt begin map png,pdf
    gmt set MAP_TITLE_OFFSET -15p FONT_TITLE 15p,Courier-Bold
    gmt subplot begin 1x5 -Fs4c -JM4c -R-158.3/-157.6/21.2/21.8 -B+n -M0
    gmt coast -B+t"-Df" -W1p -Df -c
    gmt coast -B+t"-Dh" -W1p -Dh -c
    gmt coast -B+t"-Di" -W1p -Di -c
    gmt coast -B+t"-Dl" -W1p -Dl -c
    gmt coast -B+t"-Dc" -W1p -Dc -c
    gmt subplot end
    gmt end

數據內容
--------

GSHHG數據中包含了海岸線數據、河流數據和國界數據。

海岸線
~~~~~~

海岸線數據可以進一步細分爲4個不同的等級：

- 1: 陸地和海洋的分界線，即真正意義上的海岸線
- 2: 陸地與湖泊的分界線
- 3: 湖泊中的島嶼與湖泊的分界線
- 4: 湖泊中的島嶼裏的池塘與島嶼的分界線

:doc:`/module/coast` 模塊中有如下幾個與海岸線相關的選項：

- **-W**\ [*level*/]\ *pen* 繪製不同等級的海岸線
- **-G**\ *fill* 設置陸地、島嶼等陸區的填充色
- **-S**\ *fill* 設置海洋、湖泊等水區的填充色
- **-Cl**/*fill* 設置湖泊的填充色
- **-Cr**/*fill* 設置河流湖的填充色

河流
~~~~

河流進一步可以細分爲10個等級：

- 0: Double-lined rivers (river-lakes).
- 1: Permanent major rivers.
- 2: Additional major rivers.
- 3: Additional rivers.
- 4: Minor rivers.
- 5: Intermittent rivers - major.
- 6: Intermittent rivers - additional.
- 7: Intermittent rivers - minor.
- 8: Major canals.
- 9: Minor canals.
- 10: Irrigation canals.

:doc:`/module/coast` 模塊的 **-I** 選項可以用於繪製不同等級的河流，其基本語法
爲 **-I**\ *level*/*pen*\ 。其中 *level* 除了可以取1至10之外，還可以取：

- **a**: 所有河流和運河，即包含0-10等級的所有河流
- **A**: 除了河流湖之外的所有河流和運河，即包含1-10等級的河流
- **r**: 所有永久河流，即0-4等級
- **R**: 除了河流湖之外的永久河流，即1-4等級
- **i**: 所有間歇性河流，即5-7等級
- **c**: 所有運河，即8-10等級

該選項可以重複多次使用，爲不同等級的河流設置不同的畫筆屬性。

國界線
~~~~~~

國界線進一步細分爲三個等級

- 1: 國界
- 2: 美國州界
- 3: 海洋邊界

:doc:`/module/coast` 模塊的 **-N** 選項可以用於繪製不同等級的國界線，其基本
語法爲 **-N**\ *level*/*pen*\ 。其中 *level* 可以取1至3，也可以
取 **a** \（表示所有邊界）。該選項可以重複多次使用，
爲不同等級的國界設置不同的畫筆屬性。

使用示例
--------

繪製1級海岸線：

.. gmtplot::
   :width: 75%

   gmt coast -R-130/-70/24/52 -JL-100/35/33/45/15c -Ba -A1000 -W1/0.5p -png map

同時繪製1-3級海岸線，黑色的爲1級海岸線，紅色的爲2級湖泊線（圖中的大面積紅色區域爲五大湖），
藍色的爲3級島嶼線（即五大湖內部的島嶼）：

.. gmtplot::
   :width: 75%

   gmt coast -R-130/-70/24/52 -JL-100/35/33/45/15c -Ba -A1000 -W1/0.5p -W2/0.3p,red -W3/0.2p,blue -png map

繪製1-3級海岸線，併爲陸地、還有、湖泊填充不同的顏色：

.. gmtplot::
   :width: 75%

   gmt coast -R-130/-70/24/52 -JL-100/35/33/45/15c -Ba -A1000 -W1/0.5p -W2/0.3p,red -W3/0.2p,blue \
        -Gtan -Slightblue -Cl/royalblue -png map

繪製海岸線、國界和美國州界：

.. gmtplot::

    gmt coast -R-130/-70/24/52 -JL-100/35/33/45/15c -Ba -Dh -A1000 -W1/0.5p -N1/thick,red -N2/thinner \
        -Gtan -Slightblue -Cl/royalblue -png map

