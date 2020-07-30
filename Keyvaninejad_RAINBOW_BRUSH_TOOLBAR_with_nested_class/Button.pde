//with the aid of: http://learningprocessing.com/exercises/chp09/exercise-09-08-array-buttons

class Button { 
  float x;
  float y;
  float w;
  float h;
  float col;
  boolean on;

  Button(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    on=false;
  }

  void Start_func3(int col1, int col2, int col3, float Default, Brush brush) { //nested class //I made the void as a function to use it(brush class) in other functions(here, in another class).
    brush.Start_func( col1, col2, col3, Default);
    brush.Size(); 
    brush.BrushColor(Default); //this way I can change the color(by keyboard). Default connects to Slider.
    brush.TryAgain();
  }

  void click(int mx, int my) {                          //button zone, to be clicked on
    if (mx > x && mx < x + w && my > y && my < y + h) {
      on = !on;
    }
  }

  void display(int i) {
    ellipseMode(CORNER);
    stroke(0);
    if (on) {
      fill(175);
    } else {              //each button's display color on toolbar
      if (i==0) { 
        fill(100);
      }
      if (i==1) {  
        fill(255, 0, 0);
      }
      if (i==2) {  
        fill(0, 255, 0);
      }
      if (i==3) {   
        fill(0, 0, 255);
      }
      if (i==4) {   
        fill(255, 255, 0);
      }
      if (i==5) {   
        fill(0, 0, 0);
      }
      if (i==6) {   
        fill(255, 69, 0);
      }
      if (i==7) {   
        fill(255, 192, 203);
      }
      if (i==8) {   
        fill(255, 255, 255);
      }
    }
    ellipse(x, y, w, h);            //button shape
  }
}
