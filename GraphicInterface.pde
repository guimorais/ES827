import controlP5.*;

ControlP5 cp5;
PFont font;

Textarea matrixH1, matrixH2, matrixH3, matrixH4;
CheckBox checkboxForward, checkboxInverse;
RadioButton radioGripperDir;

void defaultInterface() {
  clearInterface();
  cp5.addBang("forwardKinematicsInterface")
    .setPosition(50, 100)
    .setSize(180, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Forward Kinematics")
    ;    

  cp5.addBang("inverseKinematicsInterface")
    .setPosition(50, 300)
    .setSize(180, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Inverse Kinematics")
    ;
    
  cp5.addBang("saveTrajectoryInterface")
    .setPosition(50, 500)
    .setSize(180, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Save Trajectory")
    ;    
}

void clearInterface() {
  while (!cp5.getAll().isEmpty()) {
    cp5.getAll().get(0).remove();
  }
}

void forwardKinematicsInterface() {
  clearInterface();
  cp5.addBang("inverseKinematicsInterface")
    .setPosition(250, 30)
    .setSize(180, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Inverse Kinematics")
    ;

  cp5.addBang("saveTrajectoryInterface")
    .setPosition(50, 30)
    .setSize(180, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Save Trajectory")
    ;

  checkboxForward = cp5.addCheckBox("minus")
    .setPosition(10, 115)
    .setColorForeground(color(120))
    .setColorActive(color(255))
    .setColorLabel(color(255))
    .setSize(10, 10)
    .setItemsPerRow(1)
    .setSpacingRow(70)
    .addItem("- 0", 0)
    .addItem("- 1", 50)
    .addItem("- 2", 100)
    .addItem("- 3", 150)
    ;

  cp5.addTextfield("base")
    .setPosition(30, 100)
    .setSize(60, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 255, 255))
    .setInputFilter(ControlP5.INTEGER);
  ;

  cp5.addTextfield("shoulder")
    .setPosition(30, 180)
    .setSize(60, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 255, 255))
    .setInputFilter(ControlP5.INTEGER);
  ;

  cp5.addTextfield("elbow")
    .setPosition(30, 260)
    .setSize(60, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 255, 255))
    .setInputFilter(ControlP5.INTEGER);
  ;

  cp5.addTextfield("hand")
    .setPosition(30, 340)
    .setSize(60, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 255, 255))
    .setInputFilter(ControlP5.INTEGER);
  ;


  cp5.addBang("closeGrip")
    .setPosition(30, 420)
    .setSize(40, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Close")
    ;    

  cp5.addBang("openGrip")
    .setPosition(80, 420)
    .setSize(40, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Open")
    ;    

  matrixH1 = cp5.addTextarea("h1txt")
    .setPosition(180, 100)
    .setSize(115, 130)
    .setFont(createFont("arial", 12))
    .setLineHeight(14)
    .setColor(color(128))
    .setColorBackground(color(255, 100))
    .setColorForeground(color(255, 100));
  ;

  matrixH2 = cp5.addTextarea("h2txt")
    .setPosition(315, 100)
    .setSize(115, 130)
    .setFont(createFont("arial", 12))
    .setLineHeight(14)
    .setColor(color(128))
    .setColorBackground(color(255, 100))
    .setColorForeground(color(255, 100));
  ;

  matrixH3 = cp5.addTextarea("h3txt")
    .setPosition(180, 250)
    .setSize(115, 130)
    .setFont(createFont("arial", 12))
    .setLineHeight(14)
    .setColor(color(128))
    .setColorBackground(color(255, 100))
    .setColorForeground(color(255, 100));
  ;

  matrixH4 = cp5.addTextarea("h4txt")
    .setPosition(315, 250)
    .setSize(115, 130)
    .setFont(createFont("arial", 12))
    .setLineHeight(14)
    .setColor(color(128))
    .setColorBackground(color(255, 100))
    .setColorForeground(color(255, 100));
  ;

  cp5.addBang("clearForward")
    .setPosition(30, 500)
    .setSize(80, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Clear")
    ;    

  cp5.addBang("sendForward")
    .setPosition(130, 500)
    .setSize(80, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Send")
    ;

  textFont(font);
}


void inverseKinematicsInterface() {
  clearInterface();
  cp5.addBang("forwardKinematicsInterface")
    .setPosition(250, 30)
    .setSize(180, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Forward Kinematics")
    ;

  cp5.addBang("saveTrajectoryInterface")
    .setPosition(50, 30)
    .setSize(180, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Save Trajectory")
    ;

  checkboxInverse = cp5.addCheckBox("minusInverse")
    .setPosition(10, 115)
    .setColorForeground(color(120))
    .setColorActive(color(255))
    .setColorLabel(color(255))
    .setSize(10, 10)
    .setItemsPerRow(1)
    .setSpacingRow(70)
    .addItem("- 0", 0)
    .addItem("- 1", 50)
    .addItem("- 2", 100)
    ;

  matrixH1 = cp5.addTextarea("h1txt")
    .setPosition(180, 100)
    .setSize(115, 130)
    .setFont(createFont("arial", 12))
    .setLineHeight(14)
    .setColor(color(128))
    .setColorBackground(color(255, 100))
    .setColorForeground(color(255, 100));
  ;

  matrixH2 = cp5.addTextarea("h2txt")
    .setPosition(315, 100)
    .setSize(115, 130)
    .setFont(createFont("arial", 12))
    .setLineHeight(14)
    .setColor(color(128))
    .setColorBackground(color(255, 100))
    .setColorForeground(color(255, 100));
  ;

  matrixH3 = cp5.addTextarea("h3txt")
    .setPosition(180, 250)
    .setSize(115, 130)
    .setFont(createFont("arial", 12))
    .setLineHeight(14)
    .setColor(color(128))
    .setColorBackground(color(255, 100))
    .setColorForeground(color(255, 100));
  ;

  matrixH4 = cp5.addTextarea("h4txt")
    .setPosition(315, 250)
    .setSize(115, 130)
    .setFont(createFont("arial", 12))
    .setLineHeight(14)
    .setColor(color(128))
    .setColorBackground(color(255, 100))
    .setColorForeground(color(255, 100));
  ;

  cp5.addTextfield("x")
    .setPosition(30, 100)
    .setSize(60, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 255, 255))
    .setInputFilter(ControlP5.INTEGER);
  ;

  cp5.addTextfield("y")
    .setPosition(30, 180)
    .setSize(60, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 255, 255))
    .setInputFilter(ControlP5.INTEGER);
  ;

  cp5.addTextfield("z")
    .setPosition(30, 260)
    .setSize(60, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 255, 255))
    .setInputFilter(ControlP5.INTEGER);
  ;

  cp5.addBang("closeGrip")
    .setPosition(30, 340)
    .setSize(40, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Close")
    ;    

  cp5.addBang("openGrip")
    .setPosition(80, 340)
    .setSize(40, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Open")
    ;    

  cp5.addBang("clearInverse")
    .setPosition(30, 500)
    .setSize(80, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Clear")
    ;    

  cp5.addBang("sendInverse")
    .setPosition(130, 500)
    .setSize(80, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Send")
    ;    

  radioGripperDir = cp5.addRadioButton("radioButton")
    .setPosition(30, 420)
    .setColorForeground(color(120))
    .setColorActive(color(255))
    .setColorLabel(color(255))
    .setSize(10, 10)
    .setItemsPerRow(5)
    .setSpacingColumn(50)
    .setItemsPerRow(2)
    .setSpacingColumn(30)
    .setSpacingRow(30)
    .addItem("up", 0)
    .addItem("down", 50)
    .addItem("front", 100)
    .addItem("back", 150)
    ;
  
  textFont(font);
}

int baseSliderValue = 0;
int shoulderSliderValue = 0;
int elbowSliderValue = 0;
int handSliderValue = 0;
int sliderTicksValue = 1;
Slider baseSlider, shoulderSlider, elbowSlider, handSlider;


void saveTrajectoryInterface() {
  clearInterface();
  cp5.addBang("forwardKinematicsInterface")
    .setPosition(250, 30)
    .setSize(180, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Forward Kinematics")
    ;    

  cp5.addBang("inverseKinematicsInterface")
    .setPosition(50, 30)
    .setSize(180, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Inverse Kinematics")
    ;
    
  cp5.addSlider("baseSliderValue")
     .setPosition(50,120)
     .setRange(-90,90)
     .setSize(200,20)
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setText("Base")
     ;
     
  cp5.addSlider("shoulderSliderValue")
     .setPosition(50,180)
     .setRange(-90,90)
     .setSize(200,20)
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setText("Shoulder")
     ;
     
  cp5.addSlider("elbowSliderValue")
     .setPosition(50,240)
     .setRange(-90,90)
     .setSize(200,20)
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setText("Elbow")
     ;
     
  cp5.addSlider("handSliderValue")
     .setPosition(50,300)
     .setRange(-90,90)
     .setSize(200,20)
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setText("Hand")
     ;
  
  cp5.addBang("moveToPosition")
    .setPosition(300, 160)
    .setSize(120, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Move To Position")
    ;
  
  cp5.addBang("saveTrajectory")
    .setPosition(300, 240)
    .setSize(120, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setText("Save Trajectory")
    ;
}


public void sendForward() {
  int base = (cp5.get(Textfield.class, "base").getText().isEmpty()) ? 0 : Integer.parseInt(cp5.get(Textfield.class, "base").getText());
  if (checkboxForward.getItem(0).getState()) base *= -1;
  int shoulder = (cp5.get(Textfield.class, "shoulder").getText().isEmpty()) ? 0 : Integer.parseInt(cp5.get(Textfield.class, "shoulder").getText());
  if (checkboxForward.getItem(1).getState()) shoulder *= -1;
  int elbow = (cp5.get(Textfield.class, "elbow").getText().isEmpty()) ? 0 : Integer.parseInt(cp5.get(Textfield.class, "elbow").getText());
  if (checkboxForward.getItem(2).getState()) elbow *= -1;
  int hand = (cp5.get(Textfield.class, "hand").getText().isEmpty()) ? 0 : Integer.parseInt(cp5.get(Textfield.class, "hand").getText());
  if (checkboxForward.getItem(3).getState()) hand *= -1;
  
  servos.get(0).setNextVal(round(servos.get(0).getZero() + base*servos.get(0).getMulFactor()));
  servos.get(1).setNextVal(round(servos.get(1).getZero() + shoulder*servos.get(1).getMulFactor()));
  servos.get(2).setNextVal(servos.get(2).getMax()+servos.get(2).getMin()-servos.get(1).getNextVal());
  servos.get(3).setNextVal(round(servos.get(3).getZero() - elbow*servos.get(3).getMulFactor()));
  servos.get(4).setNextVal(round(servos.get(4).getZero() + hand*servos.get(4).getMulFactor()));
  
  forwardKinematics(base*PI/180, shoulder*PI/180, elbow*PI/180, hand*PI/180);
  adjustNextVal();
  setMatrixText();
  setValForward(servos.get(0).getNextVal(), servos.get(1).getNextVal(), servos.get(3).getNextVal(), servos.get(4).getNextVal());
}

public void sendInverse() {
  float x = (cp5.get(Textfield.class, "x").getText().isEmpty()) ? 0 : Float.parseFloat(cp5.get(Textfield.class, "x").getText());
  if (checkboxInverse.getItem(0).getState()) x *= -1;
  float y = (cp5.get(Textfield.class, "y").getText().isEmpty()) ? 0 : Float.parseFloat(cp5.get(Textfield.class, "y").getText());
  if (checkboxInverse.getItem(1).getState()) y *= -1;
  float z = (cp5.get(Textfield.class, "z").getText().isEmpty()) ? 0 : Float.parseFloat(cp5.get(Textfield.class, "z").getText());
  if (checkboxInverse.getItem(2).getState()) z *= -1;

  char dir;
  if(radioGripperDir.getItem(0).getState()){
    dir = 'U';
  } else if(radioGripperDir.getItem(1).getState()){
    dir = 'D';
  } else if(radioGripperDir.getItem(3).getState()){
    dir = 'B';
  } else {
    dir = 'F';
  }
  setValInverse(x, y, z, dir);
}

public void setMatrixText() {
  matrixH1.setText("R1\n" + sh1r + "O1\n" + sh1o);
  matrixH2.setText("R1*R2\n" + sh2r + "O2\n" + sh2o);
  matrixH3.setText("R1*R2*R3\n" + sh3r + "O3\n" + sh3o);
  matrixH4.setText("R1*R2*R3*R4\n" + sh4r + "O4\n" + sh4o);
}

public void clearForward() {
  cp5.get(Textfield.class, "base").clear();
  cp5.get(Textfield.class, "shoulder").clear();
  cp5.get(Textfield.class, "elbow").clear();
  cp5.get(Textfield.class, "hand").clear();
}

public void clearInverse() {
  cp5.get(Textfield.class, "x").clear();
  cp5.get(Textfield.class, "y").clear();
  cp5.get(Textfield.class, "z").clear();
}