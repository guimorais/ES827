import processing.serial.*;

Serial myPort;
String val;

void stablishConnection(){
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');
}


void serialEvent(Serial myPort) 
{
  val = myPort.readStringUntil('\n');
  if (val != null) {
    val = trim(val);

  }
}

void closeGrip(){
  if(gripper.getCurVal() == gripper.getMax()){
    println("Gripper already closed");
  } else {
    myPort.write('c');
    delay(1200);
    if(val.compareTo("closed") == 0){
      println("Gripper closed");
      gripper.setCurVal(gripper.getMax());
    }
    myPort.clear();
  }
}

void openGrip(){
  if(gripper.getCurVal() == gripper.getMin()){
    println("Gripper already open");
  } else {
    myPort.write('o');
    delay(1200);
    if(val.compareTo("opened") == 0){
      println("Gripper opened");
      gripper.setCurVal(gripper.getMin());
    }
    myPort.clear();
  }
}

//TODO arrumar para controle de trajetoria
void moveServo(){
  String command = "";
  int i=0;
  for(int j=0; j<60; j++){
    command = command.concat("F");
    for(; i<NUM_SERVOS; i++){
      command = command.concat(round(servos.get(i).getTrajectory(j)) + ",");
    }
    i=0;
    myPort.write(command);
    loop();
    forwardKinematics((servos.get(0).getTrajectory(j)-servos.get(0).getZero())*PI/180,(servos.get(1).getTrajectory(j)-servos.get(1).getZero())*PI/180,-(servos.get(3).getTrajectory(j)-servos.get(3).getZero())*PI/180,(servos.get(4).getTrajectory(j)-servos.get(4).getZero())*PI/180);
    delay(40);
    command = "";
  }
}