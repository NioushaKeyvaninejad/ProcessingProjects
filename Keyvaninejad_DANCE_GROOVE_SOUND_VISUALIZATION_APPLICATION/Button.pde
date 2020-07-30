class Button {                  //from Brush/Game exercise.
  float x;
  float y;
  PImage buttonImage;
  boolean on;

  Button(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    on=false;
    buttonImage = loadImage("Button.png");
  }

  void display() {
    if (on) {
    }
    image(buttonImage, x, y);
  }

  void disappear() { 
    x=5000;
  }

  void click(int mx, int my) {  //Button zone to be clicked on
    if (mx > x && mx < x + 100 && my > y && my < y + 100) {
      on = !on;
    }
  }
}
