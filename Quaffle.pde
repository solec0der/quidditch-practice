class Quaffle {
  private float quaffleX;
  private float quaffleY;
  private float quaffleW;
  private float quaffleH;
  
  private float quaffleXSpeed;
  private float quaffleYSpeed;
  
  private float angle = 0;
  private PImage image;
  
  public Quaffle(float playerX, float playerY) {
    
    this.quaffleX = width;
    this.quaffleY = random(height);
    
    this.quaffleXSpeed = random(-10, -5);
    this.quaffleYSpeed = 0;
    
    this.quaffleW = 50;
    this.quaffleH = 50;
    
    this.image = loadImage("quaffle.png");
  }
  
  public void show() {
    image(image, this.quaffleX, this.quaffleY, this.quaffleW, this.quaffleH);
  }
  
  public void update() {
    this.quaffleX += this.quaffleXSpeed;
    this.quaffleY += this.quaffleYSpeed;
  }
}
