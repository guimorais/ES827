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
  
    /*setTrajectoryNode(72,68,100,75,1);
    setTrajectoryNode(72,90,26,141,1);
    setTrajectoryNode(72,90,26,141,-1);
    setTrajectoryNode(72,87,42,163,-1);
    setTrajectoryNode(27,59,152,57,-1);
    setTrajectoryNode(27,59,152,57,1);
    setTrajectoryNode(72,68,100,75,1);*/

    /*setTrajectoryNode(72,68,98,75,1);
    setTrajectoryNode(72,104,44,156,1);
    setTrajectoryNode(72,104,44,156,-1);
    setTrajectoryNode(72,74,33,180,-1);
    setTrajectoryNode(45,78,40,180,-1);
    setTrajectoryNode(41,90,37,166,-1);
    setTrajectoryNode(41,90,37,166,1);
    setTrajectoryNode(0,68,98,75,1);*/
    
    setTrajectoryNode(72,68,98,75,1);
    setTrajectoryNode(72,104,44,156,1);
    setTrajectoryNode(72,104,44,156,-1);
    setTrajectoryNode(41,46,150,65,-1);
    setTrajectoryNode(41,46,150,65,1);
    setTrajectoryNode(72,68,98,75,1);

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

    int xmin = -80;
    int xmax = 320;
    int ymin = 100;
    int ymax = 500;
    int zmin = -200;
    int zmax = 260;

    stroke(255);
    strokeWeight(1);
    rotateX(0.7);
    rotateZ(-0.5);
    for (int i = xmin; i < xmax; i+=gridSize) {
      for (int j = ymin; j < ymax; j+=gridSize) {
        line(i, j, zmin, i+gridSize, j, zmin);
        line(i, j, zmin, i, j+gridSize, zmin);
      }
    }
    line(xmin, ymax, zmin, xmax, ymax, zmin);
    line(xmax, ymax, zmin, xmax, ymax, zmax);

    for (int i = xmin; i < xmax; i+=gridSize) {
      for (int k = zmin; k < zmax; k+=gridSize) {
        line(i, ymin, k, i+gridSize, ymin, k);
        line(i, ymin, k, i, ymin, k+gridSize);
      }
    }

    for (int j = ymin; j < ymax; j+=gridSize) {
      for (int k = zmin; k < zmax; k+=gridSize) {
        line(xmax, j, k, xmax, j+gridSize, k);
        line(xmax, j, k, xmax, j, k+gridSize);
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