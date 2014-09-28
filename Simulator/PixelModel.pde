/* Pixel Model
 * A pixel consists of an index in the string and a color
 */
public class PixelModel {  
  int index;
  color myColor;

  public PixelModel(int i, int r, int g, int b) {
    index = i;
    myColor = color(r, g, b);
  }
  
  public PixelModel(int i, color c) {
    index = i;
    myColor = c;
  }
  
  public void setColor(int r, int g, int b) {
    myColor = color(r,g,b);
  }
  
  public void setColor(color c) {
    myColor = c;
  }
  
  public color getColor() {
    return myColor; 
  }
  
  public int getIndex() {
    return index;
  }
}
