void setup() {
  size(800, 800);
  background(255);
}

float t = 0;

void draw() {
  float x1, y1, x2, y2;

  x1 = (100 + t) * sin(t*3);
  y1 = (100 + t) * cos(t*3);
  
  
  x2 = (10 + t) * sin(t);
  y2 = (10 + t) * cos(t);

  stroke(0, 30);
  translate(width/2, height/2);
  line(x1, y1, x2, y2);
  t += 0.1;
  
  if (keyPressed) {
    saveFrame();
  }
  
}