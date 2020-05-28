.. index:: ! subplot
.. include:: common_SYN_OPTs.rst_

subplot
=======

:官方文件: :doc:`gmt:subplot`
:簡介: 管理和設置子圖模式

**subplot** 模塊可以將當前紙張分隔成若干個網格區域，每個區域內都可以包含一張
單獨的子圖。

**subplot**  模塊提供了三條指令：

- **subplot begin** 進入子圖模式，並設置子圖的佈局
- **subplot set** 用於指定接下來的繪圖操作在哪一個子圖中進行
- **subplot end** 用於結束子圖模式

在子圖模式中，需要注意如下幾點：

- **-X** 和 **-Y** 選項無法在子圖模式中使用，可以使用 **-C** 選項作爲替代
- 在使用 **-J** 選項時，可以使用 **?** 來指定地圖寬度或比例尺，此時，GMT會根據
  子圖的大小自動確定最合適的地圖尺寸
- 對於笛卡爾投影，若想要X和Y軸共用相同的比例尺，則可以使用 **-Jx?**

subplot begin 語法
------------------

**gmt subplot begin**
*nrows*\ **x**\ *ncols*
|-F|\ [**f**\|\ **s**]\ *width*\ /*height*\ [**+f**\ *wfracs*\ /*hfracs*][**+c**\ *dx/dy*][**+g**\ *fill*][**+p**\ *pen*][**+w**\ *pen*]
[ |-A|\ [*autolabel*][**+j**\|\ **J**\ *refpoint*][**+c**\ *dx*\ /\ *dy*][**+g**\ *fill*][**+p**\ *pen*][**+o**\ *dx*/*dy*][**+r**][**+R**][**+v**] ]
[ |-C|\ [*side*]\ /*clearance*\ [**u**] ]
[ |SYN_OPT-B| ]
[ |SYN_OPT-J| ]
[ |-M|\ *margins* ]
[ |SYN_OPT-R| ]
[ |-S|\ *layout* ]
[ |-T|\ *title* ]
[ |SYN_OPT-V| ]
[ |SYN_OPT-X| ]
[ |SYN_OPT-Y| ]
[ |SYN_OPT--| ]

必須選項
--------

*nrows*\ **x**\ *ncols*
    指定子圖的行數和列數。

    每一行和每一列均有相同的子圖數目。注意：你無需在每個子圖內都繪圖。

.. _-F:

**-F**\ [**f**\|\ **s**]\ *width*\ /*height*\ [**+f**\ *wfracs*\ /*hfracs*][**+c**\ *dx/dy*][**+g**\ *fill*][**+p**\ *pen*][**+w**\ *pen*]
    指定圖片的尺寸。有兩種方式：

    - **-Ff**: 直接指定整張圖片的尺寸
    - **-Fs**: 指定單個子圖的尺寸

    除此之外，還可以爲整張圖加上背景色和邊框:

    - **+p**\ *pen*: 爲整張圖加上背景矩形邊框
    - **+w**\ *pen*: 繪製子圖區域之間的水平和垂直分割線
    - **+g**\ *fill*: 爲整張圖的背景矩形填充顏色
    - **+c**\ *dx/dy*: 設置背景矩形與整張圖之間的額外空白

    **-F**\ [**f**]\ *width*/*height*\ [**+f**\ *wfracs*\ /*hfracs*]
        指定整張圖片的寬度 *width* 和高度 *height*\ 。

        這種情況下，GMT會根據整張圖片的尺寸以及子圖的數目自動計算每張子圖的尺寸。
        在計算子圖尺寸時會考慮每個子圖的刻度線、標註、標籤所佔據的空間，以及不同子圖
        之間的間隔。整張圖的最外圈的刻度線、標記和標籤不算在整張圖片尺寸之內。

        默認所有行和列的尺寸都是相同的。若想要子圖的每一行具有不同的高度，
        或者子圖的每一列具有不同的寬度，則可以使用
        **+f**\ ，後面緊跟着一系列逗號分隔的寬度比例和以逗號分隔的高度比例。
        單個數則表示所有行或列有相同的寬度或高度。

        例如，對於一個2x2的子圖，使用\ **-Ff**\ 12c/12c+f3,1/1,2 則表示

        - 整張圖的寬度和高度均爲12釐米
        - 第一列佔3個寬度，第二列佔1個寬度
        - 第一行佔1個高度，第二行佔2個高度

    **-Fs**\ *widths*/*heights*
        通過指定每個子圖的寬度和高度間接指定圖片尺寸。

        在這種情況下，整張圖片的尺寸由每個子圖的尺寸以及刻度線、標註、標籤佔據的
        空間和子圖之間的間隙共同決定，但最外圈的刻度線、標記、標籤所佔據的空間不算
        在整張圖的尺寸之內。

        默認所有行和列的尺寸都是相同的。若想要給每行或每列指定不同的子圖尺寸，
        可以加上一系列以逗號分隔的寬度，然後再加上一個斜槓，並加上一系列以逗號分隔的高度。
        單個數則表示所有行或列有相同的寬度或高度。

        例如，對於一個2x2的子圖，使用 **-Fs**\ 4c,8c/4c 則表示
        第一列爲4釐米寬，第二列爲8釐米寬，所有列的高度均爲4釐米高。
        注意，寬度值或高度值的數目必須是一個或者與行數/列數相匹配。

        對於地理地圖而言，每張子圖的高度由地圖區域 **-R** 以及投影方式 **-J** 決定。
        有兩個選擇：(1) 指定子圖高度爲0，並同時指定 **-R** 和 **-J**\ ，
        利用其計算每張子圖的高度，但要求所有子圖必須共享相同的研究區域和投影方式；
        (2) 不斷嘗試並修改子圖的高度以得到最佳的繪圖佈局。

可選選項
--------

.. _-A:

**-A**\ [*autolabel*][**+j**\|\ **J**\ *refpoint*][**+c**\ *dx*\ /\ *dy*][**+g**\ *fill*][**+p**\ *pen*][**+o**\ *dx*/*dy*][**+r**][**+R**][**+v**]
    爲子圖自動添加編號。

    *autolabel* 可以是單個數字或字母，也可以在數字或字母的一側或兩側加上括號。
    其設置了左上角第一張子圖的編號，而其餘子圖則按照遞增的順序依次編號。
    默認值爲 **a)**\ 。

    .. note::

       括號在Unix Shell中有特殊含義，可以將其用單引號括起來，即 ``'(a)'``\ 。

    加上子選項可以指定編號的更多屬性：

    - **+j**\|\ **J**\ *refpoint*: 指定編號在子圖中的位置，默認值爲 ``TL``\ ，
      即編號位於子圖的左上角。\ **+j** 和 **+J** 分別適用於子圖編號位於子圖內部和
      外部的情況
    - **+o**\ *dx*\ [/*dy*] 設置子圖編號相對於 **+j|J** 指定的參考位置間的額外偏移量，
      默認值爲 :ref:`FONT_TAG` 的20%
    - **+p**\ *pen* 爲子圖編號加上文本框
    - **+g**\ *fill* 爲子圖編號的文本框填充顏色
    - **+c**\ *dx*\ [/*dy*]: 設置子圖編號與文本框輪廓間的距離，默認值爲 :ref:`FONT_TAG` 的15%
    - **+r** 表示用小寫羅馬數字編號
    - **+R** 表示用大小羅馬數字編號
    - **+v** 表示沿着垂直列方向依次增加編號，默認沿着水平行方向依次增加

.. |Add_-B| replace:: 該選項會應用到所有子圖。
.. include:: explain_-B.rst_

.. _-C:

**-C**\ [*side*]\ /*clearance*\ [**u**]
    設置子圖區域內某個邊的額外空白量。這些額外的空白量可以用於繪製比例尺、
    添加額外的文字等。

    *side* 可以取 **e** **w** **s** **n** 分別代表東西南北四條邊；
    也可以取 **x** 或 **y**\ ，分別表示設置東西或南北方向兩條邊的空白；
    若不指定 *side*\ ，則表示同時設置四條邊上的空白量。

    該選項可以重複多次，對不同邊分別設置不同的間距。

    **subplot begin** 中該選項對所有子圖均有效，而 **subplot set** 中使用該選項
    則僅對當前子圖有效。

    .. note::

       在子圖模式下不能使用 **-X** 和 **-Y**\ ，可以使用 **-C** 作爲替代。

.. include:: explain_-J.rst_

.. _-M:

**-M**\ *margins*
    相鄰子圖之間的額外空白

    *margins* 可以有三種情況：

    #. 取一個值，表示子圖四個方向的空白 [默認值爲 :term:`FONT_ANNOT_PRIMARY` 規定的字體大小]
    #. 取兩個值，表示子圖的水平和垂直方向的空白，兩個值之間用斜槓分隔
    #. 取四個值，表示子圖的左右下上四個方向的空白，四個值之間用斜槓分隔

.. |Add_-R| replace:: 該選項會應用於所有子圖
.. include:: explain_-R.rst_

.. _-S:

**-SC**\ [**b**\|\ **t**][**+l**\ *label*][**+t**]
    設置一列中的所有子圖共用X軸

    當一列所有子圖共用X軸時，默認只有第一行子圖的頂部（\ **t**\ ） X軸
    和最後一個子圖的底部（\ **b**\ ）X軸有標註。

    - **-SCb** 一列中只有最後一行子圖的底部X軸有標註
    - **-SCt** 一列中只有第一行子圖的頂部X軸有標註
    - **+l**\ *label* 爲共用的X軸添加標註
    - **+t** 爲每個子圖的標題預留空間
    - **+tc** 爲第一行的所有子圖的標題預留空間

**-SR**\ [**l**\|\ **r**][**+l**\ *label*][**+p**][**+t**]
    設置一行中所有子圖共用Y軸

    當一行所有子圖共用X軸時，默認只有第一列子圖的左邊Y軸和最後一列子圖的右邊Y軸有標註。

    - **-SRl** 一行中只有第一列子圖的左邊Y軸有標註
    - **-SRr** 一行中只有最後一列子圖的右邊Y軸有標註
    - **+l**\ *label* 爲共用的Y軸添加標註
    - **+p** 設置所有標註與Y軸平行

.. _-T:

**-T**\ *heading*
    設置整張圖的總標題，標題文字的屬性由 :ref:`FONT_HEADING` 控制。

    每張子圖各自的標題可以用 **-B** 或 **-S** 選項控制。

.. include:: explain_-V.rst_

.. include:: explain_-XY.rst_

.. include:: explain_help.rst_

subplot set
-----------

**subplot set** 通過指定子圖的行列號或索引號以激活某個特定的子圖，
接下來的所有繪圖命令將只在該子圖內進行繪製。其與 :doc:`/option/c` 功能基本一致。

子圖的行號、列號、索引號均從0開始算起。因而對於MxN的子圖而言，行號的取值爲0到M-1，
列號的取值爲0到N-1，索引號的取值則爲0到(M*N-1)。

若使用 **subplot set** 但未指定子圖的行列號或索引號，則GMT會自動激活“下一個”子圖。
例如，對於一個2行2列的圖而言，每次使用 **subplot set** 而不指定子圖行和列，則
按照行優先順序依次激活子圖 ``0,0`` → ``0,1`` → ``1,0`` → ``1,1``\ 。
若 **subplot begin** 中使用了 **-A+v** 選項，則按照列優先順序依次激活子圖
``0,0`` → ``1,0`` → ``0,1`` → ``1,1``\ 。

subplot set 語法
----------------

**gmt subplot set**
[ *row,col*\|\ *index* ]
[ **-A**\ *fixedlabel*]
[ **-C**\ *side*\ /*clearance*\ [**u**] ]
[ |SYN_OPT-V| ]

可選選項
--------

*row,col* | *index*
    指定要激活的子圖的行列號或索引號。行列號、索引號均從0開始算起。

    若不指定子圖行列號或索引號，則自動激活“下一個”子圖。

**-A**\ *fixedlabel*
    設置當前子圖的編號，忽略 **subplot begin** 中 **-A** 選項設置的自動編號。

    這一選項可以用於臨時修改單個子圖的編號，但該選項只能修改編號字符串，
    其餘屬性（如位置、文本框）等均只能繼承自 **subplot begin** 的 **-A** 選項。

**-C**\ *side*/*clearance*\ [*u*]
    設置子圖的某個邊的額外空白量。這些額外的空白量可以用於繪製比例尺、添加額外的文字等。

    *side* 可以取 **e** **w** **s** **n** 分別代表東西南北四條邊。
    該選項可以重複多次，對不同邊分別設置不同的間距。
    **subplot begin** 該選項對所有子圖均有效，而 **subplot set** 中使用該選項
    則僅對當前子圖有效。

    .. note::

       在子圖模式下不能使用 **-X** 和 **-Y**\ ，可以使用 **-C** 作爲替代。

subplot end
-----------

該命令用於結束當前的子圖模式。

在結束子圖模式時，其會進行如下操作：

- 對所有子圖進行編號
- 將繪圖原點重置回之前的原點位置
- 更新歷史信息，設置爲線性投影，並給出整張圖的大小，使得用戶可以使用 **-DJ** 方式
  放置colorbar等。

subplot end 語法
----------------

**gmt subplot end** [ |SYN_OPT-V| ]

示例
----

下面的示例展示瞭如何設置一張2x2佈局的圖，並使用不同的方式指定要激活的子圖。
不同的設置方式的效果是相同的，用戶在使用時可根據需求選擇最直觀最簡便的方式。

**方法1: 使用 subplot set 指定子圖行列號**

注意行列號均從0開始。

.. gmtplot::

    gmt begin map png,pdf
        gmt subplot begin 2x2 -Fs5c/2.5c -A
        gmt subplot set 0,0
        gmt basemap -R0/10/0/10 -Baf
        gmt subplot set 0,1
        gmt basemap -R0/10/0/10 -Baf
        gmt subplot set 1,0
        gmt basemap -R0/10/0/10 -Baf
        gmt subplot set 1,1
        gmt basemap -R0/10/0/10 -Baf
        gmt subplot end
    gmt end

**方法2: 使用 subplot set 指定子圖索引號**

注意子圖索引號從0開始::

    gmt begin map png,pdf
        gmt subplot begin 2x2 -Fs5c/2.5c -A
        gmt subplot set 0
        gmt basemap -R0/10/0/10 -Baf
        gmt subplot set 1
        gmt basemap -R0/10/0/10 -Baf
        gmt subplot set 2
        gmt basemap -R0/10/0/10 -Baf
        gmt subplot set 3
        gmt basemap -R0/10/0/10 -Baf
        gmt subplot end
    gmt end

**方法3: 使用 subplot set 但不指定子圖號**

每次使用 **subplot set** 但不指定子圖行列號或索引號，則會自動激活“下一個”子圖::

    gmt begin map png,pdf
        gmt subplot begin 2x2 -Fs5c/2.5c -A
        gmt subplot set
        gmt basemap -R0/10/0/10 -Baf
        gmt subplot set
        gmt basemap -R0/10/0/10 -Baf
        gmt subplot set
        gmt basemap -R0/10/0/10 -Baf
        gmt subplot set
        gmt basemap -R0/10/0/10 -Baf
        gmt subplot end
    gmt end

**方法4: 使用 -c 選項**

:doc:`/option/c` 的功能與 **subplot set** 類似，可以用於激活指定的子圖。
其後可以接子圖行列號或索引號，也可以只使用 **-c** 自動激活下一個子圖::

    gmt begin map png,pdf
        gmt subplot begin 2x2 -Fs5c/2.5c -A
        gmt basemap -R0/10/0/10 -Baf -c
        gmt basemap -R0/10/0/10 -Baf -c
        gmt basemap -R0/10/0/10 -Baf -c
        gmt basemap -R0/10/0/10 -Baf -c
        gmt subplot end
    gmt end

下面展示瞭如何設置一個2x2的圖，並設置共用X和Y軸:

.. gmtplot::

    gmt begin panels png,pdf
      gmt subplot begin 2x2 -Fs10c/5cc -M5p -A -SCb -SRl -Bwstr
        gmt subplot set
        gmt basemap -R0/80/0/10
        gmt subplot set
        gmt basemap
        gmt subplot set
        gmt basemap
        gmt subplot set
        gmt basemap
      gmt subplot end
    gmt end

下面的示例展示瞭如何繪製一個不完全規則的子圖。這個示例中，實際上只使用了子圖0、
2、3，而第一張圖同時佔據了子圖0和1的空間。在這種情況下，GMT的自動編號功能無法
正確編號，因而需要在 **subplot set** 中爲每個子圖單獨指定編號。

.. gmtplot::

    gmt begin map pdf,png
        gmt subplot begin 2x2 -Fs5c/3c -A -M0

        gmt subplot set 0
        gmt basemap -R0/20/0/10 -JX11.2c/3c -Baf -BWSen

        gmt subplot set 2 -A'(b)'
        gmt basemap -R0/20/0/10 -JX? -Baf -BWSen

        gmt subplot set 3 -A'(c)'
        gmt basemap -R0/20/0/10 -JX? -Baf -BWSen

        gmt subplot end
    gmt end

相關模塊
--------

:doc:`begin`,
:doc:`clear`,
:doc:`docs`,
:doc:`end`,
:doc:`figure`,
:doc:`inset`
