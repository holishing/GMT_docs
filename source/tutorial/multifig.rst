GMT多圖模式
===========

如果你想要在一個腳本中同時繪製多張圖，並且想要在多張圖之間來回切換，則需要使用
:doc:`/module/figure` 模塊。

:doc:`/module/figure` 的用法與 :doc:`/module/begin` 相同，唯一的區別在於，
你可以在 **gmt begin** 和 **gmt end** 中多次使用 **gmt figure** 來創建新圖，
或激活已有的圖。

下面的示例中，我們使用 **figure** 模塊在一個腳本中指定了兩張圖，並不斷在
兩張圖之間來回切換::

    gmt begin
        # 創建 Fig1 並在 Fig1 中繪圖
        gmt figure Fig1 png
        gmt basemap -R0/10/0/10 -JX10c -Baf

        # 創建 Fig2 並在 Fig2 中繪圖
        gmt figure Fig2 png
        gmt basemap -R0/5/0/5 -JX10c -Baf

        # 切換回 Fig1，並繪製圓圈
        gmt figure Fig1
        echo 5 5 | gmt plot -Sc1c -W2p

        # 切換回 Fig2，並繪製三角形
        gmt figure Fig2
        echo 1 2 | gmt plot -St1c -W1p
    gmt end show

最終會生成兩張圖，第一張圖中在底圖中繪製了圓圈，第二張圖中則在底圖中繪製了三角形。
