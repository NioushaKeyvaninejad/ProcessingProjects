class Wall {

  float x=800;
  float y=100;

float speed=5;
  Wall() {


   
  }


  void move() {

    x += speed;
    if (x>1400){
      speed*=-1;}
      if (x<800){
         speed*=-1;
     
    }
  }


  void display() {

    fill(255, 0, 0);  
   for (int i=1; i<7; i++) {
      rect(x, y+i*200, 200, 20);



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
