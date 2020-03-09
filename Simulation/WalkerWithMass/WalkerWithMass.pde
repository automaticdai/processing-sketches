
walker[] walkers = new walker[10];

void setup() {
  size(800, 600);
  for ( int i = 0; i < walkers.length; i++ ) {
    walkers[i] = new walker(random(0.1,5),0,0);
  }
  background(255);
}

void draw() {
  background(255);
  
  PVector gravity = new PVector(0, 0.1);
  PVector wind = new PVector(0.01,0);
  
  for ( int i = 0; i < walkers.length; i++ ) {
    PVector g_force = PVector.mult(gravity, walkers[i].mass);
    walkers[i].applyForce(g_force);
    walkers[i].applyForce(wind);
    walkers[i].update();
    walkers[i].display();
  }

}
