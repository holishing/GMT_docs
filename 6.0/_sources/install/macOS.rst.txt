macOS 下安裝 GMT
================

macOS 下可以直接使用 GMT 提供的安裝包，也可以使用 Homebrew 或 Macports 軟體管理
工具進行安裝。\ **推薦使用Homebrew**\ 。

使用 Homebrew 安裝
------------------

`Homebrew <https://brew.sh/>`__ 是 macOS 下的第三方軟體包管理工具。
未安裝 Homebrew 的用戶，可以訪問其 `官網 <https://brew.sh/index_zh-cn>`_
以瞭解如何安裝與使用。

1.  安裝 GMT::

       $ brew update && brew upgrade
       $ brew install gmt

    也可以使用如下命令安裝GMT的最新開發版（即源碼的master分支）::

       $ brew install gmt --HEAD

2.  安裝GMT依賴的其它軟體::

       # 必須軟體包
       $ brew install ghostscript

       # 安裝生成動畫所需要的軟體包（可選）
       $ brew install graphicsmagick ffmpeg

3.  重新打開一個終端，檢測安裝是否成功::

       $ gmt --version
       6.0.0

4.  升級GMT。當有新版本發佈時，可以執行如下命令升級GMT::

        brew upgrade gmt

5.  如果需要卸載GMT，可以執行如下命令::

        brew uninstall gmt

使用 GMT 安裝包
---------------

GMT 爲 macOS 用戶提供了 dmg 安裝包，其不僅包含了GMT，還包含了運行GMT所需的
Ghostscript、GDAL、GraphicsMagick和FFmpeg，可以直接雙擊安裝使用。

.. note::

    GMT的dmg安裝包只支持 macOS >= 10.12。

1. 下載：\ `gmt-6.0.0-darwin-x86_64.dmg <http://mirrors.ustc.edu.cn/gmt/bin/gmt-6.0.0-darwin-x86_64.dmg>`_

2. 雙擊 dmg 包，在彈出的Finder窗口中，將 **GMT-6.0.0.app** 拖動到 Applications 目錄

3. 在Finder中的Applications目錄下，找到GMT圖標以雙擊啓動。
   GMT會啓動一個終端並顯示歡迎信息。根據歡迎信息中的
   提示將如下語句添加到 :file:`~/.bash_profile` 中以修改PATH環境變量::

       export GMTHOME=/Applications/GMT-6.0.0.app/Contents/Resources
       export PATH=${GMTHOME}/bin:${PATH}
       export PROJ_LIB=$GMTHOME/share/proj6
       export MAGICK_CONFIGURE_PATH=$GMTHOME/lib/GraphicsMagick-1.3.33/config

   .. note::

      以上內容僅供參考，請務必根據GMT歡迎信息中的提示修改環境變量。

4. 打開一個終端，輸入如下命令，檢測安裝是否成功::

       $ gmt --version
       6.0.0

5.  卸載GMT

    若想要卸載GMT，可直接到 **/Applications** 目錄下找到 GMT，直接刪除即可。

6.  升級GMT

    GMT包不支持自動升級，因而要先刪除舊GMT包，再下載新版安裝包並按照上面的
    步驟重新安裝，即實現升級GMT。

使用 Macports 安裝
------------------

`Macports <https://www.macports.org/>`_ 是 macOS 下的第三方軟體包管理工具。

1.  安裝GMT::

        $ sudo port install gdal +hdf5 +netcdf +openjpeg
        $ sudo port install gmt6

2.  安裝GMT依賴的其他軟體::

        $ sudo port install graphicsmagick ffmpeg

3.  重新打開一個終端，檢測安裝是否成功::

        $ gmt --version
        6.0.0

4.  升級GMT。當有新版本發佈時，可以執行如下命令升級GMT::

        $ sudo port selfupdate
        $ sudo port upgrade gmt6

5.  如果需要卸載GMT，可以執行如下命令::

        $ sudo port uninstall gmt6

使用 Fink 安裝
--------------

`Fink <http://www.finkproject.org/>`_ 是 macOS 下的第三方軟體包管理工具。

1.  安裝GMT::

        sudo fink install gmt6

2.  安裝依賴包::

        sudo fink install graphicsmagick ffmpeg
