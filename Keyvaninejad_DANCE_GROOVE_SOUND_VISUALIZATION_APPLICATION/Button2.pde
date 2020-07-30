//Back Button

class Button2 {                  //from Brush/Game exercise.
  float x;
  float y;
  PImage buttonImage;
  boolean on;

  Button2(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    on=false;
    buttonImage = loadImage("Button2.png");
  }

  void display() {
    if (on) {
    }
    image(buttonImage, x, y);
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
