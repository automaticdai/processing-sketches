class CKilobot{
  int        ID;
  PVector    pos;
  PVector    pos_last;
  float      heading;
  int        radius;
  float      linear_speed;
  float      angular_speed;
  color      LED;
  int        LED_brightness;
  
  byte[]     msg_rx;
  byte[]     msg_tx;  
  boolean    enable_tx;
  
  // user defined data
  int        neighbour_num;
  
  CKilobot(int _ID, int _type, PVector _pos, float _heading) {
    ID = _ID;
    pos = _pos;
    pos_last = _pos;
    heading = _heading;
    
    if (_type == 0) {
      radius = 10;
      linear_speed = 0.5;
      enable_tx();
    }
    else {
      radius = 20;
      linear_speed = 0.5;
      enable_tx();
    }
    
    LED = color(255, 0, 0);
    LED_brightness = 20;//int(random(100));
    // init communication
    msg_rx = new byte[6];
    msg_tx = new byte[6];
    msg_tx[0] = byte(ID);
  }
  
  boolean get_enable_tx() {return enable_tx;}
  void enable_tx() {enable_tx = true;}
  void disable_tx() {enable_tx = false;}
  byte[] get_tx_msg() {return msg_tx;}  
  
  void set_pos(float pos_x, float pos_y) {
    pos.x = pos_x;
    pos.y = pos_y; 
  }
  
  void set_color(color new_color) {
    LED = new_color;
  }
  
  PVector get_pos() {
    return pos;
  }
  
  int get_radius() {
    return radius;
  }
  
  void run() {
    controller();
    
    pos_last.x = pos.x;
    pos_last.y = pos.y;
    
    heading += random(-0.002, 0.002);
    if (heading > PI) {
      heading = PI;
    }
    else if (heading < -PI) {
      heading = -PI;
    }
    pos.x = pos.x + linear_speed * cos(heading);
    pos.y = pos.y + linear_speed * sin(heading);
    
  }
  
  void on_draw() {
    pushStyle();
    pushMatrix();
    
    translate(pos.x, pos.y);
    
    // draw radar
    //noStroke();
    //fill(color(255,0,0), 50);
    //ellipse(0, 0, 200, 200);
    
    // draw body
    stroke(50);
    strokeWeight(2);
    fill(LED, 200 * sin(TWO_PI * LED_brightness / 100.0) );
    //LED_brightness = (LED_brightness + 1) % 100;
    ellipse(0, 0, radius*2, radius*2);
    line(0, 0, radius * cos(heading), radius * sin(heading));
    
    popMatrix();
    popStyle();
  }  
  
  void on_collision(CKilobot kilobot_opp) {
    float heading_copy = heading;
    
    set_color(color(0, 0, 255));
    pos.x = pos_last.x;
    pos.y = pos_last.y;
    //heading = heading + 0.001 * kilobot_opp.heading;
    heading = kilobot_opp.heading;
    
    kilobot_opp.set_color(color(0, 0, 255));
    kilobot_opp.pos.x = kilobot_opp.pos_last.x;
    kilobot_opp.pos.y = kilobot_opp.pos_last.y;
    //kilobot_opp.heading = kilobot_opp.heading + 0.001 * heading_copy;
    kilobot_opp.heading = heading_copy;
  }
  
  void on_edge() {
    ;
  }
  
  void on_receiveMsg(byte[] msg) {
    ;
  }
  
  void controller() {
    LED = color(255, 0, 0);
  }
  
}
