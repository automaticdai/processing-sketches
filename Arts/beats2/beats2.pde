import ddf.minim.*;
import ddf.minim.analysis.*;

Minim         minim;

//AudioInput    lineIn;
AudioPlayer   lineIn;
BeatDetect    beat;

FFT           fft;

int           life;
float         phase_offset;

final int max_life = 10;
final int buffer_size = 512;

void setup()
{
  size(800, 800, P2D);
  minim = new Minim(this);
  
  // load music file or lineIn 
  lineIn = minim.loadFile("123.mp3", buffer_size);
  lineIn.play();
  //lineIn = minim.getLineIn(minim.STEREO, buffer_size);
  
  // a beat detection object song SOUND_ENERGY mode with a sensitivity of 10 milliseconds
  beat = new BeatDetect();
  
  // create FFT
  fft = new FFT( lineIn.bufferSize(), lineIn.sampleRate() );
  //fft.linAverages(30);
  
}

void draw()
{
  background(0);
  colorMode(HSB);
  
  // detect beat and refill life
  beat.detect(lineIn.mix);
  
  if ( beat.isOnset() ) {
    life = max_life;
    phase_offset += random(-1.3,+1.3);
  } 
  
  if (life > 0) {
    life--;
  }
  
  // show fft (Layer 2)
  stroke(255);
  noFill();
  
  translate(width/2, height/2);
  fft.forward(lineIn.mix);
  
  beginShape();
  float radians_step = TWO_PI / fft.specSize();
  for (int i = 0; i < fft.specSize(); i++) {
    float r_i = fft.getBand(i) * 20 * (i/100.0) + 100;
    //r_i = constrain(r_i, 0.0, 400.0);
    vertex(0.8 * r_i * sin(radians_step * i + phase_offset), 
           0.8 * r_i * cos(radians_step * i + phase_offset) );
  }
  endShape(CLOSE);
  
}