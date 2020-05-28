.. index:: ! fitcircle

fitcircle
=========

:官方文檔: :doc:`gmt:fitcircle`
:簡介: 擬合球面上數據點的平均位置及圓弧

該命令從輸入數據的前兩列讀取經緯度數據，將其轉換爲單位球面上的笛卡爾三維矢量，
然後計算輸入座標數據的平均位置以及可以擬合這些座標點的大圓路徑的pole。

必選選項
--------

``<table>``
    輸入數據

``-L<norm>``

    - ``-L1`` 解法1
    - ``-L2`` 解法2
    - ``-L`` 或 ``-L3`` 同時輸出解法1和解法2的結果

    在計算輸入座標的均值和大圓弧pole時有兩種計算方法，分別用 ``-L1`` 和 ``-L2``
    表示。當數據沿着某個大圓弧且距離接近時，兩組解結果相似。若數據較分散，
    則大圓弧的pole要比均值不精確得多。此時可以比較兩組結果以作爲相互的驗證。

    The **-L1** solution is so called because it approximates the
    minimization of the sum of absolute values of cosines of angular
    distances. This solution finds the mean position as the Fisher average
    of the data, and the pole position as the Fisher average of the
    cross-products between the mean and the data. Averaging cross-products
    gives weight to points in proportion to their distance from the mean,
    analogous to the "leverage" of distant points in linear regression in the plane.

    The **-L2** solution is so called because it approximates the
    minimization of the sum of squares of cosines of angular distances. It
    creates a 3 by 3 matrix of sums of squares of components of the data
    vectors. The eigenvectors of this matrix give the mean and pole
    locations. This method may be more subject to roundoff errors when there
    are thousands of data. The pole is given by the eigenvector
    corresponding to the smallest eigenvalue; it is the least-well
    represented factor in the data and is not easily estimated by either method.

選項
----

``-Ff|m|n|s|c``
    控制輸出格式。

    正常情況下，該命令會將計算結果以較複雜的形式輸出。使用 ``-F`` 選項，則只
    返回簡單的座標。 ``-F`` 後可以加上其他修飾符以指定要返回的座標：

    - ``f`` Flat Earth mean location
    - ``m`` mean location
    - ``n`` north pole of great circle
    - ``s`` south pole of great circle
    - ``c`` pole of small circle and its colatitude, which requires ``-S``

``-S[<lat>]``
    擬合小圓弧而不是大圓弧

    The pole will be constrained to lie on the great circle connecting the pole
    of the best-fit great circle and the mean location of the data.
    Optionally append the desired fixed latitude of the small circle
    [Default will determine the latitude].

示例
----

如下命令，用兩種計算方法擬合了數據的大圓弧路徑和小圓弧路徑，並藉助 :doc:`project`
生成路徑座標。

.. gmtplot:: /scripts/fitcircle_ex1.sh

   fitcircle示例
