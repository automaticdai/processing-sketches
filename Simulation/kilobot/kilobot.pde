
public final int KILO_NUM = 100;

CSimuWorld world = new CSimuWorld();

class CSimuWorld {
   ArrayList<CKilobot> kilobots;
   
   void init() {
     kilobots = new ArrayList<CKilobot>();
     
     for (int i = 0; i < KILO_NUM; i++) {
      int x = int(random(width));
      int y = int(random(height));
      kilobots.add(new CKilobot(i, 0, new PVector(x, y), random(-PI, PI)));
     } 
     
     //kilobots.add(new CKilobot(KILO_NUM -1, 1, new PVector(width/2, height/2), random(-PI, PI)));
   }
   
  void edge_detection() {
    for (int i = 0; i < KILO_NUM; i++) {
      CKilobot kilobot = kilobots.get(i);
      
      if (kilobot.get_pos().x > width - kilobot.get_radius()) {
        kilobot.set_pos(width - kilobot.get_radius(), kilobot.get_pos().y);
        kilobot.on_edge();
      }
      
      if (kilobot.get_pos().y > height - kilobot.get_radius()) {
        kilobot.set_pos(kilobot.get_pos().x, height - kilobot.get_radius());
        kilobot.on_edge();
      }  
      
      if (kilobot.get_pos().x < 0 + kilobot.get_radius()) {
        kilobot.set_pos(kilobot.get_radius(), kilobot.get_pos().y);
        kilobot.on_edge();
      }
      
      if (kilobot.get_pos().y < 0 + kilobot.get_radius()) {
        kilobot.set_pos(kilobot.get_pos().x, kilobot.get_radius());
        kilobot.on_edge();
      }
    }
  }

  void collision_detection() {
    /*
    for (int i = 0; i < KILO_NUM; i++) {
      for (int j = i+1; j < KILO_NUM; j++) {
        if (kilobot.get_pos().dist(kilobots[j].get_pos()) < 
            kilobot.get_radius() + kilobots[j].get_radius()) {
              kilobot.on_collision(kilobots[j]);
            }
      
      }
    }
    */
  }
  
  void update_radar() {
    ;
  }
  
  void run() {
    // run kilobot
    for (int i = 0; i < KILO_NUM; i++) {
      CKilobot kilobot = kilobots.get(i);
      kilobot.run();
    }
    
    // edge dection
    edge_detection();
    
    // collision dection
    collision_detection();
    
    // communication
    for (int i = 0; i < KILO_NUM; i++) {
      CKilobot kilobotA = kilobots.get(i);
      for (int j = 0; j < KILO_NUM; j++) {
        CKilobot kilobotB = kilobots.get(j);
        
        if ((i != j) && kilobotA.get_enable_tx() && (is_neighbour(kilobotA, kilobotB)) ) {
          kilobotB.on_receiveMsg(kilobotA.get_tx_msg());
          PVector v1, v2;
          v1 = kilobotA.get_pos();
          v2 = kilobotB.get_pos();
          line(v1.x, v1.y, v2.x, v2.y);        
        }
      }
    }     
    
    // draw kilobot
    for (int i = 0; i < KILO_NUM; i++) {
      CKilobot kilobot = kilobots.get(i);
      kilobot.on_draw();
    } 
  }
  
  boolean is_neighbour(CKilobot bot_a, CKilobot bot_b) {
    PVector v1, v2;
    v1 = bot_a.get_pos();
    v2 = bot_b.get_pos();

    if ( PVector.sub(v1,v2).mag() < 100) {
      return true;
    }
    else {
      return false;
    }
  }
}


void setup() {
  size(800, 600);
  world.init();
}


void draw() {
  background(240);
  world.run();
}
