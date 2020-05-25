class Zombie{
  
  float x;
  float y;
  float xpos=width/2;
  float ypos=height/2;
  float xspeed;
  float yspeed;
  
  
Zombie(){
  xspeed = random(-10,10);
  yspeed = random(-5,5);
  
}
  
  
  
  void move() {
x += xspeed;
y += yspeed;
if(x>width || x<0){
  xspeed*=-1;
}
if(y>height || y<0){
  yspeed*=-1;
}
}
  
  void display(){
    fill(0);
    ellipse(x,y,100,100);
    
  }
  
  
  void speed(){
    
  }
  
  
  
  boolean hit(Runner runner){
    float distance = dist(x,y,runner.x,runner.y);
    if (distance<100){
      return true;}
      else{
        return false;}
    
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
