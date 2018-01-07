void setup() {
  size(600, 600, P3D);
  ortho();
}

void draw() {
  background(255);

  color c1 = color(239, 28, 102);
  color c2 = color(28, 196, 239);
  color c3 = color(49, 239, 28);
  oscillateBox(c1, 125, 200, 180, new float[] {1, 0, 0, 0});
  oscillateBox(c2, 125, 200, 180, new float[] {0, 1, 0, 60});
  oscillateBox(c3, 125, 200, 180, new float[] {0, 0, 1, 120});
  
  //if(frameCount <= 180 * 4) {
  //  saveFrame("frames/#####.png");
  //}
}

void oscillateBox(color c, float size, float a, float p, float[] offset) {
  pushMatrix();
  float off = a * cos(TWO_PI * (frameCount + offset[3]) / p);
  translate(width / 2, height / 2);
  rotateX(radians(-35.264));
  rotateY(-PI/4);
  
  translate(offset[0] * off, offset[1] * off, offset[2] * off);
  //noStroke();
  fill(c);
  strokeWeight(5);
  stroke(255);
  //noFill();
  box(size);

  popMatrix();
}