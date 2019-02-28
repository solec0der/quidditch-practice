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

  case 81:
    if (game.getSpellSelection().isVisible())
      game.getSpellSelection().executeSpellShortcut(0);	
    break;

  case 87:
    if (game.getSpellSelection().isVisible())
      game.getSpellSelection().executeSpellShortcut(1);	
    break;

  case 69:
    if (game.getSpellSelection().isVisible())
      game.getSpellSelection().executeSpellShortcut(2);	
    break;

  case 82:
    if (game.getSpellSelection().isVisible())
      game.getSpellSelection().executeSpellShortcut(3);	
    break;

  case 84:
    if (game.getSpellSelection().isVisible())
      game.getSpellSelection().executeSpellShortcut(4);	
    break;

  case 90:
    if (game.getSpellSelection().isVisible())
      game.getSpellSelection().executeSpellShortcut(5);	
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
