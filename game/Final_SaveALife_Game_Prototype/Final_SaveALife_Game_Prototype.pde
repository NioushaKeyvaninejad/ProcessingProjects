Runner runner;
Zombie[] zombies ;
Wall[] walls;
Timer timer;
Button resetButton;


//int m=3;
float x=100;
int e1=100;
int e2=200;
int e3=300;
int eN=0;
int yy=0;
int iteration=0;
int it=0;
int time;
void setup() {
  size(2000, 1600);
  time=millis();
  zombies = new Zombie[10];
  runner = new Runner();
  resetButton = new Button(25, 1525);
  walls = new Wall[1];
  timer=new Timer(500);
  timer.start();

  for (int i=0; i<zombies.length; i++) {
    zombies[i] = new Zombie();
  }
  for (int i=0; i<walls.length; i++) {
    walls[i]=new Wall(600, 100, 1000);
  }
  //for (int i=0; i<lives.length; i++) {
  //lives[i] = new Lives(100);
  // }
}





void draw() {
  iteration++;
  //print(iteration,"  ");
  background(0, 0, 128);
  fill(255, 0, 0);
  ellipse(e1, 1500, 100, 100);
  ellipse(e2, 1500, 100, 100);
  ellipse(e3, 1500, 100, 100);

  //  for (int i=0; i<lives.length; i++) {
  //  lives[i].display(mn);
  // }

  timer.start();
  for (int i=0; i<walls.length; i++) {
    walls[i].display();
    walls[i].move();
    //////  if (iteration>(it+50)) {

    if (runner.hit(walls[i])) {

      // yy++;
      // if (yy==1) {
      runner.reset();



      //runner.move();
      //  yy=0;
      // }
      ///// if (yy==2) {
      /////    it=iteration;
      /////    e2=10000;
      /////   }
      ///// if (yy==3) {
      /////    it=iteration;
      /////    e1=10000;
      /////     }  
      //    mn++;
      //   print(mn, "   ");

      //lives[i].display(mn);
      ///// }
    }
  }
  print(runner.x, "  ");
  runner.display();
  runner.speed();
  runner.move();

  resetButton.display();
  //runner.setLocation(width/2,height-100);

  for (int i=0; i<zombies.length; i++) {
    //TIMERRRRR if (timer.isFinished()){
    zombies[i].move();
    zombies[i].display();
    zombies[i].speed();

    if (iteration>(it+50)) {
      if (zombies[i].hit(runner)) {
        runner.bleed();
        //fill(255,0,0);
        //textSize(100);
        //textAlign(CENTER,CENTER);
        //text("Game Over",width/2,height/2);
        eN++;
        if (eN==1) { 
          it=iteration;
          e3=10000; 
          //eN=1;
        }
        if (eN==2) { 
          e2=10000; 
          it=iteration;
        }
        if (eN==3) { 
          e1=10000; 
          it=iteration;
        }
        if (eN>3) {
          if ( millis() < time + 2000) {
            fill(255, 0, 0);
            textSize(100);
            textAlign(CENTER, CENTER);
            text("Game Over", width/2, height/2);
          }

          // setup();
        }
        /////      runner.reset();
        /////   for (int i=0; i<zombies.length; i++) { 
        ///// zombies[i].reset();}
        //TIMERRRR }
      }


      //runner.reset();
      //setup();
    }
    //TIMERRRR  timer.start();
  }
}



void mousePressed() {
  for (int i=0; i<zombies.length; i++) {
    zombies[i].death(mouseX, mouseY);
  }
  resetButton.click(mouseX, mouseY);
}
