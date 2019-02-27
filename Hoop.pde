class Hoop {
  private float x;
  private float y;
  private float w;
  private float h;
  private boolean hasPassed = false;
  private boolean hasMissed = false;

  public Hoop() {
    this.x = width;
    this.y = random(0, height / 2);
    this.w = 80;
    this.h = 200;
  }

  public void showStand() {
    stroke(255, 215, 0);
    ellipseMode(CORNER);
    strokeWeight(5);
    noFill();
    line(this.x + this.w / 2, this.y + this.h, this.x + this.w / 2, height);
  }

  public void showLeft() {
    noFill();
    strokeWeight(4);
    stroke(255, 215, 0);
    arc(this.x, this.y, this.w, this.h, HALF_PI, PI + HALF_PI );
  }

  public void showRight() {
    noFill();
    strokeWeight(4);
    stroke(255, 215, 0);
    arc(this.x, this.y, this.w, this.h, -HALF_PI, HALF_PI );
  }

  public void update(float xSpeed) {
    this.x -= xSpeed * 1.2;
  }

  public boolean hasPassed(Player player) {
    if (!hasPassed) {
      float playerX = player.getX();
      float playerY = player.getY();
      float playerW = player.getW();
      float playerH = player.getH();

      if (playerX + playerW > x + w && playerY > y && playerY < y + h) {
        this.hasPassed = true;
        this.hasMissed = true;
        return true;
      }
    }
    return false;
  }

  public boolean hasMissed(Player player) {
    if (!hasMissed) {
      float playerX = player.getX();
      float playerY = player.getY();
      float playerW = player.getW();
      float playerH = player.getH();

      if (playerX + playerW > x + w) {
        this.hasMissed = true;
        return true;
      }
    }
    return false;
  }
}
