class Star{
  // parameters:
  int Z_MAX = 10;
  int Z_MIN = 0;
  float RADIUS_MAX = 5;
  float RADIUS_MIN = 0.5;
  float SPEED = 0.02;
  
  float x = random(-width/2, width/2);
  float y = random(-height/2, height/2);
  float z = random(Z_MIN, Z_MAX);
  float r;
  float tail_factor = 1.0;
  float speed = SPEED;
  
  void update() {
    z = z - speed;
    
    if (z < 0) {
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      z = random(Z_MIN, Z_MAX);   // respawn a new star
    }
  }
  
  void show() {
    r = map(z, Z_MIN, Z_MAX, RADIUS_MAX, RADIUS_MIN);
    float f = map(z, Z_MIN, Z_MAX, 255, 200);
    fill(f);
    noStroke();
    ellipse(x/z, y/z, r, r);
    // the star tail (optional):
    // stroke(100);
    // line(x/z, y/z, x/(z*tail_factor), y/(z*tail_factor));
  }
}
