import processing.serial.*;

//Constructor	
//Serial(parent)
//Serial(parent, rate)
//Serial(parent, name)
//Serial(parent, name, rate)
//Serial(parent, name, rate, parity, databits, stopbits)
//
//Parameters	
//parent        PApplet: typically use "this"
//name	        String: name of the port (COM1 is the default)
//rate	        int: 9600 is the default
//parity	char: 'N' for none, 'E' for even, 'O' for odd ('N' is the default)
//databits	int: 8 is the default
//stopbits	float: 1.0, 1.5, or 2.0 (1.0 is the default)
//
//Methods	
//available()	    Returns the number of bytes in the buffer waiting to be read
//read()	    Returns the next byte from the buffer
//readChar()	    Returns the next byte in the buffer as a char
//readBytes()	    Reads everything in the buffer
//readBytesUntil()  Reads from the buffer of bytes up to and including a particular character
//readString()	    Returns the buffer as a String
//readStringUntil() Returns the buffer as a String up to and including a particular character
//buffer()	    Sets the number of bytes to buffer before calling serialEvent()
//bufferUntil()	    Sets a specific byte to buffer to before calling serialEvent()
//last()	    Returns last byte received
//lastChar()	    Returns the last byte received as a char
//write()	    Writes bytes, chars, ints, bytes[], Strings
//clear()	    Clears the buffer
//stop()	    Stops communicating
//list()	    Returns the available ports
Serial myPort;

void setup()
{
  size(200,200);
  
  // List all the available serial ports:
  println(Serial.list());
  
  /*  I know that the first port in the serial list on my mac
  is always my  Keyspan adaptor, so I open Serial.list()[0].
  Open whatever port is the one you're using.
  */
  myPort = new Serial(this, Serial.list()[0], 9600, 'N', 8, 1.0);
  
  // Send a capital A out the serial port:
 // myPort.write('A');
  //myPort.write('B');
  //myPort.write('C');
  //myPort.write('D');
  //myPort.write("Hello,wolrd!");
}

void draw()
{
   while (myPort.available() > 0) 
   {
    int inByte = myPort.read();
    println(inByte);
  }
}
