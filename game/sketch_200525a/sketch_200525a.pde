Runner runner;
Zombie zombie;



void setup(){
  size(2000,1600);
 
  runner = new Runner();
  zombie = new Zombie();
}

void draw(){
   background(0,0,128);
  runner.display();
  runner.speed();
 // runner.setLocation(width/2,height-100);
  zombie.move();
  zombie.display();
  zombie.speed();
  if (zombie.hit(runner)){
    runner.bleed();
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
}
