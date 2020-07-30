class Button {                  //Game reset button---from Brush exercise.
  float x;
  float y;
  PImage buttonImage;
  PImage buttonImage2;

  boolean on;
  Button(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    on=false;
    buttonImage = loadImage("button.png");
    buttonImage2 = loadImage("button2.png");
  }

  void display() {
    if (on) {
      image(buttonImage, x, y);
      setup();
    } else {
      image(buttonImage2, x, y);
    }
  }

  void click(int mx, int my) {
    if (mx > x && mx < x + 100 && my > y && my < y + 100) {
      on = !on;
    }
  }
}
