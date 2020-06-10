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


  color[] colors  = {  
    c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17
  };


  int N, col;
  float size, x, y, speed, sign;
  color c;
  Particle() {
    size = random(5, 100);
    x = random(width / 2 - width / 2, width / 2 + width / 2 - size);
    y = random(height / 2 - height / 2, height / 2 + height / 2 - size);

    speed = random(1, 3);
    sign = random(1) >= 0.5 ? -1 : 1;

    N = floor(random(2));
    // c = Palette;
    col=floor(random(17));
    c = colors[col];
  }

  void move(float speed) {
    if (N == 0) {
      x += sign * speed;
    } else {
      y += sign * speed;
    }

    if (x < width / 2 - width / 2 || x > width / 2 + width / 2 - size ||
      y < height / 2 - height / 2 || y > height / 2 + height / 2 - size) {
      speed *= -1;
    }
  }

  void display() {
    fill(c, opacity);
    noStroke();
    rect(x, y, size, size);
  }
}
