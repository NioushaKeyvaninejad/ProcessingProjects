//ref.: https://processing.org/examples/scrollbar.html  //with some changes of mine

//This slider is for the purpose of making each component of the brush bigger in size.
class Slider {  
  int swidth, sheight;       //Slider width and height   
  float xpos, ypos;       
  float spos, newspos;       //slider position 
  float sposMin, sposMax;    //for constrain
  int loose;                 //how hard it moves while dragged
  boolean over;          
  boolean locked;
  float ratio;

  Slider(float xp, float yp, int sw, int sh, int l) {
    stroke(0);
    strokeWeight(4);
    line(700, 770, 700, 780);
    fill(0);
    textSize(18);
    text("20", 690, 795);
    fill(0);
    textSize(16);
    text("5", 500, 795);
    fill(0);
    textSize(16);
    text("50", 870, 795);
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void Display() { //shows change of slider color while cursor is on it
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    return spos * ratio;
  }

  float Update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
    return spos;
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
      mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }
}
