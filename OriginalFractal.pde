float rotation = 0;
float s = 4;
boolean zoomOut = false;
HashMap<Integer, Hexagon> hexagons = new HashMap();

public void setup() {
  noFill();
  size(500, 500);
}

public void draw() {
  background(255);
  fractal(250, 250, 0);
}

public void fractal(float x, float y, int n) {
  stroke(random(255), random(255), random(255));

  if (n > 1000) {
    return;
  }
  
  pushMatrix();
  translate(x, y);
  scale(s);
  rotate(rotation + n * PI / 9);

  float[] line1 = new float[]{n, 0};
  float[] line2 = new float[]{ (n *0.5)  + 0,  (-(sqrt(3) / 2 * n))  + 0};
  float[] line3 = new float[]{ (- (n * 0.5))  + 0,  (-(sqrt(3) / 2 * n))  + 0};
  float[] line4 = new float[]{ (-n)  + 0, 0};
  float[] line5 = new float[]{ (-(n * 0.5))  + 0,  (sqrt(3) / 2 * n)  + 0};
  float[] line6 = new float[]{ (n * 0.5)  + 0,  (sqrt(3) / 2 * n)  + 0};
  
  beginShape();
  vertex(line1[0], line1[1]);
  vertex(line2[0], line2[1]);
  vertex(line3[0], line3[1]);
  vertex(line4[0], line4[1]);
  vertex(line5[0], line5[1]);
  vertex(line6[0], line6[1]);
  endShape(CLOSE);

  popMatrix();
  
  if (zoomOut) {
    s -= 0.01;
  } else {
    s += 0.01;
  }
  
  if (s < 0.07) {
    zoomOut = false;
  } else if (s > 5) {
    zoomOut = true;
  }
  
  rotation += PI / 3;
  
  fractal(x, y, n + 5);
}
