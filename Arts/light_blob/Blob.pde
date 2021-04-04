class Blob {

  float r = 100;
  color c;
  int alpha;
  int phase = 0;

  int angleStep = 36;

  Blob(float r, color c, int alpha, int phase) {
    this.r = r;
    this.c = c;
    this.phase = phase;
    this.alpha = alpha;
  }

  void draw(float t) {
    beginShape();
    for (int theta = 0; theta <= 360 + 2 * angleStep; theta+=angleStep) {
      
      fill(c, alpha);
      
      int k = 20;
      
      float r1 = cos(radians(theta)) + 1;
      float r2 = sin(radians(theta)) + 1;
      float r3 = r + noise(k * r1, k * r2, t+phase) * 50;
      
      curveVertex((r3)*cos(radians(theta)) + width/2, 
                  (r3)*sin(radians(theta)) + height/2);
    }
    endShape();
  }
}
