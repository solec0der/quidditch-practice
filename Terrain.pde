class Terrain {
  private ArrayList<Grass> grassElements; 
  private ArrayList<Cloud> clouds;

  private float grassW = 50;
  private float grassH = 50;
  private PImage grassImage;

  public Terrain() {
    this.grassElements = new ArrayList();
    this.grassImage = loadImage("resources/img/grass.png");
    this.clouds = new ArrayList();

    int amountGrassElements = (int) width / (int) this.grassW;

    for (int i = 0; i < amountGrassElements * 1.05; i++) {
      Grass grass = new Grass(grassImage, i * this.grassW);
      grassElements.add(grass);
    }
  }

  public void update(float xSpeed) {
    if (frameCount % 160 == 0)
      this.clouds.add(new Cloud()); 

    for (Cloud cloud : this.clouds)
      cloud.update(xSpeed);

    for (Grass grass : this.grassElements)
      grass.update(xSpeed);

    Grass firstElement = this.grassElements.get(0);

    if (firstElement.getX() < -grassW) {
      Grass lastElement = this.grassElements.get(this.grassElements.size() - 1);
      float lastX = lastElement.getX();

      this.grassElements.add(new Grass(this.grassImage, lastX + grassW));
      this.grassElements.remove(0);
    }
  }


  public void show() {
    noStroke();
    fill(137, 87, 55);
    rect(0, height - grassH / 2, width, height);

    for (Cloud cloud : this.clouds)
      cloud.show();

    for (Grass grass : this.grassElements)
      grass.show();
  }
}
