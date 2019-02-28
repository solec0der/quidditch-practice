class Game {
  private QuidditchPractice context;
  private AudioManager backgroundMusic;
  private Player player;
  private Terrain terrain;
  private SpellSelection spellSelection;
  private Cursor cursor;
  private ArrayList<Hoop> hoops;
  private float gameXSpeed = 5;
  private float xSpeedIncreaser = 1;
  private float xSpeedDecreaser = 5;
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
    if (isPlaying) {
      background(16, 180, 245);
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

      if (frameCount % 240 == 0)
        this.hoops.add(new Hoop());

      if (spellSelection.isVisible())
        spellSelection.show();

      checkHoopPassing();
    } else {
      background(16, 180, 245);
      this.terrain.show();

      for (Hoop hoop : hoops)
        hoop.showLeft();

      this.player.show();

      for (Hoop hoop : hoops) {
        hoop.showRight();
        hoop.showStand();
      }
    }

    this.cursor.show();
  }

  public boolean isPlaying() {
    return this.isPlaying;
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
      if (hoop.hasPassed(player))
        gameXSpeed += xSpeedIncreaser;
      else if (hoop.hasMissed(player))
        gameXSpeed = xSpeedDecreaser - gameXSpeed < 5? 5 : (gameXSpeed - xSpeedDecreaser);
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
