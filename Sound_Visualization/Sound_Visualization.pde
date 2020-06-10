//https://processing.org/reference/libraries/sound/FFT.html
//Shiffman-pg:458
//http://code.compartmental.net/minim/fft_method_getband.html
//https://www.openprocessing.org/sketch/842608
//https://forum.processing.org/two/discussion/28028/how-do-i-record-the-audio-input-to-a-new-audio-render-using-minim
//*: //http://code.compartmental.net/minim/audioinput_class_audioinput.html

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;

Particle[] particles ;
FFT fft;
FFT fft2;
AudioPlayer song;

Button[] chooseAsong;
Button2 backButton;

boolean startApp=false;
int mm=0, nn=0, kk=0;
int particlesNum = 500;
int lapse = 0;

float[] speed = new float[particlesNum]; 
AudioSource in;    //*
void setup() {
  size(800, 600);

  particles = new Particle[particlesNum];         
  for (int i=0; i<particles.length; i++) {
    particles[i] = new Particle();
  }

  minim = new Minim(this);

  in = minim.getLineIn();/////////////////////
  backButton = new Button2(350, 550);
  chooseAsong = new Button[3];
  for (int i=0; i<chooseAsong.length; i++) {
    chooseAsong[i] = new Button(200+(i*200), 350);
  }

  song = minim.loadFile( "song1.mp3");
  //song.play();
  fft = new FFT(song.bufferSize(), song.sampleRate());
  in = minim.getLineIn();

  fft2 = new FFT(in.bufferSize(), in.sampleRate());
}
void draw() { 
  //background(255);

  //if (startApp) {
  background(255);
  for (int i=0; i<chooseAsong.length; i++) {
    chooseAsong[i].display();
    if (chooseAsong[i].on) {

      background (200, 60, 80);


      for (int j = 0; j < particles.length; j++) {
        particles[j].move(speed[j]);
        particles[j].display();
      }
      backButton.display();
    }
  }
  if (chooseAsong[0].on) {
    if (mm==0) {
      mm=1;
      song.close();
      song = minim.loadFile( "song1.mp3");
      song.play();
    }

    fft.forward( song.mix );
    for (int i = 0; i < particlesNum; i++)
    {
      print(fft.specSize(), "  ");
      speed[i]=fft.getBand(i)*8;
    }
  }
  if (chooseAsong[1].on) {
    print("kmkm");
    if (nn==0) {
      //setup();
      nn=1;
      if (song.isPlaying()) {
        song.close();
      }
      song = minim.loadFile( "song2.mp3");
      song.play();
    }
    fft.forward(song.mix );
    for (int i = 0; i < fft.specSize(); i++)
    {
      // draw the line for frequency band i, scaling it up a bit so we can see it
      line( i, height, i, height - fft.getBand(i)*8 );
    }
  }
  if (chooseAsong[2].on) {
    //print("onnn");
    if (kk==0) {
      kk=1;
      //in.close();
      song.close();
      in = minim.getLineIn();
      print(" nm bb ");
      //in.enableMonitoring();
    }
    fft2.forward(in.mix );

    for (int i = 0; i < fft2.specSize(); i++)
    {
      // draw the line for frequency band i, scaling it up a bit so we can see it
      line( i, height, i, height - fft2.getBand(i)*8);
    }
  }
}
void mousePressed() {
  if (frameCount - lapse > 15) {
    //save('pix.jpg');
    lapse = frameCount;
  }



  backButton.click(mouseX, mouseY);

  if (backButton.on) {
    song.close();
    setup();
  }
  for (int i=0; i<chooseAsong.length; i++) {
    chooseAsong[i].click(mouseX, mouseY);
    if (chooseAsong[i].on) {
      for (int j=0; j<chooseAsong.length; j++) {
        chooseAsong[j].disappear();
      }
      backButton.display();

      break;
    }
  }
}
