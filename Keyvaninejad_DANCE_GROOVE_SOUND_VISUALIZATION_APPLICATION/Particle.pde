//Ref.: https://www.openprocessing.org/sketch/842608

class Particle {
  float opacity=80;
  color c1 = #FF0000;
  color c2 = #FFC000;
  color c3 = #E0FF00;
  color c4 = #7EFF00;
  color c5 = #21FF00;
  color c6 = #00FF41;
  color c7 = #00FF9F;
  color c8 = #00FDFF;
  color c9 = #009FFF;
  color c10 = #003DFF;
  color c11 = #2100FF;
  color c12 = #8300FF;
  color c13 = #E500FF;
  color c14 = #0052FF;
  color c15 = #FF007C;
  color c16 = #1000FF;
  color c17 = #FFFFFF;
  color[] colors  = {   //Colors Array
    c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17
  };
  int N, col;
  float size, x, y, speed, sign;
  color c;

  Particle() {
    size = random(5, 100);
    x = random(width / 2 - width / 2, width / 2 + width / 2 - size);
    y = random(height / 2 - height / 2, height / 2 + height / 2 - size);
    //Randomly changing the speed direction:
    sign = random(1) >= 0.5 ? -1 : 1; //https://processing.org/reference/conditional.html
    N = floor(random(2));
    col=floor(random(17));
    c = colors[col];
  }

  void move(float speed) { //Particles' movement according to the songs/Audio
    if (N == 0) {
      x += sign * speed;
    } else {
      y += sign * speed;
    }
    if (x < 0) {
      x= x+width;
    }
    if (x > width) {
      x= x-width;
    }
    if (y < 0) {
      y= y+height;
    }
    if (y > height) {
      y= y-height;
    }
  }

  void display() {
    fill(c, opacity);
    noStroke();
    rect(x, y, size, size);
  }
}
