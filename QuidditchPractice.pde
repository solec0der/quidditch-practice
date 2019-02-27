Game game;


public void setup() {
  size(1280, 720);
  game = new Game(this);
}

public void draw() {
  game.loop();
}

public void mouseMoved() {
  game.getPlayer().setTargetY(mouseY);
}

public void keyPressed() {
  switch (key) {
  case 'p':
    if (game.isPlaying())
      game.pauseGame();
    else
      game.resumeGame();
    break;
  }
}
