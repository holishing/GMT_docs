.. index:: ! end
.. include:: common_SYN_OPTs.rst_

end
===

:官方文檔: :doc:`gmt:end`
:簡介: 結束現代模式會話，生成並顯示圖片

**end** 模塊用於結束由 **begin** 模塊創建的GMT當前會話，並在當前目錄生成
指定格式的圖片文件，還支持使用系統默認圖片閱讀器自動打開生成的圖片。

語法
----

**gmt end**
[ **show** ]
[ |SYN_OPT-V| ]

可選參數
--------

**show**
    用系統默認圖片閱讀器自動打開所有當前會話生成的圖片文件。

.. include:: explain_-V.rst_

.. include:: explain_help_nopar.rst_

示例
----

用 **begin** 創建一個會話，繪圖，並用 **end** 結束當前會話::

    gmt begin
    gmt basemap -R0/10/0/10 -JX10c -Baf
    gmt end show

禁用自動顯示
------------

對於單行模式的命令以及以 **gmt end show** 結尾的腳本，GMT會自動顯示生成的圖片。
如果想不修改腳本但禁用自動顯示圖片，則可以設置爲環境變量 **GMT_END_SHOW** 爲 ``off``\ 。

相關模塊
--------

:doc:`begin`,
:doc:`clear`,
:doc:`docs`,
:doc:`figure`,
:doc:`inset`,
:doc:`subplot`,
:doc:`gmt`
