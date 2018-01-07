float angle = 0.0;
boolean ortho;

void setup() {
  size(600, 600, P3D);
  ortho = true;
  ortho();
}

void draw() {
  pushMatrix();
  translate(width / 2, height / 2);

  rotateX(radians(-35.264));
  rotateY(-PI/4);
  rotateZ(angle/10);
  
  //rotateX(angle);
  //rotateY(angle);

  background(244, 220, 66);

  for (float size = 300; size > 50; size -= 50) {
    noFill();
    strokeWeight(3);
    stroke(255);
    
    if (size == 100) {
      fill(255);
      strokeWeight(6);
      stroke(0);
    }
    box(size * sin((angle + size*size) / 4) );
  }

  popMatrix();

  angle += 0.08;
  
  //if (angle / 10 <= TWO_PI) {
  //  saveFrame("frames/#####.png");
  //}
}

void mousePressed() {
  if (!ortho) {
    ortho = true;
    ortho();
  } else {
    ortho = false;
    perspective();
  }
}