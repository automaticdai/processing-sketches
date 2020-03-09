
walker[] walkers = new walker[10];

Liquid liquid;

void setup() {
  size(800, 600);
  for ( int i = 0; i < walkers.length; i++ ) {
    walkers[i] = new walker(random(0.5,3),random(width),0);
  }
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
  background(255);
}


void draw() {
  background(255);
  
  PVector wind = new PVector(0.01,0);
  
  liquid.display();
  
  for ( int i = 0; i < walkers.length; i++ ) {
    PVector gravity = new PVector(0,0.1*walkers[i].mass);
    walkers[i].applyForce(gravity);
 //   walkers[i].applyForce(wind);
    if ( walkers[i].isInside(liquid) ) {
      walkers[i].drag(liquid);
      PVector lift = new PVector(0,-0.3);
      walkers[i].applyForce(lift);
    }
    walkers[i].update();
    walkers[i].display();
    
  }
}
