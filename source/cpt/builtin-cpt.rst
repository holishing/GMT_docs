內置CPT
=======

GMT內置了一個分類型CPT和幾十個常規型CPT文件。這一節僅展示GMT內置CPT的配色，
具體如何使用這些內置CPT文件會在後面做進一步介紹。

下面列出了GMT內置的若干個CPT文件的具體配色以及CPT文件名（位於圖下方）。
每張圖中有兩個色標，上面的色標是原始的CPT文件，可以使用如下命令繪製得到::

    gmt colorbar -D0c/0c+w10c/1c+h -B0 -C<cpt> -pdf CPT

下面的色標是利用 :doc:`/module/makecpt` 對原始CPT文件做離散處理得到的單色型
CPT文件，可以用如下命令繪製得到::

    gmt begin CPT png,pdf
    gmt makecpt -C<cpt> -T-1/1/0.25
    gmt colorbar -C -D0c/0c+w10c/1c+h -B0
    gmt end

+--------------------------------+--------------------------------+
| .. figure:: cpt/abyss.*        | .. figure:: cpt/bathy.*        |
|    :align: center              |    :align: center              |
|                                |                                |
|    abyss                       |    bathy                       |
+--------------------------------+--------------------------------+
| .. figure:: cpt/batlow.*       | .. figure:: cpt/berlin.*       |
|    :align: center              |    :align: center              |
|                                |                                |
|    batlow                      |    berlin                      |
+--------------------------------+--------------------------------+
| .. figure:: cpt/bilbao.*       | .. figure:: cpt/broc.*         |
|    :align: center              |    :align: center              |
|                                |                                |
|    bilbao                      |    broc                        |
+--------------------------------+--------------------------------+
| .. figure:: cpt/categorical.*  | .. figure:: cpt/cool.*         |
|    :align: center              |    :align: center              |
|                                |                                |
|    categorical                 |    cool                        |
+--------------------------------+--------------------------------+
| .. figure:: cpt/copper.*       | .. figure:: cpt/cork.*         |
|    :align: center              |    :align: center              |
|                                |                                |
|    copper                      |    cork                        |
+--------------------------------+--------------------------------+
| .. figure:: cpt/cubhelix.*     | .. figure:: cpt/cyclic.*       |
|    :align: center              |    :align: center              |
|                                |                                |
|    cubhelix                    |    cyclic                      |
+--------------------------------+--------------------------------+
| .. figure:: cpt/davos.*        | .. figure:: cpt/dem1.*         |
|    :align: center              |    :align: center              |
|                                |                                |
|    davos                       |    dem1                        |
+--------------------------------+--------------------------------+
| .. figure:: cpt/dem2.*         | .. figure:: cpt/dem3.*         |
|    :align: center              |    :align: center              |
|                                |                                |
|    dem2                        |    dem3                        |
+--------------------------------+--------------------------------+
| .. figure:: cpt/dem4.*         | .. figure:: cpt/drywet.*       |
|    :align: center              |    :align: center              |
|                                |                                |
|    dem4                        |    drywet                      |
+--------------------------------+--------------------------------+
| .. figure:: cpt/earth.*        | .. figure:: cpt/elevation.*    |
|    :align: center              |    :align: center              |
|                                |                                |
|    earth                       |    elevation                   |
+--------------------------------+--------------------------------+
| .. figure:: cpt/etopo1.*       | .. figure:: cpt/gebco.*        |
|    :align: center              |    :align: center              |
|                                |                                |
|    etopo1                      |    gebco                       |
+--------------------------------+--------------------------------+
| .. figure:: cpt/geo.*          | .. figure:: cpt/globe.*        |
|    :align: center              |    :align: center              |
|                                |                                |
|    geo                         |    globe                       |
+--------------------------------+--------------------------------+
| .. figure:: cpt/gray.*         | .. figure:: cpt/grayC.*        |
|    :align: center              |    :align: center              |
|                                |                                |
|    gray                        |    grayC                       |
+--------------------------------+--------------------------------+
| .. figure:: cpt/hawaii.*       | .. figure:: cpt/haxby.*        |
|    :align: center              |    :align: center              |
|                                |                                |
|    hawaii                      |    haxby                       |
+--------------------------------+--------------------------------+
| .. figure:: cpt/hot.*          | .. figure:: cpt/ibcso.*        |
|    :align: center              |    :align: center              |
|                                |                                |
|    hot                         |    ibcso                       |
+--------------------------------+--------------------------------+
| .. figure:: cpt/inferno.*      | .. figure:: cpt/jet.*          |
|    :align: center              |    :align: center              |
|                                |                                |
|    inferno                     |    jet                         |
+--------------------------------+--------------------------------+
| .. figure:: cpt/lajolla.*      | .. figure:: cpt/lapaz.*        |
|    :align: center              |    :align: center              |
|                                |                                |
|    lajolla                     |    lapaz                       |
+--------------------------------+--------------------------------+
| .. figure:: cpt/lisbon.*       | .. figure:: cpt/magma.*        |
|    :align: center              |    :align: center              |
|                                |                                |
|    lisbon                      |    magma                       |
+--------------------------------+--------------------------------+
| .. figure:: cpt/nighttime.*    | .. figure:: cpt/no_green.*     |
|    :align: center              |    :align: center              |
|                                |                                |
|    nighttime                   |    no_green                    |
+--------------------------------+--------------------------------+
| .. figure:: cpt/ocean.*        | .. figure:: cpt/oleron.*       |
|    :align: center              |    :align: center              |
|                                |                                |
|    ocean                       |    oleron                      |
+--------------------------------+--------------------------------+
| .. figure:: cpt/oslo.*         | .. figure:: cpt/paired.*       |
|    :align: center              |    :align: center              |
|                                |                                |
|    oslo                        |    paired                      |
+--------------------------------+--------------------------------+
| .. figure:: cpt/panoply.*      | .. figure:: cpt/plasma.*       |
|    :align: center              |    :align: center              |
|                                |                                |
|    panoply                     |    plasma                      |
+--------------------------------+--------------------------------+
| .. figure:: cpt/polar.*        | .. figure:: cpt/rainbow.*      |
|    :align: center              |    :align: center              |
|                                |                                |
|    polar                       |    rainbow                     |
+--------------------------------+--------------------------------+
| .. figure:: cpt/red2green.*    | .. figure:: cpt/relief.*       |
|    :align: center              |    :align: center              |
|                                |                                |
|    red2green                   |    relief                      |
+--------------------------------+--------------------------------+
| .. figure:: cpt/roma.*         | .. figure:: cpt/seafloor.*     |
|    :align: center              |    :align: center              |
|                                |                                |
|    roma                        |    seafloor                    |
+--------------------------------+--------------------------------+
| .. figure:: cpt/sealand.*      | .. figure:: cpt/seis.*         |
|    :align: center              |    :align: center              |
|                                |                                |
|    sealand                     |    seis                        |
+--------------------------------+--------------------------------+
| .. figure:: cpt/split.*        | .. figure:: cpt/srtm.*         |
|    :align: center              |    :align: center              |
|                                |                                |
|    split                       |    srtm                        |
+--------------------------------+--------------------------------+
| .. figure:: cpt/terra.*        | .. figure:: cpt/tofino.*       |
|    :align: center              |    :align: center              |
|                                |                                |
|    terra                       |    tofino                      |
+--------------------------------+--------------------------------+
| .. figure:: cpt/tokyo.*        | .. figure:: cpt/topo.*         |
|    :align: center              |    :align: center              |
|                                |                                |
|    tokyo                       |    topo                        |
+--------------------------------+--------------------------------+
| .. figure:: cpt/turku.*        | .. figure:: cpt/vik.*          |
|    :align: center              |    :align: center              |
|                                |                                |
|    turku                       |    vik                         |
+--------------------------------+--------------------------------+
| .. figure:: cpt/viridis.*      | .. figure:: cpt/world.*        |
|    :align: center              |    :align: center              |
|                                |                                |
|    viridis                     |    world                       |
+--------------------------------+--------------------------------+
| .. figure:: cpt/wysiwyg.*      |                                |
|    :align: center              |                                |
|                                |                                |
|    wysiwyg                     |                                |
+--------------------------------+--------------------------------+

GMT內置CPT文件中，某些是針對特定的需求設計的，因而常用於特定的圖件中：

#. 海深：abyss、bathy、gebco、ibcso
#. 陸地高程：elevation
#. 全球地形起伏：dem1、dem2、dem3、dem4、earth、etopo1、geo、globe、oleron
   relief、terra、topo、world
#. 地震成像：seis、polar
#. 分類型數據：categorical
