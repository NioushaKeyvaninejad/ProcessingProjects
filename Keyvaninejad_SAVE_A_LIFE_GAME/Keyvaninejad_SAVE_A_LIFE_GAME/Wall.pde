class Wall {
  float[] x = new float[7];   //an array of 7 walls
  float[] y = new float[7];
  float[] a = new float[7];   //"a" is the "x" position for the second column of walls
  float speed=3;              //first column speed
  float speed2=6;             //second column speed
  Wall(float tempX, float tempY, float tempA) {
    x[0]=tempX;
    y[0]=tempY;
    a[0]=tempA;
  }

  void move() {

    a[0]+=speed2;
    x[0] += speed;
    if (x[0]>900 || a[0]>1500 || x[0]<600 || a[0]<1000) { //moving forward && backward
      speed*=-1;
      speed2*=-1;
    }
    for (int i=1; i<7; i++) {
      a[i]=a[0];
      x[i]=x[0];
    }
  }

  void display() {
    fill(150, 0, 50);  
    for (int i=1; i<7; i++) {
      y[i]=y[0]+i*200;
      rect(x[i], y[i], 200, 20);
      rect(a[i], y[i], -200, 20);
    }
  }
}
