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
  rect(500, 500, 200, 20);

  rect(500, 300, 200, 20);
  rect(500, 200, 200, 20);
  rect(500, 100, 200, 20);





  runner.display();
  runner.speed();
  runner.move();
  // runner.setLocation(width/2,height-100);
  for (int i=0; i<zombies.length; i++) {
    zombies[i].move();
    zombies[i].display();
    zombies[i].speed();

    if (zombies[i].hit(runner)) {
      runner.bleed();
    }
  }
}

void mousePressed() {
  for (int i=0; i<zombies.length; i++) {
    
    zombies[i].death(mouseX,mouseY);
  }
}
