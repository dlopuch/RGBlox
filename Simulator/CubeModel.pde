// Class to draw one cube at a time

// Each cube has 4 pixels, arranged in positions, anterior (1), superior (2), posterior (3), inferior (4)

// Initialize each cube with a mapping to linear dimension along LED strip

public class CubeModel {
  PixelModel anterior, superior, posterior, inferior;
  
  int[] myXYZ;
  
  // initialize cube 4 pixel objects with default color of black
  // pixelStartI is the starting pixel position.  Creates 4 consequetive pixels starting at pixelStartI 
  public CubeModel(int pixelStartI, int x, int y, int z) {
    anterior  = new PixelModel(pixelStartI,     color(0) );
    superior  = new PixelModel(pixelStartI + 1, color(0) );
    posterior = new PixelModel(pixelStartI + 2, color(0) );
    inferior  = new PixelModel(pixelStartI + 3, color(0) );
    
    myXYZ = new int[]{x,y,z};
  }
  
  // returns a 3-element array with the xyz position of this cube ([0] is x, [1] y, [2] z)
  int[] getXYZ() {
    return myXYZ.clone();
  }
    
  void setAnteriorRGB (int r, int g, int b) {  anterior.setColor(r, g, b); }
  void setSuperiorRGB (int r, int g, int b) {  superior.setColor(r, g, b); }  
  void setPosteriorRGB(int r, int g, int b) { posterior.setColor(r, g, b); }
  void setInferiorRGB (int r, int g, int b) {  inferior.setColor(r, g, b); }
  
  void setAnteriorColor (color c){ anterior.setColor(c); }
  void setSuperiorColor (color c){ superior.setColor(c); }
  void setPosteriorColor(color c){ posterior.setColor(c); }
  void setInferiorColor (color c){ inferior.setColor(c); }
  void setColor(color c) {
    anterior.setColor(c);
    superior.setColor(c);
    posterior.setColor(c);
    inferior.setColor(c);
  }
  
  color getAnteriorColor() { return anterior.getColor(); }
  color getSuperiorColor() { return superior.getColor(); }
  color getPosteriorColor(){ return posterior.getColor(); }
  color getInferiorColor() { return inferior.getColor(); }
  color getColor() { return anterior.getColor(); } // TODO: return list?
  
  PixelModel getAnterior() { return anterior; }
  PixelModel getSuperior() { return superior; }
  PixelModel getPosterior(){ return posterior; }
  PixelModel getInferior() { return inferior; }
  
  // rotates the colors of the LEDs one step forward, towards the viewer
  void rotateForward() { 
    color temp = anterior.getColor();
    
    anterior.setColor(superior.getColor());
    superior.setColor(posterior.getColor());
    posterior.setColor(inferior.getColor());
    inferior.setColor(temp);
  }
  
  // rotates the colors of the LEDs one step backward, away from the viewer
  void rotateBack()  {
    color temp = inferior.getColor();
    
    inferior.setColor(posterior.getColor());
    posterior.setColor(superior.getColor());
    superior.setColor(anterior.getColor());
    anterior.setColor(temp);
  }
}
