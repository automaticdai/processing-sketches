class walker {
  int x;
  int y;

  walker() {
    x = width / 2;
    y = height / 2;
  
  }  
  
  void display() {
    stroke(0);
    point(x,y); 
  }
  
  void step() {
    float r = random(1);
    int xdelta = 0;
    int ydelta = 0;
    
    if ( mouseX > x ) {
      xdelta = 2;
    }
    else {
      xdelta = -2;
    }
    
    if ( mouseY > y ) {
      ydelta = 2;
    }
    else {
      ydelta = -2;
    }    
    
    if ( r < 0.4 ) {
      x = x + xdelta;
    } else if ( r < 0.5 ) {
      x = x - xdelta;
    } else if ( r < 0.9 ) {
      y = y + ydelta;
    } else {
      y = y - ydelta;
    }
//    int xstep = int(random(3)) - 1;
//    int ystep = int(random(3)) - 1;  
//    x += xstep;
//    y += ystep;
  }

}
