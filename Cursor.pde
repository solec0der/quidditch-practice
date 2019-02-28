class Cursor {
  private float mouseX;
  private float mouseY;
  private float mouseW;
  private float mouseH;
  private PImage mouseImage;

  public Cursor(float mouseX, float mouseY) {
    this.mouseImage = loadImage("resources/img/wand_cursor.png");
    this.mouseX  = mouseX;
    this.mouseY  = mouseY;
    this.mouseW = this.mouseImage.width * 0.25;
    this.mouseH = this.mouseImage.height * 0.25;
  }

  public void show() {
    pushMatrix();
    image(this.mouseImage, this.mouseX, this.mouseY, this.mouseW, this.mouseH); 
    popMatrix();
  }

  public void updateLocation(float mouseX, float mouseY) {
    this.mouseX  = mouseX;
    this.mouseY  = mouseY;
  }
}
