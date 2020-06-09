//https://processing.org/reference/libraries/sound/FFT.html
//Shiffman-pg:458
//http://code.compartmental.net/minim/fft_method_getband.html



import ddf.minim.*;
//import ddf.minim.ugens.*; //https://forum.processing.org/two/discussion/28028/how-do-i-record-the-audio-input-to-a-new-audio-render-using-minim
import ddf.minim.analysis.*;

Minim minim;
FFT fft;
AudioPlayer song;

Button[] chooseAsong;
Button2 backButton;
//AudioIn in;
//int bands = 512;
//float[] spectrum = new float[bands];
boolean startApp=false;
int mm=0, nn=0;
AudioInput in;//http://code.compartmental.net/minim/audioinput_class_audioinput.html

void setup() {
  minim = new Minim(this);

  in = minim.getLineIn();/////////////////////
  size(800, 600);
  backButton = new Button2(350, 550);
  chooseAsong = new Button[3];
  for (int i=0; i<chooseAsong.length; i++) {
    chooseAsong[i] = new Button(200+(i*200), 350);
  }
  song = minim.loadFile( "song1.mp3");
  fft = new FFT(song.bufferSize(), song.sampleRate());
}
void draw() { 
  background(255);
  for (int i=0; i<chooseAsong.length; i++) {
    chooseAsong[i].display();
    if (chooseAsong[i].on) {
      background (200, 60, 80);
      backButton.display();
    }
  }
  if (chooseAsong[0].on) {
    if (mm==0) {
      mm=1;
      song.close();

      song = minim.loadFile( "son1.mp3");
      song.play();
    }

    fft.forward( song.mix );
    for (int i = 0; i < fft.specSize(); i++)
    {
      // draw the line for frequency band i, scaling it up a bit so we can see it
      line( i, height, i, height - fft.getBand(i)*8 );
    }
  }
  if (chooseAsong[1].on) {
    if (nn==0) {
      //setup();
      nn=1;
      if (song.isPlaying()) {
        song.close();
      }
      song = minim.loadFile( "song2.mp3");
      song.play();
    }

    //fft = new FFT(song.bufferSize(), song.sampleRate());
    fft.forward(song.mix );
    for (int i = 0; i < fft.specSize(); i++)
    {
      // draw the line for frequency band i, scaling it up a bit so we can see it
      line( i, height, i, height - fft.getBand(i)*8 );
    }
  }
}

void keyPressed() {
  if (key== ' ') {
    startApp=true;
  }
}
void mousePressed() {

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
        backButton.display();
      }
      break;
    }
  }
