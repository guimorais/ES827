#include <Servo.h>

#define NUM_SERVOS 6
#define SERVO_ERROR 1//0.8523

const double pi = 3.14159265;

typedef struct {int pin; int zero;} servos;

static const servos defs[6] = {
  {8,72},
  {9,68},
  {10,74},
  {11,98},
  {12,75},
  {13,105}
};

Servo servo[NUM_SERVOS];

char buffer[25];
char command;

void setup() {
  Serial.begin(9600);
  Serial.flush();
  
  for(int i=0; i<NUM_SERVOS; i++){
    servo[i].attach(defs[i].pin);
    servo[i].write(defs[i].zero);
  }
  Serial.println("Ready");
}

void loop() {
  if(Serial.available() > 0){
    int index = 0;

    delay(20);
    int numChar = Serial.available()-1;
    if(numChar > 25) {
      numChar = 25;
    }
    
    command = Serial.read();
    
    while(numChar--) {
      buffer[index++] = Serial.read();
    }
    
    if(command == 'f' || command == 'F'){
      setValForward(buffer);
    } else if(command == 'c' || command == 'C'){
      closeActuator();
    } else if(command == 'o' || command == 'O'){
      openActuator();
    }
  }
}

void clearSerial(){
  for(int x=0; x < 24; x++){
    buffer[x]='\0';
  }
  Serial.flush();
}

void closeActuator(){
  Serial.println("Aqui");
  for(int i=0; i<20; i++){
    servo[5].write(100 + 4*i);
    delay(40);
  }
  Serial.println("closed");
  clearSerial();
}

void openActuator(){
  for(int i=0; i<20; i++){
    servo[5].write(180 - 4*i);
    delay(40);
  }
  Serial.println("opened");
  clearSerial();
}

void setValForward(char* data){
  char* cBase = strtok(data, " ,");
  char* cEixo1 = strtok(NULL, " ,");
  char* cEixo12 = strtok(NULL, " ,");
  char* cEixo2 = strtok(NULL, " ,");
  char* cEixoGarra = strtok(NULL, " ,");

  if(cBase == NULL || cEixo1 == NULL || cEixo12 == NULL || cEixo2 == NULL || cEixoGarra == NULL){
    return;
  }
  servo[0].write(atoi(cBase));
  servo[1].write(atoi(cEixo1));
  servo[2].write(atoi(cEixo12));
  servo[3].write(atoi(cEixo2));
  servo[4].write(atoi(cEixoGarra));
  Serial.println("Done");
}
