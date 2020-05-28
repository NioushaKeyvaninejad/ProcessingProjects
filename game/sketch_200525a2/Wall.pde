class Wall {
  float[] x = new float[7];
  float[] y = new float[7];
  float[] a = new float[7];//a is the x position for the second column of walls
  float speed=3;
  float speed2=6;
  Wall(float tempX, float tempY, float tempA) {
    x[0]=tempX;
    y[0]=tempY;
    a[0]=tempA;
  }




  void move() {
    //for(int i=0;i<7;i++){
    a[0]+=speed2;
    x[0] += speed;
    if (x[0]>900 || a[0]>1500 || x[0]<600 || a[0]<1000) {
      speed*=-1;
      speed2*=-1;
    }
    for (int i=1; i<7; i++) {
      a[i]=a[0];
      x[i]=x[0];
    }
  }




  void display() {
    fill(255, 0, 0);  
    for (int i=1; i<7; i++) {
      y[i]=y[0]+i*200;
      rect(x[i], y[i], 200, 20);
      rect(a[i], y[i], -200, 20);

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
