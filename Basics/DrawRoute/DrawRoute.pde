
int x1,y1;

void setup()
{
  size(800,600,P3D);
  background(255);
  smooth();
  
  x1 = 0;
  y1 = 0;
}


void draw()
{
  stroke(150);  
  if ( mousePressed )
  {
    line(x1,y1,mouseX,mouseY);
    x1 = mouseX;
    y1 = mouseY;
  }
  
  
}