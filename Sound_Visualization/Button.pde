class Button {                  //Game reset button---from Brush exercise.
  float x1;
  float y1;
   float x2;
  float y2;
   float x3;
  float y3;
 // PImage buttonImage;
 // PImage buttonImage2;

  boolean on;
  Button(float tempX1, float tempY1,float tempX2, float tempY2) {
    x1 = tempX1;
    y1 = tempY1;
     x2 = tempX2;
    y2 = tempY2;
    on=false;
   // buttonImage = loadImage("button.png");
 //   buttonImage2 = loadImage("button2.png");
  }

  void display() {
    if (on) {
      fill(0,255,0);
      ellipse(x1,y1,50,50);
      fill(0,255,0);
      ellipse(x2,y2,50,50);
      //setup();
    } else {
      fill(0,0,255);
      ellipse(x1,y1,50,50);
         fill(0,0,255);
      ellipse(x2,y2,50,50);
    }
  }

  void click(int mx, int my) {
    if (mx > x1 && mx < x1 + 50 && my > y1 && my < y1 + 50) {
      on = !on;
    }
  }
}
