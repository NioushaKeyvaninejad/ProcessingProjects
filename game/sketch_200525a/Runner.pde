class Runner {
  float x=width/2;
  float y=height-50;
  float yspeed;
  float xspeed;

  Runner() {
    yspeed = 8;
    xspeed = 8;
  }



  // void setLocation(float tempX, float tempY) {
  //x = tempX;
  //y = tempY;
  //}




  void display() {
    fill(255);
    ellipse(x, y, 50, 50);
    // y-=yspeed;
  }

  void move() {
    if ((keyPressed == true)) {
      if (keyCode==RIGHT) {
        x+=xspeed ;
        //yspeed=0;
      }
      if (keyCode==LEFT) {
        x-=xspeed;
        //yspeed=0;
      }
      if (keyCode==UP) {
        //xspeed=0;
        y-=yspeed;
      }
      print(y, "  ");
    }
  }
  
  
   boolean hit(Wall walls) {
    float distance = dist(x, y, walls.x, walls.y);
    if (distance<100) {
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
}
