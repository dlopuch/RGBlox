// class to maintain a collection of Cubes in 3D space

public class LatticeModel {
  int maxX, maxY, maxZ; // max size of the lattice
  int ledCount = 0;
  ArrayList<CubeModel> cubes; // sequential list of Cubes
  CubeModel[][][] volumeXYZ; // list of Cubes, organized by their xyz coordinates
  
  public LatticeModel(int sx, int sy, int sz) {
    maxX = sx;
    maxY = sy;
    maxZ = sz;
 
    cubes = new ArrayList<CubeModel>();
    volumeXYZ = new CubeModel[maxX][maxY][maxZ];
  }
  
  // Creates and adds a cube to the lattice.  LEDs are defined sequentially, ie the first cube added has the first 
  // four LEDs, the second cube has the second four, etc.
  public CubeModel addCube(int x, int y, int z) {
    if (x < 0 || maxX <= x) throw new RuntimeException("x out of bounds.  Expected max: " + maxX + " but passed: " + x);
    if (y < 0 || maxY <= y) throw new RuntimeException("y out of bounds.  Expected max: " + maxY + " but passed: " + y);
    if (z < 0 || maxZ <= z) throw new RuntimeException("z out of bounds.  Expected max: " + maxZ + " but passed: " + z);
    
    if (volumeXYZ[x][y][z] != null) 
      throw new RuntimeException("A cube already exists at specified position: " + x + "," + y + "," + z + " (found:" + volumeXYZ[x][y][z]);
    
    CubeModel cube = new CubeModel(ledCount, x, y, z);
    ledCount += 4;
    
    cube.setColor(color(255));
    
    cubes.add(cube);
    volumeXYZ[x][y][z] = cube;
    
    return cube;
  }
  
  // Returns a 3D matrix of the lattice
  public CubeModel[][][] getLattice() {
    return volumeXYZ.clone();
  }
  
  public ArrayList<CubeModel> getAllCubes() {
    return new ArrayList<CubeModel>(cubes);
  }
  
  public CubeModel getCubeAtXYZ(PVector xyz) { 
    int x = (int)xyz.x,
        y = (int)xyz.y,
        z = (int)xyz.z;
    
    if (x < 0 || maxX <= x) throw new RuntimeException("x out of bounds.  Expected max: " + maxX + " but passed: " + x);
    if (y < 0 || maxY <= y) throw new RuntimeException("y out of bounds.  Expected max: " + maxY + " but passed: " + y);
    if (z < 0 || maxZ <= z) throw new RuntimeException("z out of bounds.  Expected max: " + maxZ + " but passed: " + z);
    
    return volumeXYZ[x][y][z];
  }
  
  //return all the CubeModels adjacent to an XYZ coordinate (if any)
  public ArrayList<CubeModel> getAdjacentCubes(PVector xyz) { 
    int x = (int)xyz.x,
        y = (int)xyz.y,
        z = (int)xyz.z;
    
    if (x < 0 || maxX <= x) throw new RuntimeException("x out of bounds.  Expected max: " + maxX + " but passed: " + x);
    if (y < 0 || maxY <= y) throw new RuntimeException("y out of bounds.  Expected max: " + maxY + " but passed: " + y);
    if (z < 0 || maxZ <= z) throw new RuntimeException("z out of bounds.  Expected max: " + maxZ + " but passed: " + z);
    
    ArrayList<CubeModel> adjacentCubes = new ArrayList<CubeModel>();
    
    for (int i=x-1; i <= x+1; i++) {
      if (i < 0 || maxX <= i) continue; // out of bounds, skip
      
      for (int j=y-1; j < y+1; j++) {
        if (j < 0 || maxY <= j) continue; // out of bounds, skip
        
        for (int k=z-1; k < z+1; z++) {
          if (k < 0 || maxZ <= k) continue; // out of bounds, skip
          
          if ( volumeXYZ[i][j][k] != null && // a cube exists
               (i != x  &&  j != y  &&  k != z)) { // we're not at the cube specified by the xyz
            adjacentCubes.add(volumeXYZ[i][j][k]);
          }
        }
      }
    }
    
    return adjacentCubes;
  }
}
