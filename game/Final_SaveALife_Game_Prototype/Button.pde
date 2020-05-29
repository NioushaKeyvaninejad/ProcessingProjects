class Button {                  //Game reset button---from Brush exercise.
  float x;
  float y;



  boolean on;
  Button(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    on=false;
  }




  void display() {
    ellipseMode(CORNER);
    stroke(0);

    if (on) {
      fill(255, 0, 0);
      setup();
    } else {
      fill(0, 255, 0);
    }
    ellipse(x, y, 50, 50);
  }





  void click(int mx, int my) {

    if (mx > x && mx < x + 50 && my > y && my < y + 50) {
      on = !on;
    }
  }
}
