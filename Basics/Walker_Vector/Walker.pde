class walker {
  PVector speed;
  PVector position;
  PVector acceleration;
  int radius = 10;
  int maxSpeed = 10;
  
  walker() {
    speed = new PVector(0.1, 0.1);
    position = new PVector(width/2, height/2);
    acceleration = new PVector(0, 0);
  }  
  
  void display() {
    stroke(0);
    fill(228);
    ellipse(position.x, position.y, radius * 2, radius * 2); 
  }
  
  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector diy = PVector.sub(mouse, position);
    diy.normalize();
    float mag = 1 / diy.magSq();
    diy.setMag(mag);
    
    acceleration = diy;
    
    speed.add(acceleration);
    speed.limit(maxSpeed);
    
    position.add(speed);
    checkEdge();
  }
  
  void checkEdge() {
    if ( position.x  + radius > width ) {
        position.x = width - radius;
    }
    if ( position.x  - radius < 0 ) {
        position.x = radius;
    }
    if (position.y  + radius > height ) {
        position.y = height - radius;
    }
    if ( position.y  - radius < 0 ) {
        position.y = radius;
    }
  }
}
