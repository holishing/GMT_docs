GMT/Matlab Toolbox
==================

簡介
----

GMT的Matlab接口，顧名思義，提供了在Matlab中調用GMT命令的功能。通過該接口，
GMT的所有模塊命令都可以在Matlab腳本中嵌入執行。GMT命令生成的結果
（grid格網數據、table表格數據、CPT顏色表、文本文件、圖片等）
都可以作爲Matlab變量進行運算；Matlab中的矩陣變量也可以直接作爲GMT的輸入。

GMT/MATLAB工具包用戶請引用如下文章:

Wessel, P., and J. F. Luis
The GMT/MATLAB Toolbox,
*Geochem. Geophys. Geosyst.*, **18(2)**, 811-823, 2017.
`doi:10.1002/2016GC006723 <http://dx.doi.org/10.1002/2016GC006723>`_.

安裝
----

Windows平臺
+++++++++++

GMT5.3以後的用戶在GMT執行路徑（默認爲 ``C:\programs\gmt5\bin`` ）下已經存在 ``gmt.m``
和 ``gmtmex.mexw64|32`` 兩個文件，只要確保如下兩點即可在Windows下使用該接口了。

- GMT的執行路徑已經加入了系統環境變量path中，保證系統可調用GMT命令；
- GMT的執行路徑已經加入Matlab的搜索路徑下，保證Matlab可調用GMT命令，如下圖所示。

.. figure:: /images/Matlab_path.png
   :width: 100%
   :align: center

   Matlab PATH 設置

測試安裝是否正確：在Matlab的命令行窗口直接敲入 ``gmt``，若出現GMT的版本及
使用方法介紹，則安裝成功。

macOS 平臺
++++++++++

在macOS上按照如下流程可以成功編譯GMT的Matlab接口。但由於Matlab處理動態鏈接庫的
方式很特別，因而該接口可能不太穩定。GMT開發者正試圖與MathWorks合作以解決這個問題，
將來以下編譯方法可能會修改：

#. 安裝macOS平臺下最新版本的GMT；
#. 運行安裝目錄下 ``share/tools`` 下的 ``gmt_prepmex.sh`` 文件。
   此操作會複製GMT的已安裝文件到 ``/opt/gmt`` 目錄下，並且會重新檢查所有的共享庫；
#. 使用 ``gmtswitch`` 切換當前使用的GMT版本，確保 ``/opt/gmt`` 下的GMT爲當前激活版本；
#. 使用svn獲取 ``gmt-mex`` 項目文件到本地::

    svn checkout svn://gmtserver.soest.hawaii.edu/gmt-mex gmt-mex

#. 進入 ``get-mex`` 目錄並編譯生成 ``gmtmex.mexmaci64`` ::

    cd gmt-mex/trunk/
    autoconf
    ./configure --enable-matlab
    make

#. 將 ``gmt.m`` 和 ``gmtmex.mexmaci64`` 所在目錄添加到MTATLAB路徑中
#. 確保 ``gmt.conf`` 文件中包含選項： ``GMT_CUSTOM_LIBS=/opt/gmt/lib/gmt/plugins/supplements.so``

經測試，該項目在2015a、2015b的MATLAB版本中可使用，對於更老版本的MATLAB，還未進行測試。

Unix/Linux平臺
++++++++++++++

正在努力開發中，還望有志之士加入...

使用方法
--------

GMT接口完全模仿了傳統的matlab命令，可以在命令行、m文件或IDE中使用。形式是::

    返回參數 = gmt('<module> <module-options>', 輸入數據)

其中 **輸入數據** 可以爲Matlab的矩陣、結構體或數組等； **返回參數**
可直接在Matlab中參與後續的計算。調用GMT完畢後，清空緩存::

    gmt('destroy')

入門級示例
++++++++++

在matlab環境中調用 ``pscoast`` 繪製地圖::

    gmt('pscoast -Rg -JA280/30/3.5i -Bg -Dc -A1000 -Gnavy -P > GMT_lambert_az_hemi.ps')

上例中，並不存在輸入數據，也就是不存在與Matlab變量的交互，生成的ps文件在Matlab當前路徑下。

進階級示例
++++++++++

在Matlab環境中，繪製文字::

    %創建字符串數組
    lines = {'5 6 Some label', '6 7 Another label'};
    % 繪製
    gmt('pstext -R0/10/0/10 -JX6i -Bafg -F+f18p -P > text.ps ', lines);
    gmt('destroy');

上例中，字符串數組 ``lines`` 可以直接作爲 ``pstext`` 的輸入參數。

以上爲單個輸入參數，若需要多個輸入參數，如何確定參數的先後順序？

高手級示例
++++++++++

對一個矩陣數組進行格網化並繪圖：

.. code-block:: matlab

    % 創建一個100*3矩陣，xyz值均爲0~150之間的隨機數
    t= rand(100,3)*150
    % 利用GMT的surface命令對t進行格網化，輸出爲結構體G，數組結構見附錄
    G = gmt('surface -R0/150/0/150 -I1', t );
    % 利用grd2cpt創建顏色表文件，輸出爲顏色表結構體cpt
    cpt = gmt('grd2cpt -Cjet', G);
    % 利用grdimage繪製格網化結果
    gmt('grdimage -JX8c -Ba -P -C -G > crap_img.ps', G, cpt);
    gmt('destroy');

上例中，\ ``grdimage`` 命令需要兩個輸入參數：顏色表 ``cpt`` 和格網數據 ``G``\ ，
兩者先後順序不可交換。強制性輸入參數（本例中的 ``G`` ）要在所有可選參數
（本例中的 ``cpt`` ）之前。若有多個選項參數，強制性輸入參數寫在最前，
然後按順序給出可選參數。

大神級示例
++++++++++

另一個多參數的例子：

.. code-block:: matlab

    x = linspace(-pi, pi)';            % 創建x值
    seno = sin(x);                     % 創建y值
    xyz  = [x seno seno];              % 創建xyz三列數據，其中y=z
    cpt  = gmt('makecpt -T-1/1/0.1');  % 創建rainbow顏色表
    %繪製函數曲線，以z值賦顏色。cpt和xyz先後順序不可交換。
    gmt('psxy -R-3.2/3.2/-1.1/1.1 -JX12c -Sc0.1c -C -P -Ba > seno.ps', xyz, cpt);
    gmt('destroy');

敲黑板，上例 ``psxy`` 一句中，``-C`` 爲可選參數，因此引號外 ``cpt`` 要在強制性
輸入數據 ``xyz`` 之後。

常見問題
--------

- 使用完GMT接口後要記得 ``gmt('destroy')`` 釋放內存，不然有可能出現不可預知錯誤。
- gmt括號內直接寫module名，看似GMT4語句，實際只支持GMT5的語法。
- 繪製地理投影時，經緯度標註可能會出現 ``%s`` 亂碼（即使設置爲不顯示任何度分秒符號），
  目前已知Matlab2016存在該問題，其他版本還未有此類反饋。
