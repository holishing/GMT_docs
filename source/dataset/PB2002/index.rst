PB2002: 全球板塊邊界數據
========================

PB2002 是常用的一個全球板塊邊界數據，其包含了14個大板塊和38個小板塊，共計52個板塊的邊界數據。

- 官方網站: http://peterbird.name/publications/2003_PB2002/2003_PB2002.htm
- 原始數據下載地址: http://peterbird.name/oldFTP/PB2002/
- 數據格式說明: http://peterbird.name/oldFTP/PB2002/2001GC000252_readme.txt

數據下載
--------

原始數據的格式無法直接用於GMT繪圖。這裏我們從官方網站下載了 ``PB2002_plates.dig.txt``
和 ``PB2002_boundaries.dig.txt`` 數據，並將其段頭記錄做了修改以供GMT用戶使用。

可供GMT直接使用的數據下載地址:

- :download:`PB2002_plates.dig.txt`
- :download:`PB2002_boundaries.dig.txt`

兩個數據是等效的，區別在於 **PB2002_plates.dig.txt** 中數據分爲52段，
每段數據對應一個板塊邊界閉合多邊形，每段數據的段頭記錄爲該段數據的板塊名稱縮寫。

**PB2002_boundaries.dig.txt** 中數據分爲229段，其將相鄰板塊的共同邊界分爲不同的段列出來。
段頭記錄中包含了兩個板塊的名稱縮寫，以及板塊數據來源的參考文獻。

使用示例
--------

在繪圖方面，兩個數據沒有區別。

.. gmtplot:: PB2002.sh
   :width: 80%

   PB2002 全球板塊邊界

引用信息
--------

Bird, P. (2003) An updated digital model of plate boundaries, *Geochemistry Geophysics Geosystems*, 4(3), 1027, doi:10.1029/2001GC000252.
