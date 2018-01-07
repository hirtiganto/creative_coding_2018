float angle = 0;

void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(255);
  float s = 70;
  cubes(s, new float[] {1, 0, 0});
  cubes(s / 2, new float[] {0, 1, 0});
  cubes(s / 5, new float[] {0, 0, 1});
  angle += 0.01;
  
  //if(angle <= TWO_PI) {
  //  saveFrame("frames/#####.png");
  //}
}

void cubes(float size, float[] angles) {
  pushMatrix();
  translate(width / 2, height / 2);
  
  rotateX(angles[0] * angle);
  rotateY(angles[1] * angle);
  rotateZ(angles[2] * angle);
  
  stroke(0);
  strokeWeight(2);
  
  translate(size * 2, -size * 2);
  box(size);
  
  for (int i = 0; i < 4; i++) {
    translate(-size, 0);
    box(size);
  }
  
  for (int i = 0; i < 4; i++) {
    translate(0, size);
    box(size);
  }
  
  for (int i = 0; i < 4; i++) {
    translate(size, 0);
    box(size);
  }
  
  for (int i = 0; i < 3; i++) {
    translate(0, -size);
    box(size);
  }
  
  popMatrix();
}