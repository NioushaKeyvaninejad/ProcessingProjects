Runner runner;
//Zombie zombie;

Zombie[] zombies ;
Wall[] walls;

float x=100;
void setup() {
  size(2000, 1600);
  zombies = new Zombie[10];
  runner = new Runner();
    walls = new Wall[1];
  for (int i=0; i<zombies.length; i++) {
    zombies[i] = new Zombie();
  }
  for(int i=0;i<walls.length;i++){
    walls[i]=new Wall();
}}

void draw() {
  background(0, 0, 128);
   fill(255, 0, 0);
   for(int k=0; k<3;k++){
   ellipse(x+110*k,1550,100,100);
   }
  
 


  runner.display();
  runner.speed();
  runner.move();
    for(int i=0;i<walls.length;i++){
  walls[i].display();
  walls[i].move();
  if (runner.hit(walls[i])){
    
    
  }
  }
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
