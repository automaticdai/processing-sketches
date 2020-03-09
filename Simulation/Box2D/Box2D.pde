import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
ArrayList<Kbot> bots;

void setup() {
  size(640, 480);
  smooth();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, 0);
  
  // Create ArrayLists
  bots = new ArrayList<Kbot>();
  boundaries = new ArrayList<Boundary>();
  
  // Add a bunch of fixed boundaries
  //boundaries.add(new Boundary(width/4,height-5,width/2-50,10));
  boundaries.add(new Boundary(width/2, 5, width-10, 5));         // top
  boundaries.add(new Boundary(width/2, height-5, width-10, 5));  // bottom
  boundaries.add(new Boundary(width-5, height/2, 5, height));    // right
  boundaries.add(new Boundary(5, height/2, 5, height));          // left
  
  // add killbots
  Kbot p = new Kbot(width/2, height/2, 10);
  bots.add(p);
  
  Kbot p2 = new Kbot(width/2+100, height/2-5, 10);
  bots.add(p2);
  
  Kbot p3 = new Kbot(width/2+200, height/2-5, 10);
  bots.add(p3);
}

void draw() {
  
  background(255);
  
  //Vec2 mouseWorld = box2d.coordPixelsToWorld(mouseX,mouseY);
  //println(mouseWorld);
  box2d.step();

  // Display all the boxes
  for (Kbot b: bots) {
    b.run();
  }
  
  // Display all the boundaries
  for (Boundary wall: boundaries) {
    wall.display();
  }
  
  // remove dead bot
  for (int i = bots.size()-1; i >= 0; i--) {
    Kbot b = bots.get(i);
    if (b.done()) {
      bots.remove(i);
    }
  }
  
  // Just drawing the framerate to see how many particles it can handle
  fill(0);
  text("framerate: " + (int)frameRate, 12, 16);
}