使用CPT
=======

命令行指定CPT文件名後，GMT會依次在當前目錄、 :file:`~/.gmt` 和 :file:`${GMTHOME}/share/cpt/`
目錄下尋找CPT文件，如果找不到還會加上後綴 ``.cpt`` 尋找。

在文件名後加上後綴 ``+u|U<unit>`` 還可以對CPT文件中的Z值進行縮放。

- ``filename.cpt+u<unit>`` 可以將Z值從 ``<unit>`` 變換爲以米爲單位
- ``filename.cpt+U<unit>`` 可以將Z值從以米爲單位變換成 ``<unit>``
