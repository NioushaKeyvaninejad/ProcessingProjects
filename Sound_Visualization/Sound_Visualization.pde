//https://processing.org/reference/libraries/sound/FFT.html
//Shiffman-pg:458
//http://code.compartmental.net/minim/fft_method_getband.html



import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
FFT fft;
AudioPlayer song;

Button[] chooseAsong;
//AudioIn in;
//int bands = 512;
//float[] spectrum = new float[bands];
boolean startApp=false;
int mm=0;

void setup() {
  minim = new Minim(this);

  size(512, 200);
  chooseAsong = new Button[3];
   for (int i=0; i<chooseAsong.length; i++) {
    chooseAsong[i] = new Button(30,50,90,50);
  }
  //if (!startApp) {
  background(255, 0, 0);
  // } else {
 // print(chooseSong1.on);
  // }
}
void draw() { 
  //background(255);

  //if (startApp) {
  background(255);
   for (int i=0; i<chooseAsong.length; i++) {
  
     chooseAsong[i].display();
  
  //print(startApp);
  if (mm==0) {
    setup();
    mm=1;
  }}
  //song.loop();
 // print(mm);
  //print(startApp);
  if (chooseAsong[1].on) {
    // print(chooseSong1.on);
    // if (mm==1) {
    //  setup();
    //  mm=2;
    //}

    //print(chooseSong1.on);
    if (mm==1) {//we want the song to be played only once
      song = minim.loadFile( "songg.mp3");
      song.loop();
      fft = new FFT(song.bufferSize(), song.sampleRate());

      // fft.input(song);
      mm=2;
    }



   // fft.analyze(spectrum);
    fft.forward( song.mix );
     for(int i = 0; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i, scaling it up a bit so we can see it
    line( i, height, i, height - fft.getBand(i)*8 );
  }
    //for (int i = 0; i < bands; i++) 
    //  float m = map(spectrum[i]*height*5, 0, 100, 0.9, 1.1);    
   //  curve(0, m*height/4, m*width/4, m*3*height/4, m*3*width/4, m*3*height/4, width, m*height/4);
    
    
  }
  //}
}

void keyPressed() {
  if (key== ' ') {
    startApp=true;
  }
}
void mousePressed() {
  //throw them away
  chooseAsong[1].click(mouseX, mouseY);              //if clicked on reset button,
  if (chooseAsong[1].on) {                           //Game resets
    //setup();
    //print(chooseSong1.on);
  }
}
