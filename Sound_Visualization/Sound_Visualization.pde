//Songs Ref.: 
//https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/July_2019/Yung_Kartz_-_07_-_Frontline.mp3

//References:
//https://processing.org/reference/libraries/sound/FFT.html
//Shiffman-pg:458
//http://code.compartmental.net/minim/fft_method_getband.html
//https://www.openprocessing.org/sketch/842608
//https://forum.processing.org/two/discussion/28028/how-do-i-record-the-audio-input-to-a-new-audio-render-using-minim
//*: //http://code.compartmental.net/minim/audioinput_class_audioinput.html

//Importing Minim Library:
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;           //*
FFT fft;                 //For Audio
FFT fft2;                //For Songs
Particle[] particles ;
AudioPlayer song;
Button[] chooseAsong;    //Main buttons
Button2 backButton;

boolean startApp=false;
int mm=0, nn=0, kk=0;   //I defined these counters to make sure each song will be played once and it will close the previous playing song
int particlesNum = 200; //Number of moving particles
int lapse = 0;
int ll=0, bb=0, dd=0;   //These has been used to allocate each song frequencies to a random particle 
int xx=0;
float[] speed = new float[particlesNum]; 

void setup() {
  minim = new Minim(this);
  in = minim.getLineIn();   //Getting an AudioInput
  fft = new FFT( in.bufferSize(), in.sampleRate() );  //Audio
  size(800, 600);
  particles = new Particle[particlesNum];         
  for (int i=0; i<particles.length; i++) {
    particles[i] = new Particle();
  }
  backButton = new Button2(350, 550);
  chooseAsong = new Button[3]; //Three main buttons
  for (int i=0; i<chooseAsong.length; i++) {
    chooseAsong[i] = new Button(200+(i*200), 350);
  }
  song = minim.loadFile( "Yung_Kartz_-_07_-_Frontline.mp3"); //First song
  fft2 = new FFT(song.bufferSize(), song.sampleRate());       //Songs
}

void draw() { 
  background(255);
  for (int i=0; i<chooseAsong.length; i++) {
    chooseAsong[i].display();
    if (chooseAsong[i].on) {   //Changing background and showing particles.
      background (200, 60, 80);
      for (int j = 0; j < particles.length; j++) {
        particles[j].move(speed[j]);
        particles[j].display();
      }
      backButton.display();
    }
  }
  if (chooseAsong[0].on) {     //If the first button was clicked (playing the first song once)
    if (mm==0) {
      mm=1;
      song.close();
      song = minim.loadFile( "Yung_Kartz_-_07_-_Frontline.mp3");
      song.play();
    }
    //getting frequencies and giving it to particles' speed (2 different groups):
    fft2.forward( song.mix );        
    ll=floor(random(particlesNum));  //Rounding the random number
    for (int i = ll; i < particlesNum; i++)
    {
      speed[i-ll]=map(fft2.getBand(i)*8, 0, 20, 0, 3);
    }
    for (int i = 0; i < ll; i++)
    {
      speed[i+particlesNum-ll]=map(fft2.getBand(i)*8, 0, 20, 0, 3);
    }
  }
  if (chooseAsong[1].on) {
    if (nn==0) {
      nn=1;
      if (song.isPlaying()) {
        song.close();
      }
      song = minim.loadFile( "Yung_Kartz_-_05_-_Picture_Perfect.mp3");   //second song
      song.play();
    }
    fft2.forward( song.mix );                 //Same thing for the second song
    bb=floor(random(particlesNum));
    for (int i = bb; i < particlesNum; i++)
    {
      speed[i-bb]=map(fft2.getBand(i)*8, 0, 20, 0, 3);
    }
    for (int i = 0; i < bb; i++)
    {
      speed[i+particlesNum-bb]=map(fft2.getBand(i)*8, 0, 20, 0, 3);
    }
  }
  if (chooseAsong[2].on) {  //Third button (Audio)
    if (kk==0) {
      kk=1;
    }
    stroke(255, 0, 0);
    fft.forward( in.mix );
    dd=floor(random(particlesNum));
    for (int i = dd; i < particlesNum; i++) {
      speed[i-dd]=map(fft.getBand(i)*8, 0, 20, 0, 50);
    }
    for (int i = 0; i < dd; i++) {
      speed[i+particlesNum-dd]=map(fft.getBand(i)*8, 0, 20, 0, 50);
    }
  }
}

void mousePressed() {               //For back button function
  backButton.click(mouseX, mouseY);
  if (backButton.on) {
    song.close();
    in.close();
    for (int i=0; i<chooseAsong.length; i++) {
      chooseAsong[i].on=false;
    }
    mm=0;
    nn=0;
    kk=0;
    setup();
  }
  for (int i=0; i<chooseAsong.length; i++) {        //When a button was clicked, shows the back button and disappear other buttons on the main menu.
    chooseAsong[i].click(mouseX, mouseY);
    if (chooseAsong[i].on) {
      for (int j=0; j<chooseAsong.length; j++) {
        chooseAsong[j].disappear();
      }
      backButton.display();
      break;            //To reduce latency
    }
  }
}
