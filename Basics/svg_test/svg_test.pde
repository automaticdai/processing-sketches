PShape p;

void setup() {
  size(400,400);
  p = loadShape("bone.svg");
  p.scale(20);
}

float angle = 0;
void draw() {
  background(255);
  translate(width/2, height/2);
  
  p.resetMatrix();
  p.rotate(angle);
  p.translate(-p.width/2, -p.height/2);
  angle += 0.02;
  shape(p);
  
}