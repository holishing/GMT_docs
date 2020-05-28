-e 選項
=======

GMT命令在讀入數據時默認會處理讀入的所有數據記錄。\ **-e** 選項的作用是篩選或
排除匹配某個字符串或者正則表達式的數據記錄。

**-e** 選項的用法有兩種：

- 匹配某個字符串： **-e**\ [**~**]\ *"pattern"*
- 匹配某個正則表達式： **-e**\ [**~**]/\ *regexp*/[**i**]

在匹配字符串或正則表達式前加上 **~** 表示取反，即排除匹配字符串或正則表達式的數據記錄。
如果數據記錄中本身就包括字符 **~**\ ，則需要使用 **\~** 對其進行轉義。
對於匹配正則表達式而言，還可以加上 **i** 表示忽略大小寫。

如果需要指定多個可能的匹配字符串或表達式，則可以加上 **+f**\ *file*\ 。
其中 *file* 中每行列出一個匹配字符串或表達式。

如果某個匹配字符串以 **+f** 開頭，則會被GMT當作是 **-e** 的子選項，因而需要使用 **\+f**
以實現轉義。

以一個常見的應用場景舉例。假如文件 *input.dat* 中有一堆數據點，每個數據都對應
某個分類，文件內容如下::

    1 1 type1
    2 2 type1
    3 3 type1
    4 4 type2
    5 5 type2
    6 6 type2
    7 7 type3
    8 8 type10
    9 9 type10
    10 10 null

可以使用 **-e** 選項篩選出自己需要的數據記錄。

篩選出所有匹配 *type* 的記錄::

    $ gmt select input.dat -e"type"
    1	1	type1
    2	2	type1
    3	3	type1
    4	4	type2
    5	5	type2
    6	6	type2
    7	7	type3
    8	8	type10
    9	9	type10

排除所有匹配 *null* 的記錄::

    $ gmt select input.dat -e~"null"
    1	1	type1
    2	2	type1
    3	3	type1
    4	4	type2
    5	5	type2
    6	6	type2
    7	7	type3
    8	8	type10
    9	9	type10

篩選所有匹配 *type2* 的記錄::

    $ gmt select input.dat -e"type2"
    4	4	type2
    5	5	type2
    6	6	type2

篩選所有匹配 *type1* 的記錄::

    # 錯誤寫法，因爲 type1 也包含在字符串 type10 中
    $ gmt select input.dat -e"type1"
    1	1	type1
    2	2	type1
    3	3	type1
    8	8	type10
    9	9	type10

    # 正確寫法
    # 此處使用了正則表達式，符號 $ 表示行末匹配
    $ gmt select input.dat -e/type1$/
    1	1	type1
    2	2	type1
    3	3	type1

正則表達式的具體用法不在本手冊的範圍之內，用戶請自行搜索“正則表示式”。
