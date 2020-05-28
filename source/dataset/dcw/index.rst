DCW: 世界數字圖表
=================

.. figure:: /images/dcw.*
   :width: 75%
   :align: center

   DCW: 世界數字圖表

**DCW數據主頁**\ ： http://www.soest.hawaii.edu/wessel/dcw/

DCW，全稱爲 Digital Chart of the World，即世界數字圖表。
GMT提供的DCW數據是在原始DCW數據的基礎上修改得到的，其中包含了如下行政邊界數據：

#.  七大洲的洲界
#.  全球250個國家或地區的邊界
#.  8個大國的省界/州界

.. warning::

    DCW數據提供的中國國界數據不符合中國的領土主張，在正式刊物中發表使用此類國界
    數據的圖件時都可能存在問題。

GMT的 :doc:`/module/coast` 模塊可以直接繪製DCW數據中提供的行政邊界數據，
也可以使用 :doc:`/module/coast` 的 **-M** 選項將邊界數據導出爲純文本文件
供其它程序使用。

GMT提供的DCW數據默認位於GMT安裝目錄下的 **share/dcw** 下，其中主要包含了三個文件：

- :file:`dcw-gmt.nc`: netCDF格式的DCW數據
- :download:`dcw-countries.txt`: 輔助文件，內含國家代碼
- :download:`dcw-states.txt`: 輔助文件，內含省界代碼

區域代碼
--------

爲了繪製某個特定行政區域的邊界，首先需要知道這些行政區域的代碼。

洲代碼
++++++

七大洲都有各自的代碼，其代碼分別爲:

- **AF**: 非洲（Africa）
- **AN**: 南極洲（Antarctica）
- **AS**: 亞洲（Asia）
- **EU**: 歐洲（Europe）
- **OC**: 大洋洲（Oceania）
- **NA**: 北美洲（North America）
- **SA**: 南美洲（South America）

國家代碼
++++++++

每個國家都有一個國家代碼，國家代碼可以直接從 `ISO Country Codes <https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2>`_ 中查找。
也可以從DCW輔助文件 :download:`dcw-countries.txt` 中查找，其文件格式爲::

    洲代碼 國家代碼 國家名

也可以使用命令 ``gmt coast -E+l`` 查看國家代碼列表。

該文件共計約 250 個國家。文件內容大致如下::

    AS BH Bahrain
    AS BN Brunei
    AS BT Bhutan
    AS CN China
    AS CX Christmas Island
    AS GE Georgia
    AS HK Hong Kong
    AS HM Heard Island and McDonald Islands
    AS ID Indonesia
    AS IL Israel
    AS IN India

其中可以看到，中國的國家代碼爲 **CN**\ 。

省/州代碼
+++++++++

目前有如下八個國家的省界/州界數據：

- **AR**: 阿根廷
- **AU**: 澳大利亞
- **BR**: 巴西
- **CA**: 加拿大
- **US**: 美國
- **CN**: 中國
- **IN**: 印度
- **RU**: 俄羅斯

省代碼可以從 DCW 輔助文件 :download:`dcw-states.txt` 中查找到，其文件格式爲::

    國家代碼 省代碼 省名

也可以使用命令 ``gmt coast -E+L`` 查看省代碼。

以中國的數據爲例，其包括全部 34 個省級行政區域：23 個省（包括臺灣省），
5 個自治區，4 個直轄市，以及香港，澳門 2 個特別行政區。
中國的省代碼是數字，和中國居民身份證號碼相同::

    CN 11 Beijing
    CN 50 Chongqing
    CN 31 Shanghai
    CN 12 Tianjin
    CN 34 Anhui
    CN 35 Fujian
    CN 62 Gansu
    CN 44 Guangdong
    CN 52 Guizhou
    CN 46 Hainan
    CN 13 Hebei
    CN 23 Heilongjiang
    CN 41 Henan
    CN 42 Hubei
    CN 43 Hunan
    CN 32 Jiangsu
    CN 36 Jiangxi
    CN 22 Jilin
    CN 21 Liaoning
    CN 63 Qinghai
    CN 61 Shaanxi
    CN 37 Shandong
    CN 14 Shanxi
    CN 51 Sichuan
    CN 71 Taiwan
    CN 53 Yunnan
    CN 33 Zhejiang
    CN 45 Guangxi
    CN 15 Nei Mongol
    CN 64 Ningxia
    CN 65 Xinjiang
    CN 54 Xizang
    CN 91 Xianggang (Hong Kong)
    CN 92 Aomen (Macao)

使用說明
--------

GMT中至少有兩處會使用DCW數據：

#. :doc:`-R 選項 </option/R>` 中可以直接使用區域代碼以間接指定繪圖範圍
#. :doc:`/module/coast` 模塊 **-E**\ *code1*,\ *code2*,... 選項調用 DCW 數據繪製或導出國界/省界

洲代碼、國家代碼和省代碼都由兩個字符構成，爲了避免可能的衝突，GMT通過如下方式區分：

-   在洲代碼前加上 **=** 號表示某個大洲，比如 **=AS** 表示亞洲
-   國家代碼不需要做任何處理格式，比如 **GB** 表示英國
-   省代碼的格式爲 *country*.\ *state*\ ，即必須在省代碼前加上國家代碼纔可以，比如 **US.TX** 表示美國 Texas 州

使用示例
--------

繪製洲界
++++++++

繪製主要大洋洲國家的邊界：

.. gmtplot::
   :width: 60%

   gmt coast -R100/190/-50/10 -JM12c -Baf -E=OC+p0.25p,red -png dataset_dcw_01

繪製國界
++++++++

繪製澳大利亞邊界：

.. gmtplot::
   :width: 60%

   gmt coast -JM12c -Baf -EAU+p0.25p,red -png dataset_dcw_02

繪製省/洲界
+++++++++++

繪製澳大利亞昆士蘭州(Queensland)，並設置邊界顏色和填充顏色。其中 **-R** 選項後跟區域代碼 **AU.QLD** 可間接指定該區域範圍， **+R2** 表示在原有範圍外擴大2度:

.. gmtplot::
   :width: 60%

   gmt coast -RAU.QLD+R2 -JM12c -Baf -EAU.QLD+p1p,blue+gred -png dataset_dcw_03

導出省/洲界數據
+++++++++++++++

導出昆士蘭州的邊界數據::

    gmt coast -EAU.QLD -M > Queensland.dat

這裏只需要使用 **-M** 選項即可。

