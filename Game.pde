class Game {
  private QuidditchPractice context;
  private AudioManager backgroundMusic;
  private Player player;
  private Terrain terrain;
  private SpellSelection spellSelection;
  private Cursor cursor;
  private ArrayList<Hoop> hoops;
  private float gameXSpeed = 5;
  private float xSpeedIncreaser = 2;
  private float xSpeedDecreaser = 5;
  private float maxSpeed = 20;
  private boolean isPlaying = true;

  public Game(QuidditchPractice context) {
    this.context = context;
    this.player = new Player();
    this.terrain = new Terrain();
    this.spellSelection = new SpellSelection();
    this.cursor = new Cursor(mouseX, mouseY);
    this.hoops = new ArrayList();
    this.backgroundMusic = new AudioManager("resources/audio/hogwarts_march.mp3", context);
    this.backgroundMusic.play();
  }

  public void loop() {

    background(16, 180, 245);
    this.terrain.show();

    for (Hoop hoop : hoops)
      hoop.showLeft();

    showInformation();
    showSpeedIndicator();

    this.player.show();

    for (Hoop hoop : hoops) {
      hoop.showRight();
      hoop.showStand();
    }

    this.cursor.show();

    if (isPlaying) {
      this.terrain.update(gameXSpeed);
      this.player.update();

      for (Hoop hoop : hoops)
        hoop.update(gameXSpeed);

      if (frameCount % 240 == 0)
        this.hoops.add(new Hoop());

      if (spellSelection.isVisible())
        spellSelection.show();

      checkHoopPassing();

      if (player.isOffscreen()) {
        endGame();
      }
    }
  }

  public void showSpeedIndicator() {
    float maxWidth = width / 6;
    float maxHeight = 25;

    float relativeSpeed = gameXSpeed / maxSpeed;
    float relativeWidth = maxWidth * relativeSpeed;
    noStroke();
    fill(255);
    rect(10, 10, maxWidth, maxHeight);

    setGradient(10, 10, relativeWidth, maxHeight - 1, color(2, 146, 242), color(255, 255, 255));
    noStroke();
    rect(10, 10, relativeWidth, maxHeight);
  }

  public void setGradient(int x, int y, float w, float h, color c1, color c2) {
    noFill();

    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      strokeWeight(1);
      stroke(c);
      line(i, y, i, y+h);
    }
  }

  public void showInformation() {
    // Instructions
    fill(255);
    textSize(16);
    textAlign(LEFT);
    text("[S] Spells", 20, 70);
  }

  public boolean isPlaying() {
    return this.isPlaying;
  }

  public void endGame() {
    AudioManager deathSound = new AudioManager("resources/audio/dead.wav", context);
    deathSound.play(); 
    this.isPlaying = false;
    this.backgroundMusic.pause();
  }

  public void pauseGame() {
    this.isPlaying = false;
    this.backgroundMusic.pause();
    AudioManager pauseSound = new AudioManager("resources/audio/pause.mp3", context);
    pauseSound.play();
  }

  public void resumeGame() {
    this.backgroundMusic.play();
    this.isPlaying = true;
  }

  public void checkHoopPassing() {
    for (Hoop hoop : hoops) {
      if (hoop.hasPassed(player)) {
        gameXSpeed += xSpeedIncreaser;
        println("ja");
      } else if (hoop.hasMissed(player)) {
        gameXSpeed = xSpeedDecreaser - gameXSpeed < 5 ? 5 : (gameXSpeed - xSpeedDecreaser);
        println("nein");
      }
    }
  }

  public SpellSelection getSpellSelection() {
    return this.spellSelection;
  }

  public Player getPlayer() {
    return this.player;
  }

  public Cursor getCursor() {
    return this.cursor;
  }
}
