import ddf.minim.*;
import ddf.minim.analysis.*;

Minim         minim;

//AudioInput    lineIn;
AudioPlayer   lineIn;
BeatDetect    beat;

FFT           fft;

PImage        kyy;
int           life;

final int max_life = 10;
final int buffer_size = 512;

void setup()
{
  size(750, 300, P2D);
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
  
  // load image
  kyy = loadImage("kyy-1.png");
}

void draw()
{
  background(0);
  colorMode(HSB);
  
  // detect beat and refill life
  beat.detect(lineIn.mix);
  
  if ( beat.isOnset() ) {
    life = max_life;
  } 
  
  if (life > 0) {
    life--;
    
    // show fireworks (Layer 1)
    for (int i = 0; i < 100; i++) {
      noStroke();
      fill(random(255), 150, 150, map(life, 0, max_life, 50, 255));
      ellipse(random(width), map(life, 0, max_life, height - 100, 100) + random(-100, 100), 10, 10);
    }
  }
  
  // show image (Layer 2)
  tint(50, 100, 50);
  image(kyy, 70, 50);
  
  // below two images are for 'phase effect'
  if (life > 8) {
    tint(100, 120, map(life, 0, max_life, 100, 250));
    image(kyy, 70 + life + 2, 50 - life - 2);
  }
  
  if (life > 6) {
    tint(200, 120, map(life, 0, max_life, 100, 250));
    image(kyy, 70 + life - 2, 50 - life - 2);
  }
  
  tint(50, 120, map(life, 0, max_life, 100, 250));
  image(kyy, 70 + life, 50 - life);


  // show fft (Layer 3)
  stroke(255);
  fill(255);
  fft.forward( lineIn.mix );
  
  for (int i = 0; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i, scaling it up a bit so we can see it
    rect( i*20, height - fft.getBand(i)*2, 5, height - fft.getBand(i)*2 ); // getBand(i)
  }  
  

  
}
