Runner runner;
//Zombie zombie;

Zombie[] zombies ;


void setup() {
  size(2000, 1600);
  zombies = new Zombie[10];
  runner = new Runner();
  for (int i=0; i<zombies.length; i++) {
    zombies[i] = new Zombie();
  }
}

void draw() {
  background(0, 0, 128);
  fill(255, 0, 0);
  // rect(1000, 1500, 200, 20);
    rect(800, 1300, 200, 20);
     rect(1000, 1100, 200, 20);
      rect(800, 900, 200, 20);
       rect(1000, 700, 200, 20);
  rect(800, 500, 200, 20);
rect(1000, 300, 200, 20);
  rect(800, 100, 200, 20);
  
    rect(1400, 1300, 200, 20);
     rect(1400, 900, 200, 20);
       rect(1400, 500, 200, 20);
rect(1400, 100, 200, 20);
 // rect(1700, 100, 200, 20);





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
      text("Game Over",width/2-250,height/2);
     
      //setup();
    }
  }
}

void mousePressed() {
  for (int i=0; i<zombies.length; i++) {

    zombies[i].death(mouseX, mouseY);
  }
}
