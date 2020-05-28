Runner runner;
Zombie[] zombies ;
Wall[] walls;
Lives[] lives;

int m=3;
float x=100;

void setup() {
  size(2000, 1600);
  zombies = new Zombie[10];
  runner = new Runner();
  walls = new Wall[1];
  lives = new Lives[m];
  for (int i=0; i<zombies.length; i++) {
    zombies[i] = new Zombie();
  }
  for (int i=0; i<walls.length; i++) {
    walls[i]=new Wall();
  }
  for (int i=0; i<lives.length; i++) {
    lives[i] = new Lives(210*m);
  }
}


void draw() {
  background(0, 0, 128);
  for (int i=0; i<lives.length; i++) {
    lives[i].display();
  }
  for (int i=0; i<walls.length; i++) {
    walls[i].display();
    walls[i].move();
    if (runner.hit(walls[i])) {
    lives[i].disappear();
    }
  }





  runner.display();
  runner.speed();
  runner.move();

  //runner.setLocation(width/2,height-100);
  for (int i=0; i<zombies.length; i++) {
    zombies[i].move();
    zombies[i].display();
    zombies[i].speed();

    if (zombies[i].hit(runner)) {
      runner.bleed();
      textSize(100);
      text("Game Over", width/2-250, height/2);

      //setup();
    }
  }
}


void mousePressed() {
  for (int i=0; i<zombies.length; i++) {

    zombies[i].death(mouseX, mouseY);
  }
}
