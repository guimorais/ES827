public static final int NUM_SERVOS = 5;
public boolean exceeded = false;

void setCurVal() {
  for (int i=0; i<NUM_SERVOS; i++) {
    servos.get(i).setCurVal(servos.get(i).getNextVal());
  }
}

void setTrajectoryNode(int base, int shoulder, int elbow, int hand) {
  servos.get(0).addNode(base);
  servos.get(1).addNode(shoulder);
  servos.get(2).addNode(servos.get(2).getMax()+servos.get(2).getMin()-shoulder);
  servos.get(3).addNode(elbow);
  servos.get(4).addNode(hand);
  
  if(gripper.getCurVal() > 110){
    gripper.addNode(-1);
  } else {
    gripper.addNode(1);
  }
}

void setTrajectoryNode(int base, int shoulder, int elbow, int hand, int gripperNode) {
  servos.get(0).addNode(base);
  servos.get(1).addNode(shoulder);
  servos.get(2).addNode(servos.get(2).getMax()+servos.get(2).getMin()-shoulder);
  servos.get(3).addNode(elbow);
  servos.get(4).addNode(hand);
  gripper.addNode(gripperNode);
}

void startServos() {
  myPort.write("F0,0,0,0,0");
}


void adjustNextVal() {
  exceeded = false;
  for (int i=0; i<NUM_SERVOS; i++) {
    if (servos.get(i).getNextVal() > servos.get(i).getMax()) {
      exceeded = true;
      servos.get(i).setNextVal(servos.get(i).getMax());
      println("Ângulo acima do limite para servo " + (i+1) + ". Usando máximo " + servos.get(i).getMax());
    }
    if (servos.get(i).getNextVal() < servos.get(i).getMin()) {
      exceeded = true;
      servos.get(i).setNextVal(servos.get(i).getMin());
      println("Ângulo abaixo do limite para servo " + (i+1) + ". Usando mínimo " + servos.get(i).getMin());
    }
  }
}


void setTrajectory() {
  float a0 = 0;
  float a2 = 0;
  float a3 = 0;
  
  for (int i=0; i<NUM_SERVOS; i++) {
    a0 = (float)servos.get(i).getCurVal();
    a3 = (float)(a0 - servos.get(i).getNextVal())/13.5;
    a2 = (float)-4.5*a3;
    
    for(float t=0; t<3; ){
      servos.get(i).setTrajectory(a0+a2*t*t+a3*t*t*t, (int)(t*20));
      t += 0.05;
    }
    
  }
}


//TODO arrumar este metodo para gerar trajetoria
void setStep() {
  int maxDif = 0;
  for (int i=0; i<NUM_SERVOS; i++) {
    if (abs(servos.get(i).getNextVal() - servos.get(i).getCurVal()) > maxDif) {
      maxDif = abs(servos.get(i).getNextVal() - servos.get(i).getCurVal());
    }
  }

  int numSteps = maxDif;
  if (numSteps == 0) {
    for (int i=0; i<NUM_SERVOS; i++) {
      servos.get(i).setStep(0);
      servos.get(i).setNumSteps(0);
    }
  }

  for (int i=0; i<NUM_SERVOS; i++) {
    servos.get(i).setStep((servos.get(i).getNextVal() - servos.get(i).getCurVal())/(float)numSteps);
    servos.get(i).setNumSteps(numSteps);
  }
}