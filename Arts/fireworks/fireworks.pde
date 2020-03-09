
ArrayList<Firework> fireworks;
PVector gravity = new PVector(0, 0.2); 

void setup() {
  fullScreen(P2D);
  //size(800, 800, P2D);
  colorMode(HSB);
  fireworks = new ArrayList<Firework>();
  
  Firework firework = new Firework(new PVector(random(width), height), new PVector(0, random(-20, -10)));
  fireworks.add(firework);
}


void draw() {
  background(0, 10);
  
  float p = random(1);
  if (p < 0.3) {
    Firework firework = new Firework(new PVector(random(width), height), new PVector(0, random(-20, -10)));
    fireworks.add(firework);
  }
  
  for (int i = fireworks.size() - 1; i >= 0; i --) {
    fireworks.get(i).applyForce(gravity);
    fireworks.get(i).update();
    fireworks.get(i).show();
    
    if (fireworks.get(i).isDead()) {
      fireworks.remove(i);
    }
  }

}