Game game;


public void setup() {
  size(1280, 720);
  game = new Game(this);
}

public void draw() {
  background(16, 180, 245);

  game.loop();
  println(frameRate);
}

public void mouseMoved() {
  game.getPlayer().setTargetY(mouseY);
}

public void keyPressed() {
}
