class node {
  
  int   layer = 0;
  float x = 0;
  float y = 0;
  float vx = 0;
  float vy = 0;
  node  father = null;
  float step = 0;
  String[] texts;
  
  node(node parent) {
    if (parent == null) { // this will be the root node
      texts =  new String[20];
    }
    else {
      father = parent;
      x = random(-1, 1) * 150;
      y = random(-1, 1) * 150;
      step = random(0, 100);
    }
  }
  
  void show() {
    pushMatrix();
    
    if (father == null) {
      translate(width/2, height/2);
      ellipse(x, y, 20, 20);
    }
    else {
      float x_noise = (noise(step) - 0.5) * 20;
      float y_noise = (noise(step + 100) - 0.5) * 20;
      translate(width/2 + father.x, height/2 + father.y);
      line(x + x_noise, y + y_noise, 0, 0);
      ellipse(x + x_noise, y + y_noise , 10, 10);
    }
    
    popMatrix();
  }

  void move() {
    vx = (mouseX - width/2 - x);
    vy = (mouseY - height/2 - y);
    if (father == null) {
      x = x + 0.05 * vx;
      y = y + 0.05 * vy;
    }
    step += 0.01;
   
  }
  
  void speak() {
       
    texts[0] = "... Hi, I am ELX";
    texts[1] = "... Steven created me";
    texts[2] = "... He sent me to you";
    texts[3] = "... He think I might be cute enough to make you happy";
    texts[4] = "... I am not very intelligent at the moment";
    texts[5] = "... But Steven will make me more clever";
    texts[6] = "... Maybe oneday I can program you";
    texts[7] = "... But not today";
    texts[8] = "... Today is my Birthday, you know that";
    texts[9] = "... And my birthday wish is you will never be hurt again";
    
    pushStyle();
    fill(0, 0, 0);
    text(texts[int(step / 3) % 10], x + width/2 + 80, y + height/2);
    popStyle();
    
  }
  
}
