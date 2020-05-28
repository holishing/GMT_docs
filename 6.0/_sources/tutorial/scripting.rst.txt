腳本編程
========

本手冊中的所有示例及代碼都使用Bash腳本實現，要求讀者對Bash腳本語言有最基本的瞭解。
Windows用戶若使用Batch腳本，則需要同時瞭解Bash和Batch的語法，並瞭解如何將
本手冊中的Bash腳本正確轉換爲Batch腳本。

這一節介紹本手冊中或GMT使用過程中最常用的Bash和Batch語法，而不涉及不常用或更復雜的語法。
本文主要包含四部分內容：

- Bash編程基礎知識
- Batch編程基礎知識
- 將Bash腳本轉換爲Batch腳本
- 常用Unix小工具

Bash編程基礎知識
----------------

用文本編輯器創建一個後綴名爲 **.sh** 的文件，向其中寫入Bash命令並保存，即得到一個Bash腳本。

打開終端，在終端中輸入 ``bash script.sh``\，即可執行Bash腳本 :file:`script.sh`\ 。
也可以執行命令 ``chmod +x script.sh`` 給腳本可執行權限，然後即可在終端輸入
``./script.sh``\ 運行“可執行”的腳本。

下面的Bash腳本展示並解釋了Bash中常用的語法：

.. code-block:: bash

	#!/bin/bash
	# 腳本的第一行叫 shebang，用來告知系統如何執行該腳本:
	# 參見： http://en.wikipedia.org/wiki/Shebang_(Unix)
	# 以 # 開頭的行是註釋行，在腳本執行時會被忽略

	# echo 命令用於顯示後面的字符
	echo Hello world!

	# 聲明一個變量
	# 注意：= 兩邊不能有空格!
	projection="X10c/10c"
	region="0/10/0/10"

	# 在變量名前加上 $ 符號即可引用該變量的值
	echo $projection $region

	# 執行GMT命令
	gmt begin map
	gmt basemap -J$projection -R$region -Baf

	# 輸入數據
	# 有些命令需要讀入數據。Bash中有多種方法可以將數據傳遞給一個命令：
	# 1. 將數據保存到文件中，並在命令中指定數據文件名
	#    下面的命令會讀取文件 input.dat 中的數據
	gmt plot input.dat -W1p

	# 2. 通過管道符號 | 將前一個命令的輸出作爲後一個命令的輸入
	#    下面的命令中，echo 命令輸出了 5 5，該輸出通過管道被傳遞給了 GMT 命令作爲輸入
	echo 5 5 | gmt plot -Sc0.5c

	# 3. 使用 heredoc 將兩個 EOF 之間的數據傳給命令
	#    下面的命令中，<< EOF 表示將接下來到EOF爲止的內容傳遞給命令
	gmt plot -Sc0.5c << EOF
	1 2
	3 4
	5 6
	EOF

	# 輸出數據
	# 很多命令都會輸出一些數據或信息。默認情況下，輸出會在終端顯示。爲了將數據保存到文件中，需要使用重定向符號。
	# 常用的重定向符號主要有兩個： > 和 >>
	#   > 表示將數據輸出到文件中。若文件不存在，則創建該文件；若文件已存在，則覆蓋該文件的原內容；
	#  >> 表示將數據追加到文件中。若文件不存在，則創建該文件；若文件已存在，則將數據追加到原內容的後面；
	echo 1 3 Point1 > tmp.txt
	echo 2 5 Point2 >> tmp.txt
	echo 4 2 Point3 >> tmp.txt
	# 此時文件中有三行內容

	# 倒引號
	# 倒引號的作用是將一個命令的輸出保存到一個變量中，供後面的命令使用
	# 下面將 gmt info 的輸出保存到變量 new_region 中，並在接下來的命令中使用了該變量的值
	new_region=`gmt info input.dat -I1/1`
   	gmt plot input.dat -J$projection $new_region

	# 長命令續行符
	# 當一個命令較長時，可以將命令拆分爲多行，每行行末用續行符 \ 表示下一行命令
	# 需要接在當前命令的後面
	gmt coast -A1000 -Dc -ECN -W1/1p \
		-Glightblue -Slightred

	gmt end show

	# rm 命令刪除文件
	rm tmp.txt

Batch編程基礎知識
-----------------

新建一個文本文件，將後綴改爲 **.bat**\ ，向文件中寫入Batch命令並保存，即得到一個Batch腳本。

雙擊該Batch腳本即可直接運行，也可以打開CMD窗口，再輸入Batch腳本名以運行腳本。

下面的Batch腳本展示並解釋了Batch腳本中常用的語法：

.. code-block:: batch

	REM 以 REM 開頭的行是註釋行，在腳本執行時會被忽略

	REM echo 命令用於顯示後面的字符
	echo Hello world!

	REM 使用 set 命令聲明一個變量
	set projection="X10c/10c"
	set region="0/10/0/10"

	REM 在變量名前後加上 % 即可引用該變量的值
	echo %projection% %region%

	REM 執行GMT命令
	gmt begin map
	gmt basemap -J%projection% -R%region% -Baf

	REM 輸入數據
	REM 有些命令需要讀入數據。Bash中有多種方法可以將數據傳遞給一個命令：
	REM 1. 將數據保存到文件中，並在命令中指定數據文件名
	REM    下面的命令會讀取文件 input.dat 中的數據
	gmt plot input.dat -W1p

	REM 2. 通過管道符號 | 將前一個命令的輸出作爲後一個命令的輸入
	REM    下面的命令中，echo 命令輸出了 5 5，該輸出通過管道被傳遞給了 GMT 命令作爲輸入
	echo 5 5 | gmt plot -Sc0.5c

	REM 輸出數據
	REM 很多命令都會輸出一些數據或信息。默認情況下，輸出會在終端顯示。爲了將數據保存到文件中，需要使用重定向符號。
	REM 常用的重定向符號主要有兩個： > 和 >>
	REM   > 表示將數據輸出到文件中。若文件不存在，則創建該文件；若文件已存在，則覆蓋該文件的原內容；
	REM  >> 表示將數據追加到文件中。若文件不存在，則創建該文件；若文件已存在，則將數據追加到原內容的後面；
	echo 1 3 Point1 > tmp.txt
	echo 2 5 Point2 >> tmp.txt
	echo 4 2 Point3 >> tmp.txt
	REM 此時文件中有三行內容

	REM 將命令的輸出保存到變量中
	REM Batch中可以將命令的輸出寫到文件中，然後用 set /p var=<file 的方式將文件中的內容作爲變量的值
	gmt info input.dat -I1/1 > tmp.dat
   	set /p new_region=<tmp.dat
	gmt plot input.dat -J%projection% %new_region%

	# 長命令續行符
	# 當一個命令較長時，可以將命令拆分爲多行，每行行末用續行符 ^ 表示下一行命令
	# 需要接在當前命令的後面
	gmt coast -A1000 -Dc -ECN -W1/1p ^
		-Glightblue -Slightred

	gmt end show

	REM del 命令用於刪除文件
	del tmp.txt

	REM pause 命令用於暫停命令的執行
	REM 雙擊執行Batch腳本，腳本會在結束後自動退出。
	REM 爲了查看腳本執行過程中是否報錯，通常在Batch文件最後一行加上 pause
	pause

將Bash腳本轉換爲Batch腳本
-------------------------

Bash語法和Batch語法不同。本手冊中所有腳本均使用Bash實現，Batch用戶需要根據需求自行將Bash腳本轉換爲Batch腳本。轉換主要注意如下幾點：

- 	註釋符號： ``#`` 改成 ``REM``
-	定義變量的方式： ``var=value`` 改成 ``set var=value``
- 	引用變量的方式： ``$region`` 改成 ``%region%``
- 	刪除文件的命令： ``rm`` 改成 ``del``
- 	Bash中可以使用倒引號 ``var=`cmd1``` 將命令 cmd1 的輸出作爲變量 var 的值。Batch不支持這一語法，需要使用下面的命令實現類似功能::

		cmd1 > tmp.dat
		set /p var=<tmp.dat

- 	Bash中可以使用 EOF 將多行數據傳遞給一個命令。例如::

		gmt plot << EOF
		1 2
		3 4
		5 6
		EOF

  	Batch不支持這一語法，只能多次使用 echo 命令將數據輸出到同一文件中，再將文件傳遞給命令使用::

	  	echo 1 2 >  tmp.dat
		echo 3 4 >> tmp.dat
		echo 5 6 >> tmp.dat
		gmt plot tmp.dat

常用Unix小工具
--------------

- awk: http://www.ruanyifeng.com/blog/2018/11/awk.html
