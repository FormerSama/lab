CGLine(float x1, float y1, float x2, float y2):
使用de Casteljau演算法 當控制點為p1(x1, y1) p2(x2, y2) t = 0.001 時可畫出所有經過線段p1,p2的點座標

CGCircle(float x, float y, float r):
以原點(0, 0)為圓心r為半徑得到30度圓弧上的點
<img width="1640" height="1275" alt="截圖 2025-08-26 晚上10 47 04 jpeg" src="https://github.com/user-attachments/assets/462e6d3a-3468-49d4-a9a4-a922c61b5140" />
再透過de Casteljau演算法畫出曲線 最後利用旋轉矩陣得到剩餘圓弧上的所有座標 再加上原本(x, y)的偏移量即為圓心在(x, y) 半徑=r 的圓

CGEllipse(float x, float y, float r1, float r2):

利用橢圓參數式得到橢圓軌跡上的點
<img width="573" height="270" alt="image" src="https://github.com/user-attachments/assets/8177ebba-c11a-486b-9a11-78b49d1d92e9" />

CGCurve(Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4)
<img width="974" height="172" alt="image" src="https://github.com/user-attachments/assets/9079ef2c-585a-4e32-bd5d-6ec170a635dd" />

CGEraser(Vector3 p1, Vector3 p2):
框內用for loop把座標都填上背景顏色

