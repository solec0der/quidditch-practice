Game game;

public void setup() {
  size(1280, 720);
  // fullScreen();
  game = new Game(this);
}

public void draw() {
  noCursor();
  game.loop();
}

public void mouseMoved() {
  game.getPlayer().setTargetY(mouseY);
  game.getCursor().updateLocation(mouseX, mouseY);
}

public void keyPressed() {
  switch(keyCode) {
  case ENTER:
    if (game.getSpellSelection().isVisible())
      game.getSpellSelection().executeSpell(); 
    break;

  case 38:
    game.getSpellSelection().previousSpell();
    break;

  case 40:
    game.getSpellSelection().nextSpell();
    break;
  case 80:
    if (game.isPlaying())
      game.pauseGame();
    else
      game.resumeGame();
    break;

  case 83:
    if (!game.getSpellSelection().isVisible())
      game.getSpellSelection().activateSpellSelection();
    else 
    game.getSpellSelection().deactivateSpellSelection();
    break;
  }
}
