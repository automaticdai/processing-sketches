
class object {
  
  PVector pos;
  float   rad = 0;
  float   A = 20;
  float   B = 10;
  float   C = 5;
  float   D = 10;
  float   wind_spd;
  PShape  part;
  float   partSize;
  
  object() {
    
    pos = new PVector(-width/2, random(height));
    wind_spd = random(1,5);
    A = random(10,100);
    B = random(20,50);
    C = random(10,30);  
    D = random(1,10);
    
    partSize = random(5,25);
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
    
  }
  
  
  void update() {
    pos.x = pos.x + wind_spd;
    if (pos.x > width/2 ) {
      pos.x = -width/2;
    }
    
    rad = map(pos.x, 0, width, 0, 2*PI);
//    
//    pos.y = A*sin(5*rad) 
//          + B*sin(4*rad) 
//          + C*cos(3*rad) 
//          - exp(map(pos.x,-width/2,width/2,1,6));
    
    float x_percent = map(pos.x,-width/2,width/2,0,1);
    pos.y = x_percent*A*sin(10*rad) 
          + B*sin(4*rad) 
          + C*cos(3*rad); 


//    pos.y = 100*sin(1*rad) 
//          + 100/3*sin(3*rad) 
//          + 100/5*sin(5*rad) 
//          + 100/7*sin(7*rad)
//          + 100/9*sin(9*rad);
  }
  
  
  void show() {
    colorMode(HSB);
    part.setTint(color(map(pos.x,-width/2,width/2,0,255), 255, 255));
    translate(pos.x, pos.y);
    shape(part);
    translate(-pos.x, -pos.y);
  }

}