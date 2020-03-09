void setup(){
size(410, 410);
colorMode(HSB, 360);
}

void draw() {
  PImage img = createImage(20, 20, RGB);
  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    img.pixels[i] = color(random(200, 360), random(200, 360), 200); 
  }
  img.updatePixels();
  img.resize(400, 400);
  image(img, 5, 5);
}