class Runner {
  float x=width/2;
  float y=height-50;
  float yspeed;
  float xspeed;

  Runner() {
    yspeed = 8;
    xspeed = 8;
   
  }








  void display() {
    fill(255);
    ellipse(x, y, 50, 50);
  }



  void move() {
    if ((keyPressed == true)) {
      if (keyCode==RIGHT) {
        x+=xspeed ;
      }
      if (keyCode==LEFT) {
        x-=xspeed;
      }
      if (keyCode==UP) {

        y-=yspeed;
      }
    }
  }




  boolean hit(Wall walls) {
      boolean mm=false;

    //println (walls.x[0], "  ", walls.x[1], "  ", walls.x[2], "  ", walls.x[3], "  ", walls.x[4], "  ", x, "  ");

    for (int i=1; i<7; i++) {
      //float distance = dist(x, y, walls.x[i], walls.y[i]);
      if (y>(walls.y[i]) && y<(walls.y[i]+20)) {
        if (x>(walls.x[i]) && x<(walls.x[i]+200)) {
      //print(distance, "");
      //if (distance<100) {
        mm=true;
      //}
        }
      }
    }
    if (mm==true) {
      return true;
    } else { 
      return false;
    }
  }





  void speed() {
  }




  void bleed() {

    fill(255, 0, 0);
    ellipse(x, y, 100, 100);
  }
  
  
  void reset(){
   x=width/2;
 y=height-50;
    
    
  }
}
