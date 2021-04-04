// Credit: 
// Koy - Generative Typography
// http://www.openprocessing.org/sketch/161029

int[] pixelMaskList;
PVector axis;
int distance;
PFont font;
int count, max;
String typedKey = "O";
PImage img;

String grey_map = "$@B%8&WM#*oahkbdpqwmZO0QLCJUYXzcvunxrjft/|()1{}[]?-_+~<>i!lI;:,\"^`'. ";

void setup() {
  colorMode(RGB,255,255,255);
  size(760, 506);
  smooth(16);
  frameRate(30);
  
  strokeCap(SQUARE);
  stroke(10);
  strokeWeight(0.2);
  
  fill(0);
  
  //font = createFont("schrift.otf", 200);
  //textFont(font);
  //textAlign(CENTER,CENTER);
  //textSize(400);
  //text(typedKey, width/2, height/2-20);
  
  // make mask from an image
  background(255,255,255);
  img = loadImage("img.jpg");
  image(img, 0, 0);
  
  pixelMaskList = new int[width*height];
  loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      color pb = pixels[y*width + x];
      //println(brightness(pb));
        pixelMaskList[y*width + x] = int(brightness(pb) / 4);  
     }
  }
  updatePixels();
}
 
void draw() {

  background(#FFFAF5);
  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      if (x % 5==0 && y % 5==0) {
        textSize(5);
        text(grey_map.charAt(pixelMaskList[y*width + x]), x, y);
      }
    }
  }
}
