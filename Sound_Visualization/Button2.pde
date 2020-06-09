class Button2 {                  //Game reset button---from Brush exercise.
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
    //   buttonImage2 = loadImage("button2.png");
  }

  void display() {

    fill(0, 255, 0);

    if (on) {
    }

    ellipse(x, y, 100, 100);
  }

  void disappear() {
    x=5000;
  }
  void click(int mx, int my) {
    if (mx > x && mx < x + 100 && my > y && my < y + 100) {
      on = !on;
    }
  }
}
