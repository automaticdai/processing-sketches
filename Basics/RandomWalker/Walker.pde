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
	int xstep = int(random(3)) - 1;
	int ystep = int(random(3)) - 1;  
	x += xstep;
	y += ystep;
  }

}
