public void savePosition() {
  setTrajectoryNode(servos.get(0).getCurVal(), servos.get(1).getCurVal(), servos.get(3).getCurVal(), servos.get(4).getCurVal());
  for (int i=0; i<NUM_SERVOS; i++) {
    for (int j=0; j<servos.get(i).trajectoryNodes.size(); j++) {
      print(servos.get(i).getNode(j) + " ");
    }
    println();
  }
  for (int j=0; j<gripper.trajectoryNodes.size(); j++) {
      print(gripper.getNode(j) + " ");
    }
}

public void executeTrajectory() {
  for (int i=0; i<servos.get(0).trajectoryNodes.size(); i++) {
    for (int j=0; j<NUM_SERVOS; j++) {
      servos.get(j).setNextVal(round(servos.get(j).getNode(i)));
      println(servos.get(j).getNextVal());
    }
   
    adjustNextVal();
    setMatrixText();
    setValForward(servos.get(0).getNextVal(), servos.get(1).getNextVal(), servos.get(3).getNextVal(), servos.get(4).getNextVal());
    if(gripper.getNode(i) == -1) {
      closeGrip();
    } else {
      openGrip();
    }
  }
}

public void clearTrajectory() {
  for(int i=0; i<NUM_SERVOS; i++){
    servos.get(i).clearNodes();
  }
  gripper.clearNodes();
}