.. _grid-registration:

網格配準
========

GMT中的2D網格檔，在確定了網格範圍和網格間隔後，網格線會出現在
:math:`x = x_{min}, x_{min} + x_{inc}, x_{min} + 2 \cdot x_{inc}, \ldots, x_{max}`
和 :math:`y = y_{min}, y_{min} + y_{inc}, y_{min} + 2 \cdot y_{inc}, \ldots, y_{max}` 處。
而節點的位置有兩種選擇，即網格線配準（gridline registration）和像素配準（pixel registration）。
GMT默認使用的是網格線配準方式。

.. gmtplot:: /scripts/GMT_grid_registration.sh
   :show-code: false

   GMT網格配準方式

   （左）網格線配準；（右）像素配準。

.. note::

   大多數原始觀測數據都採樣網格線配準方式，而有時經過處理的數據會以像素配準
   方式發佈。儘管兩種配準方式可以互相轉換，但轉換過程中會降低Nyquist採樣率，
   壓制一些高頻信息。因而如果你可以控制，應儘量避免配準轉換。

網格線配準
----------

在網格線配準方式下，節點（圖中黑色圓圈）中心位於網格線的交叉點處，節點的值代表
了長寬爲 :math:`x_{inc} \cdot y_{inc}` 的單元（圖中紅色區域）內的平均值。
這種情況下，節點數目與網格範圍和間隔的關係爲：

.. math::

   \begin{array}{ccl}
   nx & =  &       (x_{max} - x_{min}) / x_{inc} + 1       \\
   ny & =  &       (y_{max} - y_{min}) / y_{inc} + 1
   \end{array}

左圖中nx=ny=4。

像素配準
--------

在像素配準方式下，節點（圖中黑色圓圈）位於網格單元的中心，即網格點之間的區域，
節點的值代表了每個單元（圖中紅色區域）內的平均值。在這種情況下，節點數目與
網格範圍和間隔的關係爲：

.. math::

   \begin{array}{ccl}
   nx & =  &       (x_{max} - x_{min}) / x_{inc}   \\
   ny & =  &       (y_{max} - y_{min}) / y_{inc}
   \end{array}

因而，對於相同的網格區域和網格間隔而言，像素配準比網格線配準要少一列和一行數據。
右圖中nx=ny=3。
