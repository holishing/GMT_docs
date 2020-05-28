Linux/macOS 下編譯GMT源碼
=========================

這一節介紹如何在 Linux 或者 macOS 下編譯GMT源代碼。Windows用戶如果想編譯
GMT源碼請參考GMT官方
`編譯指南 <https://github.com/GenericMappingTools/gmt/blob/master/BUILDING.md>`_\ 。

編譯及運行依賴
--------------

GMT的編譯及運行需要如下軟件：

- CMake: >=2.8.7
- netCDF（>=4.0且支持netCDF-4/HDF5）
- curl

除此之外，還可以安裝如下軟件庫以增強GMT的更多功能：

- `Ghostscript <https://www.ghostscript.com/>`_: 生成PDF或者其他位圖格式的圖片
- `GDAL <https://www.gdal.org/>`_: 讀寫其它地學常用的網格和圖片格式
- `PCRE <https://www.pcre.org/>`_: 正則表達式支持
- `FFTW <http://www.fftw.org/>`_: 快速傅里葉變換庫（>=3.3，macOS下不需要）
- `GLib <https://developer.gnome.org/glib/>`_: GTHREAD多線程支持
- LAPACK: 快速矩陣反演庫 （macOS下不需要）
- BLAS：快速矩陣運算庫 （macOS下不需要）
- `GraphicsMagick <http://www.graphicsmagick.org>`_: 生成GIF格式的動畫
- `FFmpeg <http://www.ffmpeg.org/>`_: 生成MP4格式的動畫

安裝依賴軟件
------------

對於Ubuntu/Debian::

    # 安裝編譯所需軟件包
    $ sudo apt-get install build-essential cmake libcurl4-gnutls-dev libnetcdf-dev
    # 安裝可選軟件包
    $ sudo apt install ghostscript gdal-bin libgdal-dev libglib2.0-dev libpcre3-dev libfftw3-dev liblapack-dev
    # 安裝製作動畫所需的軟件包
    $ sudo apt install graphicsmagick ffmpeg

對於CentOS/RHEL::

    $ sudo yum install epel-release
    # 安裝編譯所需軟件包
    $ sudo yum install gcc cmake make glibc netcdf-devel libcurl-devel
    # 安裝可選軟件包
    $ sudo yum install ghostscript gdal gdal-devel lapack-devel openblas-devel glib2-devel pcre-devel fftw-devel
    # 安裝其他可選包
    $ sudo yum localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-`rpm -E %rhel`.noarch.rpm
    $ sudo yum install GraphicsMagick ffmpeg

對於Fedora用戶::

    # 安裝編譯所需軟件包
    $ sudo dnf install gcc cmake make glibc netcdf-devel libcurl-devel
    # 安裝可選軟件包
    $ sudo dnf install ghostscript gdal gdal-devel lapack-devel openblas-devel glib2-devel pcre-devel fftw-devel
    # 安裝其他可選包
    $ sudo dnf install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-`rpm -E %fedora`.noarch.rpm
    $ sudo dnf install GraphicsMagick ffmpeg

對於macOS用戶，建議使用 `Homebrew <https://brew.sh>`_ 安裝依賴::

    # 安裝必須依賴
    brew install cmake curl netcdf
    # 安裝可選依賴
    brew install ghostscript gdal pcre2 glib fftw graphicsmagick ffmpeg

.. warning::

   GMT需要使用 Ghostscript 生成PDF、JPG等格式的圖片。但Ghostscript 9.27存在
   嚴重bug，會導致生成的圖片中有用信息被裁剪。
   請使用 ``gs --version`` 確認安裝的Ghostscript不是9.27版本。

下載源碼及數據
--------------

編譯GMT需要下載如下三個文件：

#. GMT 6.0.0 源碼：`gmt-6.0.0-src.tar.gz <http://mirrors.ustc.edu.cn/gmt/gmt-6.0.0-src.tar.gz>`_
#. 全球海岸線數據GSHHG：`gshhg-gmt-2.3.7.tar.gz <http://mirrors.ustc.edu.cn/gmt/gshhg-gmt-2.3.7.tar.gz>`_
#. 全球數字圖表DCW：`dcw-gmt-1.1.4.tar.gz <http://mirrors.ustc.edu.cn/gmt/dcw-gmt-1.1.4.tar.gz>`_

安裝GMT
-------

將下載的三個壓縮文件放在同一個目錄裏，按照如下步驟進行安裝：

.. code-block:: bash

   # 解壓三個壓縮文件
   $ tar -xvf gmt-6.0.0.tar.gz
   $ tar -xvf gshhg-gmt-2.3.7.tar.gz
   $ tar -xvf dcw-gmt-1.1.4.tar.gz

   # 將gshhg和dcw數據複製到gmt的share目錄下
   $ mv gshhg-gmt-2.3.7 gmt-6.0.0/share/gshhg
   $ mv dcw-gmt-1.1.4 gmt-6.0.0/share/dcw-gmt

   # 切換到gmt源碼目錄下
   $ cd gmt-6.0.0

   # 用文本編輯器新建並打開CMake用戶配置文件
   # Linux用戶
   $ gedit cmake/ConfigUser.cmake
   # macOS用戶
   $ open -a TextEdit cmake/ConfigUser.cmake

向 :file:`cmake/ConfigUser.cmake` 文件中加入如下語句::

    set (CMAKE_INSTALL_PREFIX "/opt/GMT-6.0.0")
    set (COPY_GSHHG TRUE)
    set (COPY_DCW TRUE)

    set (GMT_USE_THREADS TRUE)
    set (GMT_ENABLE_OPENMP TRUE)

- **CMAKE_INSTALL_PREFIX** 用於設置GMT的安裝路徑，上面的語句會將GMT安裝在
  :file:`/opt/GMT-6.0.0` 目錄下，用戶可以自行修改爲其他路徑。沒有 root 權限的
  一般用戶，可以將安裝路徑設置爲 :file:`/home/xxx/software/GMT-6.0.0` 等有可讀寫
  權限的路徑；
- **COPY_GSHHG** 和 **COPY_DCW** 設置爲 **TRUE** 會將相關數據複製到 GMT 的 share 目錄下
- **GMT_USE_THREADS** 和 **GMT_ENABLE_OPENMP** 設置爲 **TRUE** 會爲GMT的某些模塊
  增加多線程並行功能以加速計算，也可以不設置。

.. tip::

   此處爲了便於一般用戶理解，只向 :file:`cmake/ConfigUser.cmake` 中寫入了必要的語句。
   用戶可以將GMT提供的配置模板 :file:`cmake/ConfigUserTemplate.cmake` 複製爲
   :file:`cmake/ConfigUser.cmake`\ 並根據配置文件中的大量註釋說明信息自行修改配置文件。

繼續執行如下命令以檢查GMT的依賴是否滿足::

    # 注意，此處新建的 build 文件夾位於 gmt-6.0.0 目錄下，不是 gmt-6.0.0/cmake 目錄下
    $ mkdir build
    $ cd build/
    $ cmake ..

``cmake ..`` 會檢查系統軟件是否滿足GMT的依賴關係，過程中會輸出大量信息，並
在最後彙總輸出檢查結果。我們只需要關注檢查結果是否正確即可。
正常情況下結果結果如下，若存在一些差異也沒有問題。只要過程中不出現報錯，即可。
如果出現報錯，則需要檢查之前的步驟是否有誤，檢查完成後刪除原build目錄再新建build，
繼續執行 ``cmake ..``\ ，直到出現類似的檢查結果::

    *
    *  GMT Version:               : 6.0.0
    *
    *  Options:
    *  Found GSHHG database       : /home/user/GMT/gmt-6.0.0/share/gshhg (2.3.7)
    *  Found DCW-GMT database     : /home/user/GMT/gmt-6.0.0/share/dcw-gmt
    *  Found GMT data server      : https://oceania.generic-mapping-tools.org
    *  NetCDF library             : /usr/lib64/libnetcdf.so
    *  NetCDF include dir         : /usr/include
    *  GDAL library               : /usr/lib64/libgdal.so
    *  GDAL include dir           : /usr/include/gdal
    *  FFTW library               : /usr/lib64/libfftw3f.so
    *  FFTW include dir           : /usr/include
    *  Accelerate Framework       :
    *  Regex support              : PCRE (/usr/lib64/libpcre.so)
    *  ZLIB library               : /usr/lib64/libz.so
    *  ZLIB include dir           : /usr/include
    *  LAPACK library             : yes
    *  BLAS library               : yes
    *  License restriction        : no
    *  Triangulation method       : Shewchuk
    *  OpenMP support             : enabled
    *  GLIB GTHREAD support       : enabled
    *  Build mode                 : shared
    *  Build GMT core             : always [libgmt.so]
    *  Build PSL library          : always [libpostscriptlight.so]
    *  Build GMT supplements      : yes [supplements.so]
    *  Build GMT Developer        : yes
    *  Build proto supplements    : none
    *  Found Ghostscript (gs)     : yes (9.50)
    *  Found GraphicsMagick (gm)  : yes (1.3.33)
    *  Found ffmpeg               : yes (4.2.1)
    *  Found open                 : yes
    *  Found ogr2ogr              : yes (2.4.2)
    *  Found gdal_translate       : yes (2.4.2)
    *
    *  Locations:
    *  Installing GMT in          : /opt/GMT-6.0.0
    *  GMT_DATADIR                : /opt/GMT-6.0.0/share
    *  GMT_DOCDIR                 : /opt/GMT-6.0.0/share/doc
    *  GMT_MANDIR                 : /opt/GMT-6.0.0/share/man
    -- Configuring done
    -- Generating done

.. warning::

    Anaconda用戶請注意！由於Anaconda中也安裝了FFTW、GDAL、netCDF等庫文件，
    GMT在配置過程中通常會找到Anaconda提供的庫文件，進而導致配置、編譯或執行
    過程中出錯。

    解決辦法是，在 :file:`~/.bashrc` 中將 Anaconda 相關的環境變量註釋掉，以保證GMT
    在配置和編譯過程中找到的不是 Anaconda 提供的庫文件。待GMT安裝完成後，再
    將 Anaconda 相關環境變量改回即可。

檢查完畢後，開始編譯和安裝::

    $ make -j
    $ sudo make -j install

.. note::

   **-j** 選項可以實現並行編譯以減少編譯時間。但據用戶報告，某些Ubuntu發行版下
   使用 **-j** 選項會導致編譯過程卡死。若出現此種情況，建議去除 **-j** 選項。

修改環境變量
------------

打開終端，使用如下命令用文件編輯器打開Bash配置文件::

    # Linux 用戶
    gedit ~/.bashrc

    # macOS 用戶
    open ~/.bash_profile

然後向文件末尾加入如下語句以修改環境變量。修改完成後保存文件並退出，
然後重啓終端使其生效::

    export GMT6HOME=/opt/GMT-6.0.0
    export PATH=${GMT6HOME}/bin:$PATH
    export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${GMT6HOME}/lib64

說明：

- 第一個命令添加了環境變量 **GMT6HOME**
- 第二個命令修改 GMT6 的 bin 目錄加入到 **PATH** 中，使得終端可以找到GMT命令
- 第三個命令將 GMT6 的 lib 目錄加入到動態鏈接庫路徑中。
  通常，32位系統的路徑爲 **lib**\ ，64位系統的路徑爲 **lib64**

測試是否安裝成功
----------------

重新打開一個終端，鍵入如下命令，若正確顯示GMT版本號，則表示安裝成功::

    $ gmt --version
    6.0.0

升級/卸載GMT
------------

按照上面的配置，GMT會被安裝到 :file:`/opt/GMT-6.0.0` 目錄下。若想要卸載GMT，
可以直接刪除整個 :file:`/opt/GMT-6.0.0` 即可。

GMT不支持自動更新，因而若想要升級GMT，通常建議先卸載GMT，然後再下載新版源碼
並按照上面的步驟重新編譯安裝。

當然，高級用戶也可以同時安裝多個版本的GMT，但需要注意環境變量 **PATH** 的設置。
