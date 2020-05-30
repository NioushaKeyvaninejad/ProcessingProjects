class Runner {

  float x=width/2-25;
  float y=height-100;
  float yspeed;
  float xspeed;
  PImage runnerImage;

  Runner() {
    yspeed = 8;
    xspeed = 8;
    runnerImage = loadImage("Runner.png");
  }

  void display() {
    image(runnerImage, x, y);
  }

  void move() {                       //arrowkeys functionality
    if ((keyPressed == true)) {
      if (keyCode==RIGHT) {
        x+=xspeed ;
        if (x>1400) {
          x=1400;
        }
      }
      if (keyCode==LEFT) {
        x-=xspeed;
        if (x<700) {
          x=700;
        }
      }
      if (keyCode==UP) {

        y-=yspeed;
        if (y<25) {
          y=25;
        }
      }
    }
  }

  boolean hit(Wall walls) {            //if the runner hits a wall
    boolean mm=false;
    for (int i=1; i<7; i++) {
      if (y>(walls.y[i]) && y<(walls.y[i]+20)) {
        if (x>(walls.x[i]) && x<(walls.x[i]+200)) {
          mm=true;
        } else if (x>(walls.a[i]-200) && x<(walls.a[i])) {
          mm=true;
        }
      }
    }
    if (mm==true) {
      return true;
    } else { 
      return false;
    }
  }

  void bleed() {                         //if the runner hits a zombie its color 
    fill(255, 0, 0);                     //changes to red
    ellipse(x, y, 100, 100);
  }

  void reset() {                          //goes back to the start point
    x=width/2;
    y=height-50;
  }
}
