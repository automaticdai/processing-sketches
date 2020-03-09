Pendulum p = new Pendulum();

void setup() {
  size(800, 600);
}


void draw() {
  background(255);
  p.update();
  p.show();
  p.clicked();
}