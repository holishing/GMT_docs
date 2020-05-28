.. index:: ! grdlandmask
.. include:: common_SYN_OPTs.rst_

grdlandmask
===========

:官方文檔: :doc:`gmt:grdlandmask`
:簡介: 根據海岸線數據創建陸地-海洋的mask網格文件

**grdlandmask** 模塊讀取指定的海岸線數據，用於確定網格內的每個節點是位於陸地還是
水域，並給不同類型的節點賦予不同的值，以生成掩膜文件。生成的掩膜文件可進一步
用在 :doc:`grdmath` 中以掩蓋掉位於陸地或水域中的數據點。

語法
----

**gmt grdlandmask**
|-G|\ *mask_grd_file*
|SYN_OPT-I|
|SYN_OPT-R|
[ |SYN_OPT-Area| ]
[ |-D|\ *resolution*\ [**+f**] ]
[ |-E|\ [*bordervalues*] ]
[ |-N|\ *maskvalues* ]
[ |-V|\ [*level*] ] [ |SYN_OPT-r| ]
[ |SYN_OPT-x| ]
[ |SYN_OPT--| ]

必選選項
--------

.. _-G:

**-G**\ *mask_grd_file*
    生成的掩膜網格文件的文件名

.. include:: explain_-I.rst_

.. include:: explain_-R.rst_

可選選項
--------

.. include:: explain_-A.rst_

.. _-D:

**-D**\ *resolution*\ [**+f**]
    選擇海岸線數據精度。

    GMT自帶的GSHHG海岸線數據有5個不同精度的版本，從高到低依次爲：full、high、
    intermediate、low和crude。GMT默認使用低精度數據。該選項可以指定要使用的
    數據精度，其中 **f**\|\ **h**\|\ **i**\|\ **l**\|\ **c**
    分別代表5種不同的數據精度。也可以用 **-Da** 選項，此時GMT會根據當前繪圖區域的
    大小自動選擇合適的數據精度 [默認使用 **-Da**]

    默認情況下，若找不到指定精度的海岸線數據，程序會自動報錯退出。該選項中
    加上 **+f** 則命令在找不到當前指定的精度數據時，自動尋找更低精度的數據。
    選項海岸線數據的精度，見 :doc:`coast` 中的介紹。

.. _-E:

**-E**\ [*bordervalues*]
    恰好落在海岸線多邊形邊界上的數據的處理方式。

    默認情況下，恰好位於海岸線多邊形邊界上的節點當作是在多邊形的內部，使用該選項
    則會將其認爲是在多邊形的外部。

    此外，還可以在 **-E** 選項後加上四個值 *cborder/lborder/iborder/pborder* 或
    一個值 *bordervalue* （表示四個值具有相同的值），以啓用線段追蹤模式。
    在根據 **-N** 設置掩膜值之後，會進一步修改所有線段穿過的網格單元的值。
    例如，海岸線穿過的網格單元值將被修改爲 *cborder*\ ；同理，
    島邊界、湖內島、湖內島中的小湖邊界穿過的網格單元值會被依次修改爲
    *lborder*\ 、\ *iborder*\ 、\ *pborder* 的值。

.. _-N:

**-N**\ *maskvalues*
    設置網格節點的值。可以是數字，也可以是NaN。該選項可以取兩種格式：

    - **-N**\ *wet/dry* ：分別爲水域和陸地設置不同的值
    - **-N**\ *ocean/land/lake/island/pond* ：分別爲海洋、陸地、湖泊、島嶼、池塘設置不同的值

    默認值爲 **0/1/0/1/0** （即 **0/1**\ ），即將水域內的網格設置爲0，將陸地內的
    網格設置爲1。

.. include:: explain_-V.rst_

.. include:: explain_nodereg.rst_

.. include:: explain_core.rst_

.. include:: explain_help.rst_

注意事項
--------

**grdlandmask** 生成的掩膜網格文件屬於 **分類型** 數據，即所有數據只能取幾個固定的
值，比如 **-N0/1** 會將水域內的網格值設置爲0，將陸地內的網格值設置爲1。
在這種情況下，對這種數據用標準方法（比如樣條）進行插值通常會得到無意義的結果，
使用時需要小心。

然而，當你直接繪製該掩膜網格文件時，網格數據會被重新投影使得在投影后的座標下
變成一個矩形。這個過程中涉及到了網格插值，默認使用的插值算法是樣條插值，因而
可能會在圖中產生假象。因而建議在使用 :doc:`grdimage` 繪製此類數據時使用 **-nn**
選項即 nearest neighbor 插值算法以避免這一問題。

示例
----

將所有陸地上的節點設置爲NaN，水域上的節點設置爲1::

    gmt grdlandmask -R-60/-40/-40/-30 -Dh -I5m -N1/NaN -Gland_mask.nc -V

生成全球1x1度的網格，並將不同性質的區域設置成不同的值::

    gmt grdlandmask -R0/360/-90/90 -Dl -I1 -N0/1/2/3/4 -Glevels.nc -V

相關模塊
--------

:doc:`grdmath`,
:doc:`grdclip`,
:doc:`mask`,
:doc:`clip`,
:doc:`coast`
