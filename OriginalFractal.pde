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
  if (n > 5000) {
    return;
  }
  
  if (!hexagons.containsKey(n)) {
    hexagons.put(n, new Hexagon(0, 0, n, color(random(255), random(255), random(255))));
  }
  
  pushMatrix();
  translate(x, y);
  scale(s);
  rotate(rotation + n * PI / 9);

  hexagons.get(n).show();
  popMatrix();
  
  if (zoomOut) {
    s -= 0.00001;
  } else {
    s += 0.00001;
  }
  
  if (s < 0.07) {
    randomizeColors();
    zoomOut = false;
  } else if (s > 5) {
    zoomOut = true;
  }
  
  rotation += TWO_PI;
  
  fractal(x, y, n + 10);
}

public void randomizeColors() {
  for (int i = 0; i <= 5000; i += 10) {
    Hexagon hexagon = hexagons.get(i);
    hexagon.startLerpColor(color(random(255), random(255), random(255)), 100);
  }
}
