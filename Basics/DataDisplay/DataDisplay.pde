static final int screen_x = 1024;
static final int screen_y = 768;
int cord_x = 0;
int cord_y = screen_y/2;

int step = 1;              
int datanum = 1000;          
float[] data = new float[datanum];

float[] data_noise = new float[datanum];
float[] data_filted = new float[datanum];


void initdata()
{
  // sin
  for (int i = 0; i < datanum; i++)
  {
    data[i] = 100.0*sin(i*2.0*PI/500.0);
  }
  // noise
  for (int i = 0; i < datanum; i++)
  {
    data_noise[i] = data[i] + 10*random(1);
  }
}

void setup()
{
  size(1024, 768, P2D);
  background(255);
  smooth();
  initdata();
}

void draw()
{

  stroke(0, 0, 255);
  for ( int i = 0; i < datanum; i++ ) 
  {
    displaypoint(i, data[i]);
  }

   stroke(255, 0, 0);
  for ( int i = 0; i < datanum; i++ ) 
  {
    displaypoint(i, data_noise[i]);
  }

}

void displaypoint(int x,float y)
{
  y = y*(-1) + screen_y/2; 
  if( x > screen_x)
 {
   return;
 } 
  point( x * step, y);
}