-n 選項
=======

**-n** 選項用於控制網格數據重採樣過程中的插值算法。其語法爲：

    **-n**\ [**b**\|\ **c**\|\ **l**\|\ **n**][**+a**][**+b**\ *BC*][**+c**][**+t**\ *threshold*]

網格插值的四種算法：

- **b** 表示B-sphine平滑算法
- **c** 表示使用bicubic插值算法（默認值）
- **l** 表示bilinear插值算法
- **n**  表示nearest-neighbor值

其它子選項:

- **+a**\ ：關閉抗混淆（僅在算法支持的前提下有效），默認打開抗混淆選項
- **+b**\ *BC* 設置網格的 :doc:`邊界條件 </grid/boundary-condition>`\ 。
  *BC* 可以取 **g**\ 、\ **p**\ 、\ **n**\ ，
  分別代表地理邊界條件、週期邊界條件和自然邊界條件。對於後兩種邊界條件，可以
  進一步加上 **x** 或 **y** 表示邊界條件僅對一個方向有效。比如 **-nb+bnxpy**
  表明X方向使用自然邊界條件，Y方向使用週期邊界條件
- **+c**\ ：假設原網格的Z值範圍爲 *zmin* 到 *zmax*\ ，插值後的網格範圍可能爲超過這一範圍，
  使用 **+c** 則將超過 *zmin* 和 *zmax* 的部分裁剪掉，以保證插值後的網格數據的範圍
  不超過輸入網格數據的範圍
- **+t**\ *threshold* 用於控制NaN網格點的插值行爲 [默認值爲0.5]
  A *threshold* of 1.0 requires all (4 or 16) nodes involved in
  interpolation to be non-NaN. 0.5 will interpolate about half way
  from a non-NaN value; 0.1 will go about 90% of the way, etc.
