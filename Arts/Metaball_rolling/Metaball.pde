class Metaball {
  PVector loc;
  PVector vel;
  
  Metaball(PVector loc_, PVector vel_) {
    loc = loc_.copy();
    vel = vel_.copy();
  }
  
  void show() {
    ;
  }
  
  void update() {
    loc.add(vel);
    
    if (loc.x > width || loc.x < 0) {
      vel.x *= -1;
    }
    
    if (loc.y > height || loc.y < 0) {
      vel.y *= -1;
    }
  }
  
}