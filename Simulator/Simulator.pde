

LatticeModel lattice = new LatticeModel(6,7,6);
LatticeView view = new LatticeView();

ArrayList<CubeModel> allCubes;

boolean setupOnce = false;

void setup() {
  // processing sometimes calls setup more than once.  (shrug).
  if (setupOnce) return;
  setupOnce = true;

  lattice.addCube(0,2,1);
  lattice.addCube(1,3,2);
  lattice.addCube(0,2,3);
  lattice.addCube(1,1,4);
  lattice.addCube(2,0,3);
  
  lattice.addCube(1,1,2);
  lattice.addCube(2,2,1);
  lattice.addCube(3,1,0);
  lattice.addCube(4,0,1);
  lattice.addCube(3,1,2);
  
  lattice.addCube(4,2,3);
  lattice.addCube(5,3,4);
  lattice.addCube(4,4,5);
  lattice.addCube(5,5,4);
  lattice.addCube(4,4,3);
  
  lattice.addCube(3,5,4);
  lattice.addCube(2,4,3);
  lattice.addCube(1,5,2);
  lattice.addCube(2,6,1);
  lattice.addCube(3,5,0);
  
  allCubes = lattice.getAllCubes();

  view.setup();
}

int currCubeI = 0;
int count = 0;

void draw() {
  
  // How to use the simulator:
  //   Do .setColor() on any cubes then do a LatticeView.draw(lattice)
  // In this example, we just set one sequential cube to purple every 15 frames. 
  
  if (count == 0) {
    // reset the previous cube to white
    allCubes.get(currCubeI).setColor(color(255, 255, 255));
    
    // go to the next cube
    currCubeI = (currCubeI + 1) % allCubes.size();
    
    // paint the (now-)current cube purple
    allCubes.get(currCubeI).setColor(color(255, 0, 255));  
  }
  count = (count + 1) % 15;
  
  // Paint the lattice in 3d space
  view.draw(lattice);
}

