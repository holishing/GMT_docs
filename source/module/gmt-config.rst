.. index:: ! gmt-config

gmt-config
==========

**gmt-config** 是GMT 的 bin 目錄下的一個 bash 腳本，主要用於返回 GMT
編譯安裝過程中的相關信息，以供其他開發者使用。

語法
----

**gmt-config** [ *options* ]

可選選項
--------

**--help**
    顯示此幫助信息並退出

**--all**
    顯示全部選項的值

**--bits**
    庫文件是32位還是64位

**--cc**
    編譯過程中使用的C編譯器

**--cflags**
    C預處理器和編譯器的CFLAGS，例如 ``-I/opt/GMT/include/gmt``

**--datadir**
    GMT 數據目錄，默認爲空

**--dataserver**
    GMT數據服務器網址

**--dcw**
    DCW 數據的位置（可能爲空）

**--dep-libs**
    GMT 函數庫依賴的其它函數庫

**--gshhg**
    GSHHG 數據的位置

**--has-fftw**
    編譯過程中是否鏈接了 FFTW

**--has-gdal**
    編譯過程中是否鏈接了 GDAL

**--has-pcre**
    編譯過程中是否鏈接了 PCRE

**--has-lapack**
    編譯過程中是否鏈接了 LAPACK

**--has-openmp**
    編譯過程中是否開啓了 OpenMP 支持

**--includedir**
    include 目錄所在位置

**--libdir**
    library 目錄所在位置

**--libs**
    鏈接GMT函數庫所需的信息，例如 ``-L/opt/GMT/lib64 -lgmt``

**--plugindir**
    GMT 插件目錄

**--prefix**
    GMT 安裝目錄

**--version**
    GMT 版本
