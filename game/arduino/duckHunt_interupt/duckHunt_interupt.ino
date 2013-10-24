const int player1_pwr = 5;     
const int player1_gnd = 4; 
const int player1 = 3; 
const int player1Sen = 2;  
const int ledPin =  13;      // the number of the LED pin

volatile int state = LOW;

void setup()
{
  Serial.begin(9600);
  pinMode(player1_pwr, OUTPUT);
  pinMode(player1_gnd, OUTPUT);
  digitalWrite(player1_gnd, LOW);
  digitalWrite(player1_pwr, HIGH);

  pinMode(player1, INPUT_PULLUP);
  pinMode(player1Sen, INPUT_PULLUP);

  pinMode(ledPin, OUTPUT);
    pinMode(12, OUTPUT);

  attachInterrupt(1, blink, RISING);
}

void loop()
{
  digitalWrite(ledPin, state);
    digitalWrite(12, state);

}

void blink()
{
  state = !state;
} 
