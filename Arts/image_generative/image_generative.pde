// Credit: 
// Koy - Generative Typography
// http://www.openprocessing.org/sketch/161029

ArrayList<Particle> particles;
int[] pixelMaskList;
PVector axis;
int distance;
PFont font;
int count, max;
String typedKey = "O";
PImage img;

void setup() {
  colorMode(RGB,255,255,255);
  size(800,600);
  smooth(16);
  frameRate(30);
  
  
  strokeCap(SQUARE);
  stroke(10);
  strokeWeight(0.2);
  
  distance = 20;
  particles = new ArrayList<Particle>();
  count = 0;
  max = 1000;
  
  fill(0);
  
  //font = createFont("schrift.otf", 200);
  //textFont(font);
  //textAlign(CENTER,CENTER);
  //textSize(400);
  //text(typedKey, width/2, height/2-20);
  
  // make mask from an image
  background(255,255,255);
  img = loadImage("apple.jpg");
  image(img, 0, 0);
  
  pixelMaskList = new int[width*height];
  loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      color pb = pixels[y*width + x];
      if (brightness(pb) < 50) {  
        pixelMaskList[y*width + x] = 0;  
      }
      else {  
        pixelMaskList[y*width + x] = 1;
      }
     }
  }
  updatePixels();
}
 
void draw() {
  // particles generator
  if (count < max) {
    int i = 0;
    while(i < 3) {
        axis = new PVector(int(random(width)),int(random(height)));
        if(pixelMaskList[int(axis.y*width+axis.x)]==0 && pixelMaskList[int(axis.y*width+axis.x+1)]==0 &&
        pixelMaskList[int(axis.y*width+axis.x-1)]==0 && pixelMaskList[int((axis.y+1)*width+axis.x)]==0 &&
        pixelMaskList[int((axis.y+1)*width+axis.x)]==0){
          particles.add(new Particle(axis.x,axis.y));
          i++;
          count++;
      }
    }
  }
   
  background(#FFFAF5);
  
  // plot all particles
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.update();
    for(int j = i+1; j < particles.size(); j++) {
      Particle pp = particles.get(j);
      if (dist(p.location.x, p.location.y, pp.location.x, pp.location.y) < distance) {
        line(p.location.x, p.location.y, pp.location.x, pp.location.y);
      }
    }
  }
}
 
//void keyReleased(){
//      if (key != CODED && key != ' ' && key != TAB && key != ENTER && key != RETURN) {
//      background(#FFFFFF);
//      typedKey = Character.toString(key);
//      setup();
//    }
//}
 
class Particle {
  PVector location;
  PVector velocity;
  //PVector plocation;
 
  Particle(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector(random(1),1);
  }
   
  void update() {
    location.add(velocity);
    if ((pixelMaskList[int(location.y)*width + int(location.x+velocity.x)]==1) || (pixelMaskList[int(location.y)*width+int(location.x-velocity.x)]==1)) {velocity.x *= -1;}
    if ((pixelMaskList[int(location.y+velocity.y)*width + int(location.x)]==1) || (pixelMaskList[int(location.y-velocity.y)*width+int(location.x)]==1)) {velocity.y *= -1;}
  }
}