GMT單行模式
===========

在之前的教程中，有很多示例都只需要一個GMT命令即可完成繪圖。比如::

    gmt begin GlobalMap png,pdf
        gmt coast -Rg -JH15c -Gpurple -Baf -B+t"My First Plot"
    gmt end show

在這種簡單的情況下，每次都需要寫 **gmt begin** 和 **gmt end** 未免有些麻煩。

針對這種簡單情況，GMT提供了“單行模式”。即當繪圖只需要一個GMT命令時，
可省略 **gmt begin** 和 **gmt end**\ ，只需要在繪圖命令後加上
**-**\ *format* *figname* 即可。

例如，上面的三行命令可以用單行模式寫成一行命令::

    gmt coast -Rg -JH15c -Gpurple -Baf -B+t"My First Plot" -pdf,png GlobalMap

命令一下子就簡單了很多，也可以直接將命令複製粘貼到終端執行。

顯然，單行模式只適用於單個命令成圖的情況，而大部分實際繪圖都需要多個命令才能實現。

.. note::

    GMT官方文件以及本手冊中，很多示例都只需使用單個GMT命令來展示某個模塊的用法或
    某個選項的繪圖效果。

    出於簡化代碼的考慮，本手冊中的很多演示示例都採用了GMT單行模式。
    讀者應理解其中的差異，並瞭解如何修改單行模式的命令並應用到自己的實際繪圖腳本中。
