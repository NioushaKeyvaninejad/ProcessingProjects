class Zombie {

  float x;
  float y=random(height);
  //float xpos=width/2;
  //float ypos=height/2;
  float xspeed;
  float yspeed;


  Zombie() {


    if (random(width)<width/2) {
      x=0;
    } else {

      x=width;
    }
    xspeed = random(-5, 5);
    yspeed =random(-5, 5);
  }



  void move() {
    x += xspeed;
    y += yspeed;
    if (x>width || x<0) {
      xspeed*=-1;
    }
    if (y>height || y<0) {
      yspeed*=-1;
    }
  }

  void display() {

    fill(0);
    //   for (int i=0; i<10; i++) {
    ellipse(x, y, 100, 100);
    // }
  }


  void speed() {
  }



  boolean hit(Runner runner) {
    float distance = dist(x, y, runner.x, runner.y);
    if (distance<100) {
      return true;
    } else {
      return false;
    }
  }
  void death(int px,int py) {
    print(x, "   ");
    //if(mousePressed){
    float distance2 = dist(x+50, y+50, px, py);

    //if (px>x && px<x+300 && py>y && py<y+300 ){
    if (distance2<100) {

   
      x=200000;
      
    }
    
    //}
   
  }
}
