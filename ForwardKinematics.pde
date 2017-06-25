void setValForward(int base, int shoulder, int elbow, int hand){
  
  setStep();
  setTrajectory();
  moveServo();
  setCurVal();
  myPort.clear();
}


String sh1r, sh2r, sh3r, sh4r, sh1o, sh2o, sh3o, sh4o;
float[][] oPosition;


void forwardKinematics(float theta1, float theta2, float theta3, float theta4){
  for(int i=0; i<3; i++){
    oPosition[0][i] = 0;
  }
  
  float[][] H1 = {
    {cos(theta1), 0,  -sin(theta1),  0},
    {sin(theta1), 0,  cos(theta1),   0},
    {0,           -1, 0,             0.06},
    {0,           0,  0,             1}
  };

  sh1r = "";
  for(int i=0; i<3; i++){
    for(int j=0; j<3; j++){
        sh1r = sh1r.concat(nfs(H1[i][j], 1, 2) + "  ");
    }
    sh1r = sh1r.concat("\n");
  }
  sh1o = "";
  for(int i=0; i<3; i++){
    oPosition[1][i] = H1[i][3]*100;
    sh1o = sh1o.concat(nfs(H1[i][3]*100, 2, 1) + "\n");
  }
  
  float[][] H12 = {
    {cos(theta2 - PI/2)*cos(theta1), -cos(theta1)*sin(theta2 - PI/2),  -sin(theta1), 0.1*cos(theta2 - PI/2)*cos(theta1)},
    {cos(theta2 - PI/2)*sin(theta1), -sin(theta2 - PI/2)*sin(theta1),  cos(theta1),  0.1*cos(theta2 - PI/2)*sin(theta1)},
    {-sin(theta2 - PI/2),            -cos(theta2 - PI/2),              0,            0.06 - 0.1*sin(theta2 - PI/2)},
    {0,                              0,                                0,            1.0}
  };
  
  sh2r = "";
  for(int i=0; i<3; i++){
    for(int j=0; j<3; j++){
        sh2r = sh2r.concat(nfs(H12[i][j], 1, 2) + "  ");
    }
    sh2r = sh2r.concat("\n");
  }
  sh2o = "";
  for(int i=0; i<3; i++){
    oPosition[2][i] = H12[i][3]*100;
    sh2o = sh2o.concat(nfs(H12[i][3]*100, 2, 1) + "\n");
  }
  
  
  float[][] H123 = {
    { cos(theta2 + theta3 - PI/2)*cos(theta1), -sin(theta2 + theta3 - PI/2)*cos(theta1), -sin(theta1), (cos(theta1)*(7.0*cos(theta2 + theta3 - PI/2) + 10.0*cos(theta2 - PI/2)))/100},
    { cos(theta2 + theta3 - PI/2)*sin(theta1), -sin(theta2 + theta3 - PI/2)*sin(theta1), cos(theta1),  (sin(theta1)*(7.0*cos(theta2 + theta3 - PI/2) + 10.0*cos(theta2 - PI/2)))/100},
    { -sin(theta2 + theta3 - PI/2),            -cos(theta2 + theta3 - PI/2),             0,            0.06 - 0.1*sin(theta2 - PI/2) - 0.07*sin(theta2 + theta3 - PI/2)},
    { 0,                                       0,                                        0,            1.0}
  };
  
  sh3r = "";
  for(int i=0; i<3; i++){
    for(int j=0; j<3; j++){
        sh3r = sh3r.concat(nfs(H123[i][j], 1, 2) + "  ");
    }
    sh3r = sh3r.concat("\n");
  }
  sh3o = "";
  for(int i=0; i<3; i++){
    oPosition[3][i] = H123[i][3]*100;
    sh3o = sh3o.concat(nfs(H123[i][3]*100, 2, 1) + "\n");
  }
  
  
  float[][] H1234 = {
    { cos(theta2 + theta3 + theta4 - PI/2)*cos(theta1), -sin(theta2 + theta3 + theta4 - PI/2)*cos(theta1), -sin(theta1), 0.01*cos(theta1)*(7.0*cos(theta2 + theta3 - PI/2) + 9.0*cos(theta2 + theta3 + theta4 - PI/2) + 10.0*cos(theta2 - PI/2))},
    { cos(theta2 + theta3 + theta4 - PI/2)*sin(theta1), -sin(theta2 + theta3 + theta4 - PI/2)*sin(theta1), cos(theta1),  0.01*sin(theta1)*(7.0*cos(theta2 + theta3 - PI/2) + 9.0*cos(theta2 + theta3 + theta4 - PI/2) + 10.0*cos(theta2 - PI/2))},
    { -sin(theta2 + theta3 + theta4 - PI/2),            -cos(theta2 + theta3 + theta4 - PI/2),             0,            0.1*cos(theta2) - 0.07*sin(theta2 + theta3 - PI/2) - 0.09*sin(theta2 + theta3 + theta4 - PI/2) + 0.06},
    { 0,                                                0,                                                 0,            1.0}
  };
  
  sh4r = "";
  for(int i=0; i<3; i++){
    for(int j=0; j<3; j++){
        sh4r = sh4r.concat(nfs(H1234[i][j], 1, 2) + "  ");
    }
    sh4r = sh4r.concat("\n");
  }
  sh4o = "";
  for(int i=0; i<3; i++){
    oPosition[4][i] = H1234[i][3]*100;
    sh4o = sh4o.concat(nfs(H1234[i][3]*100, 2, 1) + "\n");
  }
}