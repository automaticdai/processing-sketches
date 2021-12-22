
void setup() {
  size(800, 600);
}

float delta  = 0;
void draw() {
  
  loadPixels();
  
  float xoff = 0;
 
  for (int x = 0; x < width; x++) {
      float yoff = 0;
    for (int y = 0; y < height; y++) {
      float bright = map(noise(xoff + delta,yoff),0,1,0,255);
      pixels[x+y*width] = color(bright);
      yoff += 0.02;  
    }
    xoff += 0.02;
  }
  updatePixels();
  delta += 0.01;
}
