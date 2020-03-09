class drop {
  float x = random(-width, width);
  float y = random(-500, -300);
  float x_speed = random(2, 3);
  float y_speed = random(10, 20);
  
  void update(){
    x = x + x_speed;
    y = y + y_speed;
    y_speed = y_speed + 0.1;
    
    // if out of screen, regenerate
    if (y > height) {
      x = random(-width, width);
      y = random(-300, -100);
      y_speed = random(10, 20);
    }
  }
  
  void show() {
    stroke(232, 11, 74);
    strokeWeight(1);
    line(x, y, x, y + y_speed);
  }

}