 
 

const int player1Sen = 2;
const int player2Sen = 3;  

const int ledPin1 =  13;      // the number of the LED pin
const int ledPin2 =  12;      // the number of the LED pin

const int senseDelay = 20;
volatile long p1SenseTime = 0;
volatile long p2SenseTime = 0;

volatile int p1State = LOW;
volatile int p2State = LOW;


void setup()
{
  Serial.begin(9600);

  pinMode(player1Sen, INPUT_PULLUP);
  pinMode(player2Sen, INPUT_PULLUP);


  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);


  attachInterrupt(0, p1, RISING);
  attachInterrupt(1, p2, RISING);

}

void loop()
{
  digitalWrite(ledPin1, p1State);
  digitalWrite(ledPin2, p2State);

  
  if (millis() > p1SenseTime){
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
