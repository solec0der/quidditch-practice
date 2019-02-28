class Player {
  private float x;
  private float y;
  private float w;
  private float h;
  private Animation playerImage;
  private float targetY;

  public Player() {
    this.playerImage = new Animation("resources/img/harry_on_broom/harry_on_broom_", 3);

    this.w = this.playerImage.getWidth() / 2.5;
    this.h = this.playerImage.getHeight() / 2.5;

    this.x = 75;
    this.y = height / 2 - this.h / 2;
  }

  public void show() {
    this.playerImage.display(this.x, this.y, this.w, this.h);
  } 

  public void update() {
    if (abs(this.y - this.targetY) > 10) {
      float distance = abs(this.y - this.targetY);
      float speed = map(distance, 0, height, 1, 20); 

      this.y += this.y > this.targetY ? -speed : speed;
    }
  }

  public void setTargetY(float targetY) {
    this.targetY = targetY - h / 2;
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
