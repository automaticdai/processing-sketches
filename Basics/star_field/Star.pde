class Star{
  float x = random(-width, width);
  float y = random(-height, height);
  float z = random(0, 10);
  
  float r;
  
  void update() {
    z = z - 0.1;    
    if (z < 0) {
      z = random(0, 10);
    }
  }
  
  void show() {
    stroke(250);
    r = map(z, 0, 10, 5, 0.1);
    ellipse(x/z, y/z, r, r);
    stroke(60);
    line(x/z,y/z, x/(z * 1.1), y/(z * 1.1));
  }


}