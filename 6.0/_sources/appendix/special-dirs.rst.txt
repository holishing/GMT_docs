目錄參數
========

有一些環境變量以及GMT配置參數，可以用於指定某些特殊用途的目錄。這些環境變量和
配置參數包括：

- ``$GMT_SHAREDIR`` GMT的share目錄所在位置，通常不用設置，GMT會自動猜測其所在位置
- ``$GMT_DATADIR`` 或 :term:`DIR_DATA` 可以指向一個或多個目錄，用於放置
  用戶常用的數據文件。目錄之間用逗號分隔。任何以斜槓 ``/`` 結尾的目錄會被遞歸搜索
  （Windows不支持此功能）。若二者同時有值，以 :term:`DIR_DATA`
  的值優先
- ``$GMT_CACHEDIR`` 或 :term:`DIR_CACHE` 用於放置GMT模塊從GMT服務器上
  下載的臨時數據
- ``$GMT_USERDIR`` 用戶放置自定義配置文件的地方，比如用戶自定義的 :file:`gmt.conf`
  文件、自定義符號、CPT文件、數學宏、網格檔後綴文件等。若該變量未定義，則默認值爲
  :file:`${HOME}/.gmt` 。
- ``$GMT_TMPDIR`` 臨時文件（比如 :file:`gmt.history` 和 :file:`gmt.conf` ）放置的
  目錄。若未設置，則默認爲當前目錄
- :term:`DIR_DCW` DCW數據放置的目錄
- :term:`DIR_GSHHG` 海岸線數據放置的目錄

當命令行中有文件需要讀入時，GMT不僅僅會在當前目錄下尋找文件，還會到這些特殊
變量中尋找。GMT會\ **依次**\ 到下列目錄中尋找文件：

#. 當前目錄
#. GMT參數 :term:`DIR_DATA` 所定義的目錄
#. GMT參數 :term:`DIR_CACHE` 所定義的目錄
#. 環境變量 ``$GMT_USERDIR`` 所定義的目錄
#. 環境變量 ``$GMT_CACHEDIR`` 所定義的目錄
#. 環境變量 ``$GMT_DATADIR`` 所定義的目錄
