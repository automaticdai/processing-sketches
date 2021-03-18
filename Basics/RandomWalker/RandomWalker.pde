
walker w;
walker n;

void setup() {
  size(800, 600);
  w = new walker();
  n = new walker();
  background(255);
}

void draw() {
  w.step();
  w.display();
  
  n.step();
  n.display();

}
