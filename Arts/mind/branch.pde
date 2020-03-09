class branch {
  
  float x, y, d_x, d_y;
  float t, k;
  
  branch(float _dx, float _dy) {
    x = 0;
    y = 0;
    t = random(1000);
    k = random(1000);
    d_x = _dx;
    d_y = _dy;
  }
  
  
  void refresh() {
    PVector p_dir;
    noStroke();
    float signal = noise(t);
    float signal2 = noise(k);
    t += 0.01;
    k += 0.01;
    
    colorMode(HSB, 100);
    fill(35, 90, map(signal, 0, 1, 60, 80));
    
    p_dir = new PVector(d_x, d_y);
    p_dir.normalize();
    
    x = x + p_dir.x + map(signal,0,1,-1.1,1.1);
    y = y + p_dir.y + map(signal2,0,1,-1.1,1.1);
    
    ellipse(int(x), int(y), 1, 1);
    
    if ( x > width || x < 0 || y > height || y < 0 ) {
      // destory the object
    }
  }




}
