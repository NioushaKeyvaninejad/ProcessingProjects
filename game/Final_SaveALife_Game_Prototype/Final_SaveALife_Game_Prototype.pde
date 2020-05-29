//The runner has to reach the green spot on top of the screen. If the runner hit the 
//walls, you have to start moving the runner again from the start point. By any zombie
//attack, you will lose a life and you only have 3 lives. Don't forget to kill zombies
//with mouse click because they are incresed every 5 seconds. click the green button 
//if you want to reset the game. Only UP,RIGHT and LEFT arrow keys on keyboard work,
//so you cannot move backward.

Runner runner;
Zombie[] zombies ;
Wall[] walls;
Timer timer;               //for zombies
Timer timer2;              //for "Game Over" text
Button resetButton;

int e1=100;                //ellipse1.x
int e2=200;                //ellipse2.x
int e3=300;                //ellipse3.x
int eN=0;
int iteration=0;
int it=0;
int tc=0;
int kj=0;

void setup() {
  size(2000, 1600);
  zombies = new Zombie[200];
  runner = new Runner();
  resetButton = new Button(50, 1525);
  walls = new Wall[1];
  timer=new Timer(5000);
  timer2=new Timer(2000);
  timer.start();

  for (int i=0; i<zombies.length; i++) {
    zombies[i] = new Zombie();
  }
  for (int i=0; i<walls.length; i++) {
    walls[i]=new Wall(600, 100, 1000);
  }
}

void draw() {
  iteration++;
  background(0, 0, 128);
  fill(255, 0, 0);
  ellipse(e1, 1500, 100, 100);
  ellipse(e2, 1500, 100, 100);
  ellipse(e3, 1500, 100, 100);
  fill(0, 255, 0);
  rect(width/2-20, 0, 100, 100);

  for (int i=0; i<walls.length; i++) {
    walls[i].display();
    walls[i].move();
    if (runner.hit(walls[i])) {
      runner.reset();
    }
  }

  runner.display();
  runner.speed();
  runner.move();
  resetButton.display();

  if (timer.isFinished(tc)) {
    tc++;
    if ((zombies.length/20)*(tc)>zombies.length) {
      tc=zombies.length/10;
    }
  }
  
  for (int i=0; i<(zombies.length/20)*(tc); i++) {
    zombies[i].move();
    zombies[i].display();
    zombies[i].speed();
    if (iteration>(it+50)) {
      if (zombies[i].hit(runner)) {
        runner.bleed();
        eN++;
        if (eN==1) { 
          it=iteration;
          e3=10000;
        }
        if (eN==2) { 
          e2=10000; 
          it=iteration;
        }
        if (eN==3) { 
          e1=10000; 
          it=iteration;
        }
      }
    }
  }
  if (eN>3) {
    if (kj==0) {
      timer2.start();
      kj++;
    }

    fill(255, 0, 0);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Game Over", width/2, height/2);

    if (timer2.isFinished(1)) {
      setup();
      eN=0;
      iteration=0;
      it=0;
      tc=0;
      e1=100;
      e2=200;
      e3=300;
      kj=0;
    }
  }

  if (runner.x>width/2-20 && runner.x<width/2+80 && runner.y>0 && runner.y<100) {
    fill(0, 255, 0);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("YOU WIN!", width/2, height/2);
  }
}

void mousePressed() {
  for (int i=0; i<zombies.length; i++) {
    zombies[i].death(mouseX, mouseY);
  }
  resetButton.click(mouseX, mouseY);
  if (resetButton.on) {
    eN=0;
    iteration=0;
    it=0;
    tc=0;
    e1=100;
    e2=200;
    e3=300;
    kj=0;
  }
}
