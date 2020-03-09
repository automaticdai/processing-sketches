class walker {
  PVector speed;
  PVector position;
  PVector acceleration;
  int     radius;
  float   mass;
  
  walker(float m, float x, float y) {
    mass = m;
    radius = (int)(mass * 16);
    speed = new PVector(0, 0);
    position = new PVector(x, y);
    acceleration = new PVector(0, 0);
  }  
  
  void applyForce(PVector force) {
    PVector a = PVector.div(force, mass);
    acceleration.add(a);
  }
  
  void display() {
    stroke(0);
    fill(228);
    ellipse(position.x, position.y, radius * 2, radius * 2); 
  }
  
  void update() {
    
    speed.add(acceleration);
    position.add(speed);
    acceleration.mult(0);
    
    checkEdge();
  }
  
  void checkEdge() {
    if ( position.x  + radius > width ) {
        speed.x = -0.8*speed.x;
        position.x = width - radius;
    }
    if ( position.x  - radius < 0 ) {
        position.x = radius;
    }
    if (position.y  + radius > height ) {
        speed.y = -0.8*speed.y;
        position.y = height - radius;
    }
    if ( position.y  - radius < 0 ) {
        position.y = radius;
    }
  }
}
