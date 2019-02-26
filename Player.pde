class Player {
  private float x;
  private float y;
  private float w;
  private float h;
  private PImage playerImage;
  private float ySpeed = 5;
  private float gravity = 0.2;
  private float lift = -10;
  private float targetY;

  public Player() {
    this.playerImage = loadImage("harry.png");

    this.w = playerImage.width / 2;
    this.h = playerImage.height / 2;

    this.x = 75;
    this.y = height / 2 - this.h / 2;
  }

  public void show() {
    image(this.playerImage, this.x, this.y, this.w, this.h);
  } 

  public void update() {
    if (abs(this.y - this.targetY) > 10) {
      float distance = abs(this.y - this.targetY);

      float speed = map(distance, 0, height, 1, 20); 

      this.y += this.y > this.targetY ? -speed : speed;
    }
  }

  public void setTargetY(float targetY) {
    this.targetY = targetY;
  }

  public boolean isOffscreen() {
    return this.y + this.h > height;
  }

  public float getX() {
    return this.x;
  }

  public float getY() {
    return this.y;
  }

  public float getW() {
    return this.w;
  }

  public float getH() {
    return this.h;
  }
}
