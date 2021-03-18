// Particles, origined by Daniel Shiffman.
// Modified by Yunfei

ParticleSystem ps;
PImage sprite;  

void setup() {
  size(1024, 1024, P2D);
  orientation(LANDSCAPE);
  sprite = loadImage("sprite.png");
  ps = new ParticleSystem(1000);

  // Writing to the depth buffer is disabled to avoid rendering
  // artifacts due to the fact that the particles are semi-transparent
  // but not z-sorted.
  hint(DISABLE_DEPTH_MASK);
} 

PVector blom_pos = new PVector(0,0);
int cnt = 0;

void draw () {
  background(0);
  ps.update();
  ps.display();
  
  // (1) rising sky{
//  ps.setEmitter(blom_pos.x,blom_pos.y);
//  blom_pos.x += random(-8,8);
//  blom_pos.y += random(-1.2,0.5);
  // }
    
  // (2) follow{
  ps.setEmitter(mouseX, mouseY);
  // }
  
  // (3) fireworks{
//  if ( cnt > 30 ) {
//    cnt = int(random(0,20));
//    blom_pos.x = random(width);
//    blom_pos.y = random(height);
//  } else {
//    cnt++;
//  }
//  
//  ps.setEmitter(blom_pos.x, blom_pos.y);
  //}
  
  fill(255);
  
  textSize(16);
  text("Dai Xiaotian, University of Sheffiled, 2013", 10, 20);
  text("FPS: " + int(frameRate), 10, 40);
  
}
