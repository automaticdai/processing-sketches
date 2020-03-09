
Databar[] bar = new Databar[90];
PVector origin;
Pointer hour_pointer;
Pointer min_pointer;
Pointer sec_pointer;

void setup()  {
  size( 800, 600, P3D);
  origin = new PVector(width/2, height/2);
  hour_pointer = new Pointer( origin, 90 );
  min_pointer = new Pointer( origin, 130 );
  
  for ( int i = 0; i < bar.length; i++ ) {
      PVector v_pos = new PVector(origin.x + 200 * cos(2*PI/bar.length * i), 
                                  origin.y + 200 * sin(2*PI/bar.length * i));
      bar[i] = new Databar(v_pos, int(random(100)+50));   
  }
}


float angle = 0;
float angle2 = 0;

void draw() {
  
  background(230);
  
  fill(0);
  ellipse(origin.x, origin.y, 5, 5);
  hour_pointer.display(angle);
  min_pointer.display(angle2);
  
  angle += 0.05;
  angle2 += 3;
  
  for ( int i = 0; i < bar.length; i++ ) { 
    bar[i].show();
  }
  
  
  //rotateX(mouseX);
  //rotateY(mouseY);
  
}