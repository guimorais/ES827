PWindow win;
int gridSize = 20;

public void settings() {
  size(500, 600);
}

void setup()
{
  cp5 = new ControlP5(this);
  font = createFont("arial", 15);
  stablishConnection();
  defaultInterface();
  servos = setServos();
  gripper = setGripper();
  startServos();
  
      setTrajectoryNode(72,68,100,75,1);
    setTrajectoryNode(72,90,26,141,1);
    setTrajectoryNode(72,90,26,141,-1);
    setTrajectoryNode(72,87,42,163,-1);
    setTrajectoryNode(27,59,152,57,-1);
    setTrajectoryNode(27,59,152,57,1);
    setTrajectoryNode(72,68,100,75,1);

  win = new PWindow();
}

void draw()
{
  background(0);
  fill(255);
}

class PWindow extends PApplet {
  PWindow() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }

  void settings() {
    size(500, 500, P3D);
  }

  void setup() {
    background(255);
    oPosition = new float[][]{{0, 0, 0}, {0, 0, 6}, {0, 0, 16}, {0, 0, 23}, {0, 0, 32}};
  }

  void draw() {
    background(0);
    smooth();
    lights();

    fill(#FF9F03);

    stroke(255);
    strokeWeight(1);
    rotateX(0.7);
    rotateZ(-0.5);
    for (int i = -20; i < 220; i+=gridSize) {
      for (int j = 200; j < 460; j+=gridSize) {
        line(i, j, -200, i+gridSize, j, -200);
        line(i, j, -200, i, j+gridSize, -200);
      }
    }
    line(-20, 460, -200, 220, 460, -200);
    line(220, 460, -200, 220, 460, 260);

    for (int i = -20; i < 220; i+=gridSize) {
      for (int k = -200; k < 260; k+=gridSize) {
        line(i, 200, k, i+gridSize, 200, k);
        line(i, 200, k, i, 200, k+gridSize);
      }
    }

    for (int j = 200; j < 460; j+=gridSize) {
      for (int k = -200; k < 260; k+=gridSize) {
        line(220, j, k, 220, j+gridSize, k);
        line(220, j, k, 220, j, k+gridSize);
      }
    }


    rotateZ(0.5);
    rotateX(-0.7);
    translate(width/2, height*2/3);
    rotateX(0.7);
    rotateZ(-0.5);

    stroke(255, 0, 0);
    strokeWeight(10);
    point(oPosition[0][0]*8, oPosition[0][1]*8, oPosition[0][2]*8);
    point(oPosition[1][0]*8, oPosition[1][1]*8, oPosition[1][2]*8);
    point(oPosition[2][0]*8, oPosition[2][1]*8, oPosition[2][2]*8);
    point(oPosition[3][0]*8, oPosition[3][1]*8, oPosition[3][2]*8);
    point(oPosition[4][0]*8, oPosition[4][1]*8, oPosition[4][2]*8);
    stroke(0, 0, 255);
    strokeWeight(6);
    line(oPosition[0][0]*8, oPosition[0][1]*8, oPosition[0][2]*8, oPosition[1][0]*8, oPosition[1][1]*8, oPosition[1][2]*8);
    line(oPosition[1][0]*8, oPosition[1][1]*8, oPosition[1][2]*8, oPosition[2][0]*8, oPosition[2][1]*8, oPosition[2][2]*8);
    line(oPosition[2][0]*8, oPosition[2][1]*8, oPosition[2][2]*8, oPosition[3][0]*8, oPosition[3][1]*8, oPosition[3][2]*8);
    line(oPosition[3][0]*8, oPosition[3][1]*8, oPosition[3][2]*8, oPosition[4][0]*8, oPosition[4][1]*8, oPosition[4][2]*8);
  }
}