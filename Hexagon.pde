public class Hexagon {
  private float x;
  private float y;
  private float radius;
  private color lineColor;
  private float scale = 1;
  private float xOffset = 0;
  private float yOffset = 0;
  private float rotation = 0;
  private boolean lerp = false;
  private color startingColor;
  private color endingColor;
  private int lerpTick = 0;
  private int lerpMaxTick = 1;
  
  public Hexagon(float x, float y, float radius, color lineColor) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.lineColor = lineColor;
    startingColor = lineColor;
    endingColor = lineColor;
  }
  
  public void show() {
    if (lerp) {
      lineColor = lerpColor(startingColor, endingColor, lerpTick / lerpMaxTick);
      lerpTick++;
    }
    
    if (lerpTick > lerpMaxTick) {
      lerp = false;
      lerpTick = 0;
      lerpMaxTick = 1;
      startingColor = lineColor;
      endingColor = lineColor;
    }
    
    float[] line1 = new float[]{x + (radius) * scale + xOffset, y * scale + yOffset};
    float[] line2 = new float[]{x + ((radius * 0.5)) * scale + xOffset, y + (-(sqrt(3) / 2 * radius)) * scale + yOffset};
    float[] line3 = new float[]{x + (- (radius * 0.5)) * scale + xOffset, y + (-(sqrt(3) / 2 * radius)) * scale + yOffset};
    float[] line4 = new float[]{x + (-radius) * scale + xOffset, y * scale + yOffset};
    float[] line5 = new float[]{x + (-(radius * 0.5)) * scale + xOffset, y + (sqrt(3) / 2 * radius) * scale + yOffset};
    float[] line6 = new float[]{x + (radius * 0.5) * scale + xOffset, y + (sqrt(3) / 2 * radius) * scale + yOffset};
    
    
    pushMatrix();
    stroke(lineColor);
    beginShape();
    rotate(rotation);
    
    vertex(line1[0], line1[1]);
    vertex(line2[0], line2[1]);
    vertex(line3[0], line3[1]);
    vertex(line4[0], line4[1]);
    vertex(line5[0], line5[1]);
    vertex(line6[0], line6[1]);
    
    endShape(CLOSE);
    popMatrix();
  }
  
  public void scale(float scale) {
    this.scale = scale;
  }
  
  public void translate(float xOffset, float yOffset) {
    this.xOffset = xOffset;
    this.yOffset = yOffset;
  }
  
  public void rotate(float rotation) {
    this.rotation = rotation;
  }
  
  public void setColor(color lineColor) {
    this.lineColor = lineColor;
  }
  
  public color getColor() {
    return lineColor;
  }
  
  public void startLerpColor(color newColor, int maxTicks) {
    lerp = true;
    startingColor = lineColor;
    endingColor = newColor;
    lerpMaxTick = maxTicks;
  }
}
