
void setup() {
  size(800, 600);
}

float t = 0;

void draw() {
  float x_n = noise(t);
  float x = map(x_n,0,1,0,width);
  ellipse(x,180,16,16);
  
  t += 0.01;
  
}
