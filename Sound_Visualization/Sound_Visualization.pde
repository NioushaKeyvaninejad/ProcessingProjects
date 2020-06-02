
//https://processing.org/reference/libraries/sound/FFT.html
//Shiffman-pg:458
import processing.sound.*;

FFT fft;
SoundFile song;

int bands = 512;
float[] spectrum = new float[bands];

void setup() {
  size(512, 360);
  background(255);
  song = new SoundFile(this, "songg.mp3");
  song.loop();
  fft = new FFT(this, bands);

  fft.input(song);
}      

void draw() { 
  background(255);
  fft.analyze(spectrum);
  for (int i = 0; i < bands; i++) {

    float m = map(spectrum[i]*height*5, 0, 100, 0.9, 1.1);

    curve(0, m*height/4, m*width/4, m*3*height/4, m*3*width/4, m*3*height/4, width, m*height/4);
    print(spectrum[i]*height*5, " ");
  }
}
