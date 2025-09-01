private Vector3 de_Casteljau(ArrayList<Vector3> points, float t) {
  if (points.size() == 2) {
    Vector3 a, b;
    a = points.get(0).mult(t);
    b = points.get(1).mult(1.0 - t);
    return a.add(b);
    
  }else {
    Vector3 a, b;
    ArrayList<Vector3> next_lv = new ArrayList<Vector3>();
    
    for (int i = 0; i < points.size() - 1; i++) {
      a = points.get(i).mult(t);
      b = points.get(i+1).mult(1.0 - t);
      next_lv.add(a.add(b));
    }
    return de_Casteljau(next_lv, t);
  }
}
public void CGLine(float x1, float y1, float x2, float y2) {
  // TODO HW1
  // You need to implement the "line algorithm" in this section.
  // You can use the function line(x1, y1, x2, y2); to verify the correct answer.
  // However, remember to comment out before you submit your homework.
  // Otherwise, you will receive a score of 0 for this part.
  // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
  // coordinates (x, y).
  // For instance: drawPoint(114, 514, color(255, 0, 0)); signifies drawing a red
  // point at (114, 514).
  ArrayList<Vector3> points = new ArrayList<Vector3>();
  Vector3 v;
  points.add(new Vector3(x1, y1, 0));
  points.add(new Vector3(x2, y2, 0));
  float t = 0.001;
  int c = 0;
  
  for (float i = 0; i <= 1; i += t) {
    v = de_Casteljau(points, i);
    drawPoint(v.x(), v.y(), color(c));
   
  }
  return;
  /*
     stroke(0);
   noFill();
   line(x1,y1,x2,y2);
   */
}

public void CGCircle(float x, float y, float r) {
  // TODO HW1
  // You need to implement the "circle algorithm" in this section.
  // You can use the function circle(x, y, r); to verify the correct answer.
  // However, remember to comment out before you submit your homework.
  // Otherwise, you will receive a score of 0 for this part.
  // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
  // coordinates (x, y)
  ArrayList<Vector3> points = new ArrayList<Vector3>();
  
  Vector3 v;
  float t = 0.01, theta = (float)Math.PI / 6;
  int c = 0;
  
  for (float d = 0.0; d <= theta; d += 0.01) {
       points.add(new Vector3(r * cos(d), r * sin(d), 0));
  }
  for (float i = 0; i <= 1; i += t) {
    v = de_Casteljau(points, i);
    for (float j = 0; j <= 12; j++) {
      drawPoint(cos(theta*j)*v.x() - sin(theta*j)*v.y() + x, sin(theta*j)*v.x() + cos(theta*j)*v.y() + y, color(c));
    }
  }
  return;
  /*
    stroke(0);
   noFill();
   circle(x,y,r*2);
   */
}

public void CGEllipse(float x, float y, float r1, float r2) {
  // TODO HW1
  // You need to implement the "ellipse algorithm" in this section.
  // You can use the function ellipse(x, y, r1,r2); to verify the correct answer.
  // However, remember to comment out the function before you submit your homework.
  // Otherwise, you will receive a score of 0 for this part.
  // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
  // coordinates (x, y).
  float threshold = 0.00001, dx, dy;
  for (float t = (float)Math.PI * -1; t <= Math.PI; t += 0.01) {
      dx = x + r1 * cos(t);
      dy = y + r2 * sin(t);
  
      drawPoint(dx, dy, color(0));
  }
  /*
    stroke(0);
   noFill();
   ellipse(x,y,r1*2,r2*2);
   */
}

public void CGCurve(Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4) {
  // TODO HW1
  // You need to implement the "bezier curve algorithm" in this section.
  // You can use the function bezier(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x,
  // p4.y); to verify the correct answer.
  // However, remember to comment out before you submit your homework.
  // Otherwise, you will receive a score of 0 for this part.
  // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
  // coordinates (x, y).
  ArrayList<Vector3> points = new ArrayList<Vector3>();
  float t = 0.0001;
  Vector3 v;
  points.add(p1);
  points.add(p2);
  points.add(p3);
  points.add(p4);
  int c = 0;
  
  for (float i = 0; i <= 1; i += t) {
     v = de_Casteljau(points, i);
     drawPoint(v.x(), v.y(), color(c));
  }
  /*
    stroke(0);
   noFill();
   bezier(p1.x,p1.y,p2.x,p2.y,p3.x,p3.y,p4.x,p4.y);
   */
}

public void CGEraser(Vector3 p1, Vector3 p2) {
  // TODO HW1
  // You need to erase the scene in the area defined by points p1 and p2 in this
  // section.
  // p1 ------
  // |       |
  // |       |
  // ------ p2
  // The background color is color(250);
  // You can use the mouse wheel to change the eraser range.
  // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
  // coordinates (x, y).
  int c = 250;
  for (float i = p1.x(); i <= p2.x(); i++) {
    for (float j = p1.y(); j <= p2.y(); j++) {
      drawPoint(i, j, color(c));
    }
  }
}

public void drawPoint(float x, float y, color c) {
  stroke(c);
  point(x, y);
}

public float distance(Vector3 a, Vector3 b) {
  Vector3 c = a.sub(b);
  return sqrt(Vector3.dot(c, c));
}
