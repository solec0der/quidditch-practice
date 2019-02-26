class Grass {
  private float x;
  private float y;
  private float w;
  private float h;
  private PImage image;

  public Grass(PImage image, float x) {
    this.image = image;

    this.w = 75;
    this.h = 75;
    this.x = x;
    this.y = height - this.h;
  }

  public void show() {
    image(this.image, this.x, this.y, this.w, this.h);
  }

  public void update(float xSpeed) {
    this.x -= xSpeed;
  }

  public float getX() {
    return this.x;
  }
}
