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
const int player1 = 2;     // the number of the pushbutton pin
const int player2 = 4;     // the number of the pushbutton pin
const int ledPin =  13;      // the number of the LED pin

// Variables will change:
int ledState = HIGH;         // the current state of the output pin
int buttonStatePlayer1;             // the current readingPlayer1 from the input pin
int buttonStatePlayer2;             // the current readingPlayer1 from the input pin
int lastbuttonStatePlayer1 = LOW;   // the previous readingPlayer1 from the input pin
int lastbuttonStatePlayer2 = LOW;   // the previous readingPlayer1 from the input pin

// the following variables are long's because the time, measured in miliseconds,
// will quickly become a bigger number than can be stored in an int.
long lastDebounceTimePlayer1 = 0;  // the last time the output pin was toggled
long lastDebounceTimePlayer2 = 0;  // the last time the output pin was toggled
long debounceDelay = 100;    // the debounce time; increase if the output flickers
int count;
int prevbuttonStatePlayer1;
int prevbuttonStatePlayer2;

void setup() {
  Serial.begin(9600);
  pinMode(player1, INPUT_PULLUP);
  pinMode(player2, INPUT_PULLUP);

  pinMode(ledPin, OUTPUT);
}

void loop() {
  // read the state of the switch into a local variable:
  int readingPlayer1 = digitalRead(player1);
  int readingPlayer2 = digitalRead(player2);

  // check to see if you just pressed the button 
  // (i.e. the input went from LOW to HIGH),  and you've waited 
  // long enough since the last press to ignore any noise:  

  // If the switch changed, due to noise or pressing:
  if (readingPlayer1 != lastbuttonStatePlayer1) {
    // reset the debouncing timer
    lastDebounceTimePlayer1 = millis();
  } 
   // If the switch changed, due to noise or pressing:
  if (readingPlayer2 != lastbuttonStatePlayer2) {
    // reset the debouncing timer
    lastDebounceTimePlayer2 = millis();
  } 
  
  if ((millis() - lastDebounceTimePlayer1) > debounceDelay) {
    // whatever the readingPlayer1 is at, it's been there for longer
    // than the debounce delay, so take it as the actual current state:
    prevbuttonStatePlayer1 = buttonStatePlayer1;
    buttonStatePlayer1 = readingPlayer1;
  }
   if ((millis() - lastDebounceTimePlayer2) > debounceDelay) {
    // whatever the readingPlayer1 is at, it's been there for longer
    // than the debounce delay, so take it as the actual current state:
    prevbuttonStatePlayer2 = buttonStatePlayer2;
    buttonStatePlayer2 = readingPlayer2;
  }
  
  // set the LED using the state of the button:
  digitalWrite(ledPin, buttonStatePlayer1);
  if (prevbuttonStatePlayer1 == 0 && buttonStatePlayer1 == 1) {
    Serial.println("1");
  }
  if (prevbuttonStatePlayer2 == 0 && buttonStatePlayer2 == 1) {
    Serial.println("2");
  }


  // save the readingPlayer1.  Next time through the loop,
  // it'll be the lastbuttonStatePlayer1:
  lastbuttonStatePlayer1 = readingPlayer1;
  lastbuttonStatePlayer2 = readingPlayer2;

}

