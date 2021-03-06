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

int e1=150;                //ellipse1.x
int e2=250;                //ellipse2.x
int e3=350;                //ellipse3.x
int eN=0;
int iteration=0;
int it=0;
int tc=0;                  //zombie release timer/counter
int kj=0;                  //"Game over" txt timer/counter
PImage bg;
boolean gameStarted;       
PImage StartScreenImage;
PImage livesImage;

void setup() {
  size(2000, 1600);
  bg = loadImage("Final Background.jpg");
  livesImage = loadImage("heart.png");
  zombies = new Zombie[200];              // An array of 200 zombies
  runner = new Runner();
  resetButton = new Button(30, 1485);
  walls = new Wall[1];                    
  timer=new Timer(5000);                  //release zombies every 5"
  timer2=new Timer(2000);                 //keep "Game Over" txt for 2"
  timer.start();

  for (int i=0; i<zombies.length; i++) {
    zombies[i] = new Zombie();
  }
  for (int i=0; i<walls.length; i++) {
    walls[i]=new Wall(600, 100, 1000);
  }
  gameStarted = false;
  StartScreenImage= loadImage("StartScreenImage.jpg");
}

void draw() {
  background(bg);
  if (!gameStarted) {
    image(StartScreenImage, 0, 0);
  } else {
    iteration++;                           //for having a delay 
    image(livesImage, e1, 1500);          //lives prototype
    image(livesImage, e2, 1500);
    image(livesImage, e3, 1500);

    for (int i=0; i<walls.length; i++) {
      walls[i].display();
      walls[i].move();
      if (runner.hit(walls[i])) {          //if runner hits a wall
        runner.reset();
      }
    }

    runner.display();
    runner.move();
    resetButton.display();

    if (timer.isFinished(tc)) {                           //release of zombies
      tc++;
      if ((zombies.length/20)*(tc)>zombies.length) {
        tc=zombies.length/10;
      }
    }

    for (int i=0; i<(zombies.length/20)*(tc); i++) {
      zombies[i].move();
      zombies[i].display();
      if (iteration>(it+50)) {                            //for delay in removing hearts
        if (zombies[i].hit(runner)) {                     //if runner hits a zombie
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

      if (timer2.isFinished(1)) {                     //after "Game Over" txt for 2"
        setup();                                      //Game resets
        eN=0;
        iteration=0;
        it=0;
        tc=0;
        e1=150;
        e2=250;
        e3=350;
        kj=0;
      }
    }
    //if runner is in the Island, show "You Win!" txt
    if (runner.x>width/2-50 && runner.x<width/2+50 && runner.y>0 && runner.y<100) {
      fill(0, 255, 0);
      textSize(100);
      textAlign(CENTER, CENTER);
      text("YOU WIN!", width/2, height/2);
    }
  }
}
void mousePressed() {
  for (int i=0; i<zombies.length; i++) {              
    zombies[i].death(mouseX, mouseY);             //if mouseclick on zombies,
  }                                               //throw them away
  resetButton.click(mouseX, mouseY);              //if clicked on reset button,
  if (resetButton.on) {                           //Game resets
    eN=0;
    iteration=0;
    it=0;
    tc=0;
    e1=150;
    e2=250;
    e3=350;
    kj=0;
  }
}

void keyPressed() {
  if (key== ' ') {
    gameStarted=true;
  }
}
