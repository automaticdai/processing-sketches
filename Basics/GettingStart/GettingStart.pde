
void setup()
{
  size(800, 600);
  background(125);
  smooth();
  
  point(10, 10);
  point(20, 20);
  point(30, 30);
  
  line(80, 250, 420, 110);
  
  quad(158, 55, 199, 14, 392, 66, 351, 107);
  triangle(347, 54, 392, 9, 392, 66);
  triangle(158, 55, 290, 91, 290, 112);
  
  rect(380, 200, 220, 80);
  
  arc(90,  360, 40, 40, 0, HALF_PI);
  arc(190, 360, 50, 50, 0, PI+HALF_PI);
  arc(290, 360, 60, 60, PI, TWO_PI+HALF_PI);
  arc(390, 360, 70, 70, QUARTER_PI, PI+QUARTER_PI);
  
  print("this is a test");
}

void draw()
{
  stroke(255);
  if ( mousePressed )
  {
    //line(mouseX, mouseY, pmouseX, pmouseY);
    fill(255, 0, 0, 20);
    //fill(255) //means Grey
    ellipse(mouseX, mouseY, 80, 80);
  }
}
