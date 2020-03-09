class branch {
  
  float x, y, d_x, d_y;
  float t, k;
  float hue = 100;
  
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
    
    float signal = noise(t);
    float signal2 = noise(k);
    t += 0.01;
    k += 0.01;
    
    noStroke();
    colorMode(HSB, 100);
    fill(hue, 100, map(signal, 0, 1, 60, 80));
    
    if ( hue > 0 ) {
      hue -= 0.15;
    }
    
    /* if it is out of the screen, then stop */
    if ( abs(x) > width/2-10 || abs(y) > height/2-10   ) {
      // destory the object

    }
    else {
        p_dir = new PVector(d_x, d_y);
        p_dir.normalize();
    
        x = x + p_dir.x + map(signal,0,1,-1.1,1.1);
        y = y + p_dir.y + map(signal2,0,1,-1.1,1.1);
        
        ellipse(int(x), int(y), 1, 1);     
    }

  }

}