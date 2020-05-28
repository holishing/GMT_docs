.. index:: ! gmtconnect

gmtconnect
==========

:官方文件: :doc:`gmt:gmtconnect`
:簡介: 將端點接近的線段連接起來

該命令會讀入一個或多個多段數據，並檢查所有線段的兩個端點。若某對端點完全相同
或者二者的距離在可容忍的範圍內，則將兩段線段連接成一條線段。該進程會一直重複，
直到剩餘的端點均不在可容忍的範圍內。最終連接得到的線段會被寫到終端或特定的
輸出文件中。

若不清楚該如何確定可容忍範圍值，可以使用 ``-L`` 選項，獲得所有端點之間的距離的
列表，通過分析該列表來得到合適的值。

選項
----

``-C[<closed>]``
    將所有閉合多邊形寫到文件 ``<closed>`` （默認文件名爲 ``gmtconnect_closed.txt`` ）i
    中並將其他數據段寫到標準輸出。

    使用該選項不會對線段做連接。

``-D[<template>]``
    對於多段數據文件，將每段數據分別輸出到不同的數據文件中。

    ``<template>`` 是文件名的模板，該模板中必須包含一個整型參數的格式，比如
    ``%d`` 或 ``%08d`` ，也可以在整型參數格式前加上字符參數格式 ``%c`` ，實際
    輸出時會被C或O代替，分別表示closed和open。

    默認的模板爲 ``gmtconnect_segment_%d.txt`` 。

``-L[<linkfile>]``
    將連接信息寫到指定的文件中，默認文件名爲 ``gmtconnect_link.txt`` 。

    對於每段數據而言，會寫入原始的數據段ID；對於線段的起始點和終點而言，會報告
    離得最近的線段的ID，以及兩個線段端點之間的距離。

``-Q[<template>]``
    Used with **-D** to a list file with the names of the individual
    output files. Optionally, append a filename template for the
    individual file names; this template **may** contain a C format
    specifier that can format an character (C or O for closed or open,
    respectively). [Default is gmtconnect_list.txt].

``-T[<cutoff>[<unit>]][/<nn_dist>]``
    Specifies the separation tolerance in the data coordinate units [0];
    append distance unit (see UNITS). If two lines has end-points that
    are closer than this cutoff they will be joined. Optionally, append
    /*nn_dist* which adds the requirement that a link will only be made
    if the second closest connection exceeds the *nn_dist*. The latter
    distance must be given in the same units as *cutoff*.  However, if
    no arguments are given then we close every polygon regardless of
    the gap between first and last point.

示例
----

::

    gmt connect segment_*.txt -Tf0.1 > new_segments.txt

::

    gmt connect my_lines.txt -T150e -DMap_segment_%04d.dat
