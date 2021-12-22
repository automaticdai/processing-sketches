Pendulum p;

void setup() {
  size(600, 400);
  p = new Pendulum();
}


void draw() {
  background(255);
  p.update();
  p.show();
  p.clicked();
}
