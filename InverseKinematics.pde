//TODO adicionar orientacao da garra
void setValInverse(float x, float y, float z, char dir){
  inverseKinematics(x, y, z, dir);
  adjustNextVal();
  setStep();
  setTrajectory();
  setMatrixText();
  moveServo();
  setCurVal();
  myPort.clear();
}

String pos1o, pos2o, pos3o, pos4o, ang1, ang2, ang3, ang4;

void inverseKinematics(float x, float y, float z, char side) {
  x = x/100;
  y = y/100;
  z = z/100;
  float D = (x*x+y*y+(z-0.06)*(z-0.06)-0.0149)/0.0140;
  float D1 = 0;
  if(1-D*D > 0){
    D1 = sqrt(1-D*D);
  }
  
  float t1 = atan2(y,(x>0) ? x : -x);
  float t3 = atan2(D1,D);
  float t2 = PI/2 - (atan2(z-0.06,sqrt(x*x+y*y))+atan2(0.07*sin(t3),0.1+0.07*cos(t3)));
  
  int theta1 = round(t1*180/PI);
  int theta2 = round(t2*180/PI);
  int theta3 = round(t3*180/PI);
  int theta4 = 0;
  
  if(x>=0){
    if(side == 'u' || side == 'U'){
      theta4 = - theta2 - theta3;
    } else if(side == 'f' || side == 'F') {
      theta4 = 90 - theta2 - theta3;
    } else if(side == 'd' || side == 'D') {
      theta4 = 180 - theta2 - theta3;
    } else if(side == 'b' || side == 'B') {
      theta4 = -90 - theta2 - theta3;
    }
    servos.get(0).setNextVal(round(servos.get(0).getZero() + theta1*servos.get(0).getMulFactor()));
    servos.get(1).setNextVal(round(servos.get(1).getZero() + theta2*servos.get(1).getMulFactor()));
    servos.get(2).setNextVal(servos.get(2).getMax()+servos.get(2).getMin()-servos.get(1).getNextVal());
    servos.get(3).setNextVal(round(servos.get(3).getZero() - theta3*servos.get(3).getMulFactor()));
    servos.get(4).setNextVal(round(servos.get(4).getZero() + theta4*servos.get(4).getMulFactor()));
    
  } else {
     if(side == 'd' || side == 'D'){
      theta4 = 180 - theta2 - theta3;
    } else if(side == 'b' || side == 'B') {
      theta4 = -90 - theta2 - theta3;
    } else if(side == 'u' || side == 'U') {
      theta4 =  - theta2 - theta3;
    } else if(side == 'f' || side == 'F') {
      theta4 = 90 - theta2 - theta3;
    }
    servos.get(0).setNextVal(round(servos.get(0).getZero() - theta1*servos.get(0).getMulFactor()));
    servos.get(1).setNextVal(round(servos.get(1).getZero() - theta2*servos.get(1).getMulFactor()));
    servos.get(2).setNextVal(servos.get(2).getMax()+servos.get(2).getMin()-servos.get(1).getNextVal());
    servos.get(3).setNextVal(round(servos.get(3).getZero() + theta3*servos.get(3).getMulFactor()));
    servos.get(4).setNextVal(round(servos.get(4).getZero() - theta4*servos.get(4).getMulFactor()));
  }
 
    
  //servos.get(0).setNextVal(servos.get(0).getZero() + theta1);
  //servos.get(1).setNextVal(servos.get(1).getZero() + theta2);
  //servos.get(2).setNextVal(servos.get(2).getMax() + servos.get(2).getMin() - servos.get(1).getNextVal());
  //servos.get(3).setNextVal(servos.get(3).getZero() - theta3);
  //servos.get(4).setNextVal(servos.get(4).getZero() + theta4);
  
  
  forwardKinematics(t1, t2, t3, theta4*PI/180);
}