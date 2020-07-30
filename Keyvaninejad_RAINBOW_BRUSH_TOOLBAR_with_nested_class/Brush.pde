class Brush {
  float mx;
  float my;
  float x;
  float y;
  float Default; //stroke size of the circles
  float sd; //variance
  float opacity=80;
  float speed; //mouse speed
  float circleSize;
  import java.util.Random; //Gaussian Random from Java
  Random generator;

  Brush(float tempS) {
    sd = tempS;
    generator = new Random();
  }

  void Start_func(int col1, int col2, int col3, float Default) {  //I made a copy of void start as a function to use it for my other voids such as void changeColor (and other classes)
    if (mousePressed) {
      float x = (float) generator.nextGaussian();
      speed = abs(mouseX-pmouseX) + abs(mouseY-pmouseY);//got it from here https://forum.processing.org/one/topic/using-the-mouse-speed.html
      if (speed>50) {
        sd=sd*0.5;  //making variance smaller by mouse speed
      }
      float mean =mouseX;
      x = (x*sd)+ mean; //somehow I can say mapping sd in the right position (from Shiffman videos) 
      float y = (float) generator.nextGaussian();
      float mean2 =mouseY;
      y = (y*sd)+ mean2; //same thing for Y
      for (int i = 0; i < 5; i++) {
        stroke(col1, col2, col3, opacity);
        strokeWeight(Default);
        noFill();
        x = constrain(x, 200, 1200);
        y = constrain(y, 0, 700);
        circle(x, y, 8); //main components of the brush
      }
    }
    if (speed>50) { //for returning to default 
      sd=sd/0.5;
    }
  }
  
  void Start(float Default) { //main void start (Default connects to Slider)
    if (mousePressed) {
      float x = (float) generator.nextGaussian();
      speed = abs(mouseX-pmouseX) + abs(mouseY-pmouseY);//got it from here https://forum.processing.org/one/topic/using-the-mouse-speed.html
      if (speed>50) {
        sd=sd*0.5;
      }
      float mean =mouseX;
      x = (x*sd)+ mean;
      float y = (float) generator.nextGaussian();
      float mean2 =mouseY;
      y = (y*sd)+ mean2;
      if (keyPressed==false || (keyPressed==true && key != 'r' && key != 'g' && key != 'b' && key != 'k' && key != 'w' && key != 'p' && key != 'o' && key != 'y')) {
        for (int i = 0; i < 5; i++) {
          float r1 = random(255);
          float r2 = random(255);
          float r3 = random(255);
          stroke(r1, r2, r3, opacity);
          strokeWeight(Default);
          noFill();
          x = constrain(x, 200, 1200);  
          y = constrain(y, 0, 760);
          circle(x, y, 8);
        }
      }
    }
    if (speed>50) {
      sd=sd/0.5;
    }
  }
  
  void Size() { //Size change of the brush (with Arrow keys)
    if (keyPressed==true) {
      if (keyCode == UP) {
        sd=sd+0.9;
      }
      if (keyCode == DOWN) {
        sd=sd-0.9;
        if (sd<0) {
          sd=0;
        }
      }
    }
  }

  void BrushColor(float Default) { //color change of the brush (keyboard)
    if ((keyPressed == true) && (key == 'r')) { 
      Start_func(255, 0, 0, Default);
    }
    if ((keyPressed == true) && (key == 'g')) {   
      Start_func(0, 255, 0, Default);
    }
    if ((keyPressed == true) && (key == 'b')) {   
      Start_func(0, 0, 255, Default);
    }
    if ((keyPressed == true) && (key == 'y')) {   
      Start_func(255, 255, 0, Default);
    }
    if ((keyPressed == true) && (key == 'k')) {   
      Start_func(0, 0, 0, Default);
    }
    if ((keyPressed == true) && (key == 'o')) {   
      Start_func(255, 69, 0, Default);
    }
    if ((keyPressed == true) && (key == 'p')) {   
      Start_func(255, 192, 203, Default);
    }
    if ((keyPressed == true) && (key == 'w')) {   
      Start_func(255, 255, 255, Default);
    }
  }
  
  void TryAgain() { //for clearing canvas 
    if (keyPressed==true) {
      if (key == DELETE) {
        setup();
      }
    }
  }
}
