class Button {                  
  float x=50;
  float y=50;


  boolean on;
  Button() {
  
    on=false;

  }

  void display() {
    ellipseMode(CORNER);
    stroke(0);
    if (on) {
    fill(175);
    } else {
    fill(0);
    }
      ellipse(x,y,30,30);
  }

  void click(int mx, int my) {
    if (mx > x && mx < x + 30 && my > y && my < y + 30) {
      on = !on;
    }
  }
}
