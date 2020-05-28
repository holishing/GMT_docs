環境變量
========

**GMT_SHAREDIR**
    指定GMT的share目錄的位置。若該變量爲空，則GMT會使用默認值 ``${GMTHOME}/share`` 。

**GMT_DATADIR**
    用於指定用戶自己的數據文件的放置目錄。當在命令中給定文件名時，GMT首先會在當前
    目錄尋找該文件。若找不到，則會到環境變量 ``$GMT_DATADIR`` 所指定的目錄中尋找。

    對於一些常用的數據文件，可以放在特定的目錄中，並將任意一個環境變量指向該目錄，
    則在命令中使用該文件時只需要指定文件名而不必給出完整路徑。多個目錄之間用逗號
    分隔。

    Linux和macOS下以 ``/`` 結尾的目錄會被遞歸搜索，而Windows暫不支持這一功能。

**GMT_USERDIR**
    用於指定用戶自定義的配置文件的放置目錄。比如 ``gmt.conf`` 、自定義的符號、CPT、
    數學宏、網格檔自定義後綴 ``gmt.io`` 等。

    若 **GMT_USERDIR** 未定義，則使用默認值 ``${HOME}/.gmt``\ 。

**GMT_TMPDIR**
    GMT寫臨時文件 ``gmt.history`` 和 ``gmt.conf`` 的路徑。若未指定，則默認寫到當前目錄。

**GMT_CACHEDIR**
    用戶緩存GMT從其服務器上下載的數據。若未指定，則默認下載到 ``${HOME}/.gmt/cache`` 下。
    可以使用 ``gmt clear cache`` 清空緩存目錄。
