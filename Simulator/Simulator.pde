

LatticeModel lattice = new LatticeModel(6,7,6);
LatticeView view = new LatticeView();

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

  view.setup();
}

void draw() {
  view.draw(lattice);
}

