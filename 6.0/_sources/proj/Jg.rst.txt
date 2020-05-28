-Jg：正交投影
=============

正交方位投影是一種從無窮遠距離處的透視投影，因而常用於繪製從外太空看地球。
與Lambert等面積投影以及立體投影類似，一次只能看到一個半球。
該投影既不是等面積也不是保角，在半球邊界處有較大得畸變。
從投影中心出發的任意方向是真實的。

該投影的參數爲：

**-JG**\ *lon*/*lat*\ [/*distance*]/*width*
或
**-Jg**\ *lon*/*lat*\ [/*distance*]/*scale*

- *lon*/*lat* 是投影中心位置
- *distance* 是邊界離投影中心的度數，默認值爲90
- *scale* 地圖比例尺 1:*xxxx* 或 *radius*/*latitude*
  （\ *radius* 是緯線 *latitude* 與投影中心在圖上的距離）

.. gmtplot::
    :caption: 使用正交投影繪製半球
    :width: 60%

    gmt coast -Rg -JG-75/41/4.5i -Bg -Dc -A5000 -Gpink -Sthistle -png GMT_orthographic

**-Jg** 加上更多的參數時還可以用於繪製透視投影，以在二維平面內模擬從太空看三維的地球。
具體的參數爲：

**-JG**\ *lon*/*lat*/*alt*/*az*/*tilt*/*twist*/*width*/*height*

- *lon*/*lat* 投影中心的經緯度
- *alt* 是觀察者所處的海拔，單位爲km。若該值小於10，則假定是觀察者相對於
  地心的距離，若距離後加了 **r**\ ，則表示觀察者與地心的距離（單位爲km）。
- *az* 觀察者的方位角，默認值爲90度，即從東向觀測
- *tilt* 傾角（單位爲度），默認值爲60度。若值爲0則表示在頂點直接向下看，
  值爲60則表示在頂點處沿着水平方向30度角的方向觀察
- *twist* 扭轉角度，默認值爲180度。
  This is the boresight rotation (clockwise) of the image.
  The twist of 180° in the example mimics the fact that the Space Shuttle flies upside down.
- *width*/*height* 是視角的角度，單位爲度，默認值爲60。
  This number depends on whether you are looking with the naked eye
  (in which case you view is about 60° wide), or with binoculars, for example.
- *scale* as 1:xxxxx or as radius/latitude where radius is distance on map
  in inches from projection center to a particular oblique latitude

.. gmtplot::
    :caption: 透視投影
    :width: 75%

    gmt coast -Rg -JG4/52/230/90/60/180/60/60/5i -Bx2g2 -By1g1 -Ia -Di -Glightbrown \
                -Wthinnest -Slightblue --MAP_ANNOT_MIN_SPACING=0.25i -png GMT_perspective
