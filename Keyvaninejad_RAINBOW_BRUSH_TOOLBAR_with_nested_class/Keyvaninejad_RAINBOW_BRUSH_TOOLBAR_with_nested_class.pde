//Hi, Here is the updated version of the RAINBOW BRUSH with new features. 
//A new toolbar is added next to a canvas, where you can draw on. On the toolbar,
//you will find a 'reset' button on top and some other buttons for changing the brush
//color. You can have two or more colors at the same time!
//Don't forget that you can easily use the slider to make each circle of the brush
//bigger or smaller. The brush is composed of tiny circles that can also get bigger 
//or smaller in number with UP and DOWN arrowkeys. You can also move your mouse 
//faster to make the brush smaller. You can change the color of the brush by
//pressing(&& holding) the first letter of these colos: red, green, blue,pink, orange,
//white, yellow. For black press "k". If you got tired of your drawing, press DELETE
//and start over again.
//References:
//https://www.youtube.com/watch?v=SU4WRLKZ-Js
//https://forum.processing.org/one/topic/using-the-mouse-speed.html
//https://processing.org/examples/scrollbar.html
//http://learningprocessing.com/exercises/chp09/exercise-09-08-array-buttons


Brush brush;
Brush brush2;
Slider slider;
Button[] buttons = new Button[9];

int x = 100;
int y = 750;
int w = 40;
int h = 20;
int col;
int counter=0;
float width=1200;
float height=800;
float circleBrushSize=5;
boolean buttonclicked=false;

void setup() {
  strokeWeight(1);
  size(1200, 800);
  background(240);
  fill(255);
  rect(0, 0, 200, 800);
  stroke(0);
  line (200, 770, 1200, 770);
  stroke(0);
  line(190, 0, 190, 800);
  fill(251);
  rect(0, 370, 190, 450);  //toolbar design
  slider = new Slider(500, 760, 400, 30, 1);
  brush = new Brush(15); //number of circles
  buttons[0] = new Button(50, 150, 100, 100);
  for (int i = 1; i < buttons.length; i++) {
    buttons[i] = new Button(80, i*50+350, 40, 20);
  }
}

void draw() {
  strokeWeight(4); 
  slider.Display();
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display(i);
  }
  if (mouseX > 200 && mouseX < width && mouseY < 730) {
    if (buttonclicked==false) {
      brush.Start(circleBrushSize) ;
      brush.Size(); //UP && DOWN arrow keys.
      brush.BrushColor(circleBrushSize); //by pressing the first letter of aforementioned colors
      brush.TryAgain(); //by pressing DELETE
    } else {
      if (buttons[0].on) {  //Reset button on toolbar
        setup();
      }
      //color of the brush by pressing each button on toolbar:
      if (buttons[1].on) {     
        buttons[1].Start_func3(255, 0, 0, circleBrushSize, brush);
      }
      if (buttons[2].on) {  
        buttons[2].Start_func3(0, 255, 0, circleBrushSize, brush);
      }
      if (buttons[3].on) {   
        buttons[3].Start_func3(0, 0, 255, circleBrushSize, brush);
      }
      if (buttons[4].on) {   
        buttons[4].Start_func3(255, 255, 0, circleBrushSize, brush);
      }
      if (buttons[5].on) {   
        buttons[5].Start_func3(0, 0, 0, circleBrushSize, brush);
      }
      if (buttons[6].on) {   
        buttons[6].Start_func3(255, 69, 0, circleBrushSize, brush);
      }
      if (buttons[7].on) {   
        buttons[7].Start_func3(255, 192, 203, circleBrushSize, brush);
      }
      if (buttons[8].on) {   
        buttons[8].Start_func3(255, 255, 255, circleBrushSize, brush);
      }
    }
  }
  slider.Update();
  circleBrushSize=slider.Update();
  circleBrushSize = map(circleBrushSize, 500, 870, 5, 50); 
}

void mousePressed() {   //if none of the buttons are clicked, it keeps the main rainbow color of the brush.
  counter=0;
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].click(mouseX, mouseY);
    if (buttons[i].on==false) {
      counter++;
    }
  }
  if (counter==buttons.length)
  {
    buttonclicked=false;
  } else {
    buttonclicked=true;
  }
}
