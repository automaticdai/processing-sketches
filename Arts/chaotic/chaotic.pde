float x, y, z, px, py, pz, sigma, rhy, beta;

void setup() {
  
  size(800, 800);
  background(255);
  
  x = 1;
  y = 1;
  z = 1;
  
  px = x;
  py = y;
  pz = z;
  
  // parameters for Lorenz system
  sigma = 10;
  rhy = 28;
  beta = 8.0 / 3;
  
}


void draw() {
  float dx = 0;
  float dy = 0;
  float dz = 0;
  
  dx = sigma * (y - x);
  dy = x * (rhy - z) - y;
  dz = x * y - beta * z;
  
  x += dx * 1.0/60;
  y += dy * 1.0/60;
  z += dz * 1.0/60;
   
  translate(width/2, height*4/5);
  scale(5);
  strokeWeight(1.0/5);
  line(x, -z, px, -pz);

  px = x;
  py = y;
  pz = z;
   
}