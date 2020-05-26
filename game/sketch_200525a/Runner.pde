class Runner {
  float x=width/2;
  float y=height-100;
  float yspeed;

  Runner() {
    yspeed = random(5);
  }



  // void setLocation(float tempX, float tempY) {
  //x = tempX;
  //y = tempY;
  //}




  void display() {
    fill(255);
    ellipse(x, y, 100, 100);
  }

  void move() {
    y-=yspeed;
  }

  void speed() {
  }


  void bleed() {

    fill(255, 0, 0);
    ellipse(x, y, 100, 100);
  }
}
