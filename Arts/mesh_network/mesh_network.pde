int numObj = 100;

float[] x = new float[numObj];
float[] y = new float[numObj];
float[] r = new float[numObj];
int[] c   = new int[numObj];
float[] speedX = new float[numObj];
float[] speedY = new float[numObj];

void setup(){
  
  size(400, 400, P2D);
  background(0);
  smooth();
  //blendMode(ADD);
  
  for (int i = 0; i < numObj; i++) {
    x[i] = random(width);
    y[i] = random(height);
    r[i] = random(1, 4);
    c[i] = floor(random(256));
    
    float speed = 5.1 - r[i];
    speedX[i] = random(-speed, speed);
    speedY[i] = random(-speed, speed);
  }
  
}

void draw(){
  
  background(255);

  // iterate through all points
  for (int i = 0; i < numObj; i++) {
    
    stroke(c[i]);
    
    PVector pos1;
    pos1 = new PVector(x[i],y[i]);
    
    x[i] += speedX[i];
    y[i] += speedY[i];
   
    // collison detection
    if((x[i] < 0) || (x[i] > width)) {
      speedX[i] *= -1; 
    }
    
    if((y[i] < 0) || (y[i] > height)) {
      speedY[i] *= -1; 
    }
    // draw point
    stroke(230, 50, 140, 100);
    strokeWeight(r[i]);
    point(x[i], y[i]);
    
    // draw lines between close points
    for (int j = 0; j < numObj; j++) {
      
      PVector pos2;
      
      pos2 = new PVector(x[j],y[j]);
    
      float dist = PVector.dist(pos1, pos2);
      
      if (dist < 50 && j != i) {
       for (int k = 0; k < numObj; k++) {
         PVector pos3;
         
         pos3 = new PVector(x[k],y[k]);
         float dist2 = PVector.dist(pos3, pos2);
         
         if (dist2 < 50 && k != j && k != i) {
           noStroke();
           fill(230, 50, 140, 10); // last value is alpha
           beginShape(TRIANGLES);  
           vertex(x[i], y[i]);
           vertex(x[j], y[j]);
           vertex(x[k], y[k]);
           endShape();
         }
       }
 
      }
    }
    

  }
  
}
