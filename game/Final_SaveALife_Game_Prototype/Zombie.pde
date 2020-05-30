class Zombie {                         //with the aid of: (Shiffman-pg:213)

  float x;
  float y=random(120, height-200);     //range of movement
  float xspeed;
  float yspeed;

  Zombie() {
    if (random(width)<width/2) {       //releasing zombies from both sides
      x=0;
    } else {
      x=width;
    }
    xspeed = random(-5, 5);            //moving forward && backward
    yspeed =random(-5, 5);             //moving upward && downward
  }

  void move() {
    x += xspeed;
    y += yspeed;
    if (x>width || x<0) {                    //hitting the edges of the screen
      xspeed*=-1;
    }
    if (y>height-200 || y<120) {
      yspeed*=-1;
    }
  }

  void display() {
    fill(0);
    ellipse(x, y, 100, 100);
  }

  boolean hit(Runner runner) {                            //hitting the runner
    float distance = dist(x, y, runner.x, runner.y);
    if (distance<75) {
      return true;
    } else {
      return false;
    }
  }

  void death(int px, int py) {                          
    float distance2 = dist(x+50, y+50, px, py);
    if (distance2<100) {
      x=200000;                      //if mouse clicked on a zombie, throw it away
    }
  }
}
