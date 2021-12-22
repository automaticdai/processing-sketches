class Pendulum {
  float x = width/2;
  float y = 0;
  float l = 200;
  float angle = PI/4;
  float vangle;
  float dampling = 0.995;
  
  void update() {
    vangle = vangle - 0.98 * sin(angle) / l;
    vangle = vangle * dampling;
    angle = angle + vangle;
  }
  
  void show() {    
    float ball_x = x + l * sin(angle);
    float ball_y = y + l * cos(angle);
    
    stroke(0);
    strokeWeight(1);
    // draw ancher
    point(x, y);
    line(x, y, ball_x, ball_y);
    // draw ball
    fill(175);
    ellipseMode(CENTER);
    ellipse(ball_x, ball_y, 48, 48);
    //line()
    //translate();
  }
  
  void clicked() {
    if (mousePressed) {
      angle = 45;
      vangle = 0;
    }
  }

}
