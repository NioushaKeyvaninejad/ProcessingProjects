class Wall {

  float x=600;
  float y=100;
  float a=1000;

  float speed=3;
  float speed2=6;
  Wall() {
  }


  void move() {
    a+=speed2;
    x += speed;
    if (x>900 || a>1500 || x<600 || a<1000) {
      speed*=-1;
      speed2*=-1;
    }
  }


  void display() {

    fill(255, 0, 0);  
    for (int i=1; i<7; i++) {
      rect(x, y+i*200, 200, 20);

      rect(a, y+i*200, -200, 20);

      // rect(800, 1300, 200, 20);
      //  rect(1000, 1100, 200, 20);
      //  rect(800, 900, 200, 20);
      //   rect(1000, 700, 200, 20);
      // rect(800, 500, 200, 20);
      //rect(1000, 300, 200, 20);
      //rect(800, 100, 200, 20);

      //rect(1400, 1300, 200, 20);
      // rect(1400, 900, 200, 20);
      // rect(1400, 500, 200, 20);
      //rect(1400, 100, 200, 20);
    }
  }
}
