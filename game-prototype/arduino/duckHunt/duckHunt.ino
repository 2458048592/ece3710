/* 
 Debounce
 
 Each time the input pin goes from LOW to HIGH (e.g. because of a push-button
 press), the output pin is toggled from LOW to HIGH or HIGH to LOW.  There's
 a minimum delay between toggles to debounce the circuit (i.e. to ignore
 noise).  
 
 The circuit:
 * LED attached from pin 13 to ground
 * pushbutton attached from pin 2 to +5V
 * 10K resistor attached from pin 2 to ground
 
 * Note: On most Arduino boards, there is already an LED on the board
 connected to pin 13, so you don't need any extra components for this example.
 
 
 created 21 November 2006
 by David A. Mellis
 modified 30 Aug 2011
 by Limor Fried
 
This example code is in the public domain.
 
 http://www.arduino.cc/en/Tutorial/Debounce
 */

// constants won't change. They're used here to 
// set pin numbers:

///////////////  LED PINS ///////////////////////////////
const int player1 = 4; 
const int player2 = 5;     // the number of the pushbutton pin

const int player1Sen = 2;
const int player2Sen = 3;  

const int ledPin1 =  13;      // the number of the LED pin
const int ledPin2 =  12;      // the number of the LED pin

////////////// Variables for button debounce ////////////////////
int ledState = LOW;         // the current state of the output pin
int buttonStatePlayer1;             // the current readingPlayer1 from the input pin
int buttonStatePlayer2;             // the current readingPlayer1 from the input pin
int lastbuttonStatePlayer1 = LOW;   // the previous readingPlayer1 from the input pin
int lastbuttonStatePlayer2 = LOW;   // the previous readingPlayer1 from the input pin

// the following variables are long's because the time, measured in miliseconds,
// will quickly become a bigger number than can be stored in an int.
long lastDebounceTimePlayer1 = 0;  // the last time the output pin was toggled
long lastDebounceTimePlayer2 = 0;  // the last time the output pin was toggled
long debounceDelay = 100;    // the debounce time; increase if the output flickers
int prevbuttonStatePlayer1;
int prevbuttonStatePlayer2;

/////////////////// Variables for sensor interupt   ///////////
const int senseDelay = 10; // how long to wait before turning off player states for sensor
const int sensorSerialDisplayTime = 200;
volatile long p1SenseTime = 0;
volatile long p2SenseTime = 0;

volatile int p1State = LOW;
volatile int p2State = LOW;

volatile long triggerSenseTime = 0;



// Variables will change:
long previousMillis = 0;        // will store last time LED was updated

// the follow variables is a long because the time, measured in miliseconds,
// will quickly become a bigger number than can be stored in an int.
long interval = 10;           // interval at which to display serial sensor outpu

void setup() {
  Serial.begin(9600);

  pinMode(player1, INPUT_PULLUP);
  pinMode(player2, INPUT_PULLUP);
  
  pinMode(player1Sen, INPUT_PULLUP);
  pinMode(player2Sen, INPUT_PULLUP);


  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);


  attachInterrupt(0, p1, RISING);
  attachInterrupt(1, p2, RISING);

}

void loop() {
  
  debounce();
  interupt();
  

 
  
  if (prevbuttonStatePlayer1 == 0 && buttonStatePlayer1 == 1) {
    Serial.println("1");
    triggerSenseTime = millis();
    triggerSenseTime = millis() + sensorSerialDisplayTime;

  }
  if (prevbuttonStatePlayer2 == 0 && buttonStatePlayer2 == 1) {
    Serial.println("2");
    triggerSenseTime = millis() + sensorSerialDisplayTime;

  }
  
  if (millis() < triggerSenseTime) {
 
    unsigned long currentMillis = millis();
  
    if(currentMillis - previousMillis > interval) {
      if (p1State) 
        Serial.println("3");
      else 
        Serial.println("4");
        
      if (p2State) 
        Serial.println("5");
      else 
        Serial.println("6");
      // save the last time you blinked the LED
      previousMillis = currentMillis;  
    }
  }
  else {
      triggerSenseTime = millis();
  }

}

void debounce() {
  /////////////// Debounce /////////////////////////
  // read the state of the switch into a local variable:
  int readingPlayer1 = digitalRead(player1);  
  int readingPlayer2 = digitalRead(player2);


  // If the switch changed, due to noise or pressing:
  if (readingPlayer1 != lastbuttonStatePlayer1) {
    lastDebounceTimePlayer1 = millis();
  } 
  if (readingPlayer2 != lastbuttonStatePlayer2) {
    lastDebounceTimePlayer2 = millis();
  } 
  
  if ((millis() - lastDebounceTimePlayer1) > debounceDelay) {
    // whatever the readingPlayer1 is at, it's been there for longer
    // than the debounce delay, so take it as the actual current state:
    prevbuttonStatePlayer1 = buttonStatePlayer1;
    buttonStatePlayer1 = readingPlayer1;
  }
   if ((millis() - lastDebounceTimePlayer2) > debounceDelay) {
    prevbuttonStatePlayer2 = buttonStatePlayer2;
    buttonStatePlayer2 = readingPlayer2;
  }
  
   // save the readingPlayer1.  Next time through the loop,
  // it'll be the lastbuttonStatePlayer1:
  lastbuttonStatePlayer1 = readingPlayer1;
  lastbuttonStatePlayer2 = readingPlayer2;
}

void interupt() {
  digitalWrite(ledPin1, p1State);
  digitalWrite(ledPin2, p2State);

  
  if (millis() > p1SenseTime) {
    p1State = LOW;
    p1SenseTime = 0;
  }
  if (millis() > p2SenseTime){
    p2State = LOW;
    p2SenseTime = 0;
  }
}


void p1()
{
  p1State = HIGH;
  p1SenseTime = millis() + senseDelay;
} 

void p2()
{
  p2State = HIGH;
  p2SenseTime = millis() + senseDelay;
} 

