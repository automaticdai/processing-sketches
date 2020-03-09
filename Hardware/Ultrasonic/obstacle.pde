class Obstacle {
  
  int distance = 0;
  int life = 100;
  
  Obstacle(int dist_new){
    distance = dist_new;
  }
  
  void show(){
    fill(255, 0, 0, life);
    ellipse(distance, 200, 10, 10);
  }
  
  boolean finished(){
    life--;
    if ( life < 0 ){
      return true;
    }else{
      return false;
    }
  
  }
}
