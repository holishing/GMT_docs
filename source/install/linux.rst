Linux 下安裝 GMT
================

儘管大多數Linux發行版都提供了GMT二進制包，可以直接通過軟件包管理器 **apt-get**
或 **yum** 安裝，但發行版提供的GMT版本都很老，不建議使用。

針對Fedora/RHEL/CentOS用戶，GMT的官方RPM倉庫提供了最新版本的GMT。

Fedora
------

**Fedora 30** 及之後版本的用戶，可以啓用
`GMT官方RPM倉庫 <https://copr.fedorainfracloud.org/coprs/genericmappingtools/gmt/>`__
以安裝GMT最新版本::

    # 啓用GMT官方RPM倉庫
    dnf copr enable genericmappingtools/gmt

    # 安裝最新版GMT
    dnf install gmt

    # 當有新版本發佈時可直接更新
    dnf update gmt

除此之外，還可以安裝如下可選包以使用GMT的更多功能::

    # 地理數據格式轉換工具
    dnf install gdal

    # 製作GIF格式動畫需要GraphicsMagick
    dnf install GraphicsMagick

    # 製作MP4、WebM格式動畫需要ffmpeg
    dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-`rpm -E %fedora`.noarch.rpm
    dnf install ffmpeg

.. note::

    如果你已經安裝了Fedora系統倉庫提供的GMT軟件包，你必須在使用GMT官方倉庫
    前卸載舊的GMT安裝包。使用如下命令::

        dnf remove GMT dcw-gmt gshhg-gmt-nc4 gshhg-gmt-nc4-full gshhg-gmt-nc4-high

RHEL/CentOS
-----------

**RHEL/CentOS 6/7/8** 用戶可以啓用
`GMT官方RPM倉庫 <https://copr.fedorainfracloud.org/coprs/genericmappingtools/gmt/>`__
以安裝GMT最新版本。

.. note::

    CentOS 8 中的 GMT 目前不支持 GDAL 相關功能。

安裝方式如下::

    # 安裝 epel-release
    yum install epel-release

    # 啓用GMT官方倉庫 (僅限於RHEL/CentOS 7/8 用戶)
    yum install yum-plugin-copr
    yum copr enable genericmappingtools/gmt

    # 啓用GMT官方倉庫 (僅限於RHEL/CentOS 6 用戶)
    wget https://copr.fedorainfracloud.org/coprs/genericmappingtools/gmt/repo/epel-6/genericmappingtools-gmt-epel-6.repo -O /etc/yum.repos.d/genericmappingtools-gmt-epel-6.repo

    # 安裝最新版GMT
    yum install gmt

    # 當有新版本發佈時可直接更新
    yum update gmt

除此之外，還可以安裝如下可選包以使用GMT的更多功能::

    # 地理數據格式轉換工具
    yum install gdal

    # 製作GIF格式動畫需要GraphicsMagick
    yum install GraphicsMagick

    # 製作MP4、WebM格式動畫需要ffmpeg
    yum localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-`rpm -E %rhel`.noarch.rpm
    yum install ffmpeg

.. note::

    如果你已經安裝了EPEL倉庫提供的GMT軟件包，你必須在使用GMT官方倉庫
    前卸載舊的GMT安裝包。使用如下命令::

        yum remove GMT dcw-gmt gshhg-gmt-nc4 gshhg-gmt-nc4-full gshhg-gmt-nc4-high

Ubuntu/Debian用戶
-----------------

Ubuntu/Debian官方源中提供的GMT版本較老，不建議安裝使用。
目前Ubuntu/Debian用戶只能通過編譯源碼的方式安裝GMT最新版，
具體編譯方法見 :doc:`build-source`\ 。

如果不介意使用老版本的GMT5，可以通過如下方式安裝。
但注意，本手冊中的所有腳本無法在GMT5下運行。

安裝方式爲::

    sudo apt-get install gmt gmt-dcw gmt-gshhg
    sudo apt-get install ghostscript gdal-bin

ArchLinux用戶
-------------

ArchLinux用戶可以使用AUR提供的非官方源，使用方法爲::

    # 完整更新系統包
    sudo pacman -Syu

    # 安裝構建AUR包所需要的工具
    sudo pacman -S base-devel

    # 下載 AUR 提供的 gmt 構建代碼
    git clone https://aur.archlinux.org/gmt.git

    # 下載 AUR 提供的其它 gmt 相關包
    git clone https://aur.archlinux.org/gmt-coast.git
    git clone https://aur.archlinux.org/gmt-cpt-city.git
    git clone https://aur.archlinux.org/gmt-dcw.git

    # 使用 makepkg 構建並使用 pacman 安裝 gmt
    cd gmt
    makepkg -sc
    sudo pacman -U *.pkg.tar.xz

注意：\ `ArchlinuxCN repo <https://www.archlinuxcn.org/archlinux-cn-repo-and-mirror>`_
尚未提供GMT的二進制包。
