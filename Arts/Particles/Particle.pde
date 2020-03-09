class Particle {

  PVector velocity;
  float lifespan = 255;
  
  PShape part;
  float partSize;
  
  PVector gravity = new PVector(0, 0.02);


  Particle() {
    
    // create the basic shape of the particle
    partSize = random(10,50);
    part = createShape();
    part.beginShape(QUAD);
    part.noStroke();
    part.texture(sprite);
    part.normal(0, 0, 1);
    part.vertex(-partSize/2, -partSize/2, 0, 0);
    part.vertex(+partSize/2, -partSize/2, sprite.width, 0);
    part.vertex(+partSize/2, +partSize/2, sprite.width, sprite.height);
    part.vertex(-partSize/2, +partSize/2, 0, sprite.height);
    part.endShape();
    
    // generate the particle
    rebirth(width/2, height/2);
    lifespan = random(255);
  }

  PShape getShape() {
    return part;
  }
  
  void rebirth(float x, float y) {
    float a = random(TWO_PI);
    float speed = random(0.5, 4);
    velocity = new PVector(cos(a), sin(a));
    velocity.mult(speed);
    // lifespan is the life time of a particle
    lifespan = 50;   
    
    part.resetMatrix();
    part.translate(x, y); 
  }
  
  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    } 
  }
   
  public void update() {
    lifespan = lifespan - 1;
    velocity.add(gravity);
    // set the color of the particle relating to its lifespan
    colorMode(HSB);
    part.setTint(color(190+lifespan, 255, 200+lifespan));
    part.translate(velocity.x, velocity.y);
  }
}
