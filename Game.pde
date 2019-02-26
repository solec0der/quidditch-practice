class Game {
  private Player player;
  private Terrain terrain;
  private ArrayList<Hoop> hoops;
  private float gameXSpeed = 3;
  private float xSpeedIncreaser = 1;
  private float xSpeedDecreaser = 5;

  public Game() {
    this.player = new Player();
    this.terrain = new Terrain();
    this.hoops = new ArrayList();
  }

  public void loop() {
    this.terrain.show();
    this.terrain.update(gameXSpeed);

    for (Hoop hoop : hoops)
      hoop.showLeft();

    this.player.show();
    this.player.update();

    for (Hoop hoop : hoops) {
      hoop.showRight();
      hoop.showStand();
      hoop.update(gameXSpeed);
    }

    if (frameCount % 240 == 0) {
      this.hoops.add(new Hoop());
    }
    
    checkHoopPassing();
    
  }

  public void checkHoopPassing() {
   for (Hoop hoop: hoops) {
    if(hoop.hasPassed(player)) {
      gameXSpeed += xSpeedIncreaser;
    } else if(hoop.hasMissed(player)) {
      gameXSpeed = xSpeedDecreaser >= gameXSpeed ? 3 : (gameXSpeed -= xSpeedDecreaser);
    }
    
   }
  }

  public Player getPlayer() {
    return this.player;
  }
}
