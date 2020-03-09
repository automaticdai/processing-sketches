
class Kbot {
  Body    body;
  float   r;
  color   LED;
  
  Kbot(float x, float y, float r_) {
    r = r_;
    LED = color(255, 0, 0);
    
    // Create the body in Box2D
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 0.8;
    fd.restitution = 0.5;
    body.createFixture(fd);
    //body.setLinearVelocity(new Vec2(10,0));
    //body.setAngularVelocity(3.14/10);
  }
  
  void display() {
    // We need the Body’s location and angle
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();

    pushMatrix();
    translate(pos.x, pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);              // translate and rotate the rectangle
    fill(LED, 50);
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,r*2,r*2);
    // Let's add a line so we can see the rotation
    line(0,0,r,0);
    popMatrix();    
  }
  
  void run() {
    display();
    
    Vec2 pos = body.getWorldCenter();
    Vec2 wind = new Vec2(100 * cos(radians(body.getAngle())), 100 * sin(radians(body.getAngle())));
    body.applyForce(wind, pos);
  }
  
  void set_led(color new_color) {
    LED = new_color;
  }
  
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height + r*2) {
      kill();
      return true;
    }
    return false;
  }
  
  void kill() {
    box2d.destroyBody(body);
  }
}