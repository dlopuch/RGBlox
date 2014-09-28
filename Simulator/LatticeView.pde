// Class that draws a LatticeModel in 3D space.
// Moving the mouse left/right rotates the camera around the lattice

// User params:
int W = 640, 
    H = 360,
    
    // About how many lattice blocks should fit the width of the viewport.
    // Increase if adding more blocks to the lattice.
    SIDE_SIZE = 8;
    
// end user params -- don't change these
int UNIT = H / SIDE_SIZE;

public class LatticeView {
  // call from main setup() method
  void setup() {
    size(W,H,P3D);
    background(0);
    lights();
  }
  
  void drawCube(CubeModel cube) {
    pushMatrix();
    int[] xyz = cube.getXYZ();
    translate(xyz[0]*UNIT, -1*xyz[1]*UNIT, -1*xyz[2]*UNIT);
    noStroke();
    
    color c = cube.getColor();
    fill(red(c), green(c), blue(c));
    
    box(UNIT);
    popMatrix();
  }
  
  void draw(LatticeModel lattice) {
    background(0);
    lights();
    float mPos = (float) mouseX / (float) width;
    camera( sin(mPos * 2 * PI) * width, 
            -height/2,
            cos(mPos * 2 * PI) * width, 
            //z: (height/2) / tan(PI/6), 
            
            // looking at: x,y,z
            0, -height/2, 0, 
            
            // vertical axis: x,y,z
            0, 1, 0);
  
  
    // draw the cubes in the lattice
    for (CubeModel cube : lattice.getAllCubes()) {
      this.drawCube(cube);
    }
  }
}
