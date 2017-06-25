import java.util.ArrayList;

ArrayList<ServoDefs> servos;
ServoDefs gripper;


public class ServoDefs {
  private int pin;
  private int zero;
  private int min;
  private int max;
  private int curVal;
  private int nextVal;
  private int numSteps;
  private float mulFactor;
  private float step;
  private float[] trajectory;
  public ArrayList<Float> trajectoryNodes;

  ServoDefs(int pin, int zero, int min, int max, float mulFactor) {
    this.pin = pin;
    this.zero = zero;
    this.min = min;
    this.max = max;
    this.curVal = zero;
    this.mulFactor = mulFactor;
    this.nextVal = 0;
    this.numSteps = 0;
    this.step = 0;
    this.trajectory = new float[60];
    this.trajectoryNodes = new ArrayList<Float>();
  }

  public void addNode(float node) {
    this.trajectoryNodes.add(node);
  }
  
  public float removeNode() {
    return this.trajectoryNodes.remove(0);
  }
  
  public float getNode(int index) {
    return this.trajectoryNodes.get(index);
  }
  
  public void clearNodes() {
    this.trajectoryNodes = new ArrayList<Float>();
  }

  public int getPin() {
    return this.pin;
  }

  public int getZero() {
    return this.zero;
  }

  public int getMin() {
    return this.min;
  }

  public int getMax() {
    return this.max;
  }

  public int getCurVal() {
    return this.curVal;
  }

  public int getNextVal() {
    return this.nextVal;
  }

  public int getNumSteps() {
    return this.numSteps;
  }

  public float getStep() {
    return this.step;
  }
  
  public float getMulFactor() {
    return mulFactor;
  }

  public void setCurVal(int curVal) {
    this.curVal = curVal;
  }
  
  public void setNextVal(int nextVal) {
    this.nextVal = nextVal;
  }

  public void setNumSteps(int numSteps) {
    this.numSteps = numSteps;
  }

  public void setStep(float step) {
    this.step = step;
  }
  
  public void setTrajectory(float trajectory, int i){
    this.trajectory[i] = trajectory;
  }
  
  public float[] getTrajectory() {
    return this.trajectory;
  }
  
  public float getTrajectory(int i) {
    return this.trajectory[i];
  }
}

public ArrayList<ServoDefs> setServos() {
  ArrayList<ServoDefs> servos = new ArrayList<ServoDefs>();
  servos.add(new ServoDefs(8, 72, 0, 178, 1));
  servos.add(new ServoDefs(9, 68, 0, 142, 0.8));
  servos.add(new ServoDefs(10, 74, 0, 142, 0.8));
  servos.add(new ServoDefs(11, 98, 0, 180, 1));
  servos.add(new ServoDefs(12, 75, 0, 180, 1));

  return servos;
}

public ServoDefs setGripper() {
  return new ServoDefs(13, 105, 105, 115, 1);
}