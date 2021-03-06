-s 選項
=======

**-s** 選項用於控制是否輸出含有 NaN 的記錄。

默認情況下，GMT命令會輸出所有記錄，包括那些某列值爲 NaN 的記錄。
使用 **-s** 選項可以控制是否輸出含 NaN 的記錄。其語法爲：

    **-s**\ [*cols*][**+a**\|\ **+r**]

- 只使用 **-s**\ ，則不輸出Z值（即第三列）爲NaN的記錄
- **+a** 表示任意一列有NaN則不輸出
- **+r** 表示反操作，即只輸出某列有 NaN 的記錄
- *cols* 用於指定要檢查的列，即只有指定的所有列都爲NaN時，才輸出或不輸出該記錄。
  *cols* 是一系列用逗號分隔的列號或者列號範圍。
  列號範圍的格式爲 *start*\ [:*inc*]:*stop*\ 。若省略 *inc* 則默認其值爲1。
  比如 **2,5,7** 表示檢查第3、6、8列（列號從0開始）；
  **0,2:3** 表示檢查第1、3、4 列。

舉幾個例子。輸入數據 *input.dat* 的內容爲::

    1 1 1   0
    2 2 NaN 0
    3 3 3   NaN

不使用 **-s** 選項則會輸出所有記錄::

    $ gmt select input.dat
    1	1	1	0
    2	2	NaN	0
    3	3	3	NaN

使用 **-s** 選項則會壓制第三列爲NaN的記錄的輸出::

    $ gmt select input.dat -s
    1	1	1	0
    3	3	3	NaN

使用 **-s+a** 選項則只有任意一列有NaN則不輸出該記錄::

    $ gmt select input.dat -s+a
    1	1	1	0

使用 **-s2** 選項則檢查第三列（列號從0開始）是否爲NaN::

    $ gmt select input.dat -s2
    1	1	1	0
    3	3	3	NaN

使用 **-s2,3** 則壓制第3和4列均爲NaN的記錄的輸出::

    $ gmt select input.dat -s2,3
    1	1	1	0
    2	2	NaN	0
    3	3	3	NaN
