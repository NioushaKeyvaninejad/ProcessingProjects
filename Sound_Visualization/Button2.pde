//Back Button

class Button2 {                  //from Brush/Game exercise.
  float x;
  float y;
  // PImage buttonImage;
  // PImage buttonImage2;
  boolean on;
  Button2(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    on=false;
    // buttonImage = loadImage("button.png");
    // buttonImage2 = loadImage("button2.png");
  }

  void display() {
    if (on) {
    }
    rect(x, y, 100, 25);
    fill(0);
    textSize(24);
    text("BACK", 370, 570);
    fill(0, 255, 0);
  }

  void disappear() {
    x=5000;
  }
  
  void click(int mx, int my) {
    if (mx > x && mx < x + 100 && my > y && my < y + 25) {
      on = !on;
    }
  }
}
