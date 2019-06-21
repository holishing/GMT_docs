.. index:: ! sac

sac
===

:官方文档: :doc:`gmt:supplements/seis/sac`
:简介: 在地图上绘制 SAC 格式的地震波形数据

该命令会直接读取命令行中的 SAC 文件名，或者从输入文件中读入 SAC 文件名及控制
参数信息，并将波形数据画在图上。

.. note::

   pssac 模块修改自原 pssac 与 pssac2，其功能类似，但语法不同。

pssac 实现波形绘制的步骤是：

#. 读入 ``SACfiles`` 或 ``saclist``
#. 根据 ``-T`` 选项确定参考时间
#. 根据 ``-C`` 选项和参考时间读入指定的波形数据段
#. 根据 ``-F`` 选项对数据进行预处理
#. 根据 ``-M`` 选项确定Y方向的缩放因子并对波形振幅进行缩放
#. 根据 ``-Q`` 决定是否交换X和Y
#. 根据 ``-E`` 以及其他信息确定波形在地图上的位置
#. 根据 ``-W`` 选项绘制波形
#. 根据 ``-G`` 选项为波形涂色

必选选项
--------

``-J`` ``-R``

``SACfiles``
    要绘制在图上的一系列SAC文件名，目前仅支持等间隔SAC数据

``saclist``
    SAC 文件列表，每行包含一个SAC文件名及其对应的控制参数。

    文件格式为::

        filename [X  Y [pen]]

    - ``filename`` 是要绘制的SAC文件名
    - ``X`` 和 ``Y`` 控制SAC波形的第一个数据点在地图上的位置。若省略 ``X`` 和
      ``Y`` ，则使用其默认值，否则此处指定的 ``X`` 和 ``Y`` 将具有最高优先级

      - 对于线性投影而言， ``X`` 默认是SAC文件的开始时间。使用 ``-T`` 选项会
        调整 ``X`` 的默认值， ``Y`` 值则由 ``-E`` 选项控制；
      - 对于地理投影而言， ``X`` 和 ``Y`` 默认是台站的经度和纬度。

    - ``pen`` 控制当前SAC波形的线条属性

可选选项
--------

``-C[<t0>/<t1>]``
    只读取并绘制时间窗 ``<t0>`` 到 ``<t1>`` 范围内的波形。

    ``<t0>`` 和 ``<t1>`` 均是相对于参考时间的秒数，参考时间由 ``-T`` 选项决定。
    若未使用 ``-T`` 选项，则使用SAC头段中的参考时间（kzdate和kztime）。

    若只使用了 ``-C`` 但未指定时间窗，则 ``<t0>/<t1>`` 由 ``-R`` 选项的
    ``<xmin>/<xmax>`` 决定。

``-D<dx>[/<dy>]``
    使得波形偏离指定位置 ``<dx>/<dy>`` 。若未指定 ``<dy>`` 则默认与 ``<dx>`` 相同。

``-Ea|b|k|d|n[<n>]|u[<n>]``
    选择剖面类型（即Y轴类型）

    - ``a`` 方位角剖面
    - ``b`` 反方位角剖面
    - ``k`` 震中距剖面（单位 km）
    - ``d`` 震中距剖面（单位 degree）
    - ``n`` 波形编号剖面，第一个波形的编号为 ``<n>`` （ ``<n>`` 默认值为0）
    - ``u`` 用户自定义剖面，SAC波形的Y位置由SAC头段变量 ``user<n>`` 决定，默认使用 user0

``-F[i][q][r]``
    绘图之前的数据预处理

    - ``i`` 积分
    - ``q`` 平方
    - ``r`` 去均值

    ``i|q|r`` 可以重复多次，比如 ``-Frii`` 会将加速度转化为位移。 ``i|q|r``
    出现的顺序决定了数据预处理的流程。

``-G[p|n][+g<fill>][+z<zero>][+t<t0>/<t1>]``
    为波形的正/负部分涂色。

    - 若 ``-G`` 后不接任何参数，则默认将正值部分填充为黑色
    - ``p|n`` 控制是要填充正值区域还是负值区域，重复使用 ``-G`` 选项以分别为
      正/负部分设置不同的填充属性
    - ``+g<fill>`` 填充色
    - ``+t<t0>/<t1>`` 只填充 ``<t0>/<t1>`` 范围内的波形。参考时间由 ``-T`` 选项决定。
    - ``+z<zero>`` 定义“零”参考线。从“零”到顶部为正值区域，从“零”到底部为负值区域

``-M<size>[<unit>]/<alpha>``
    控制Y方向的缩放。不使用的话，Y方向即为振幅

    - ``<size>[<unit>]`` 将所有波形在地图上的高度缩放到 ``<size>[<unit>]`` ，
      其中 ``<unit>`` 可以取 ``i|c|p`` ，默认单位由 ``PROJ_LENGTH_UNIT`` 控制。
    - ``<size>/<alpha>``

      - 若 ``<alpha>`` 小于0，则所有波形使用相同的比例因子。比例因子由第一个
        波形决定，第一个波形将被缩放到 ``<size>[<unit>]``
      - 若 ``<alpha>`` 等于0，则将所有波形乘以 ``<size>`` ，此时不允许有单位
      - 若 ``<alpha>`` 大于0，则将所有波形乘以 ``<size>*r^<alpha>`` ，其中
        r 是以 km 为单位的距离

``-Q``
    垂直绘制波形，即Y轴是时间，X轴是振幅

``-S[i]<scale>[<unit>]``
    指定时间比例尺。

    对于地理投影而言，即表示图上一个单位距离所代表的波形描述。
    其中单位 ``<unit>`` 可以取 ``c|i|p`` 。
    若未指定 ``<unit>`` ，则默认使用 ``PROJ_LENGTH_UNIT`` 所指定的单位。

    在 ``<scale>`` 前加上 ``i`` 则时间比例尺的含义反过来，即 ``<scale>`` 表示
    1秒长度的波形在图上的实际长度。

``-T[+t<n>][+r<reduce_vel>][+s<shift>]``
    指定参考时间及偏移量

    - ``+t<tmark>`` 指定参考时间（即将所有波形沿着参考时间对齐），其中
      ``<tmark>`` 可以取-5(b), -4(e), -3(o), -2(a), 0-9(t0-t9)
    - ``+r<reduce_vel>`` 设置reduce速度，单位 km/s
    - ``+s<shift>`` 将所有波形偏移 ``<shift>`` 秒

``-W<pen>``
    设置波形的画笔属性

示例
----

利用 SAC 的命令 ``funcgen seismogram`` 生成了波形，想要绘制单个波形，并分别为
正负部分涂色::

    gmt pssac seis.SAC -JX10c/5c -R9/20/-2/2 -Baf -Fr -Gp+gblack -Gn+gred > single.ps

利用 SAC 命令 ``datagen sub tel *.z`` 生成多个波形，将其绘制在距离剖面上::

    gmt pssac *.z -R200/1600/12/45 -JX15c/5c -Bx200+l'T(s)' -By5+lDegree -BWSen \
         -Ed -M1.5c -W0.5p,red > distance_profile.ps

利用 SAC 命令 ``datagen sub tel *.z`` 生成多个波形，将其绘制在地图上::

    gmt pssac *.z -JM15c -R-120/-40/35/65 -Baf -M1i -S300c -K > map.ps
    saclst stlo stla f *.z | gmt psxy -J -R -St0.4c -Gblack -i1,2 -O >> map.ps