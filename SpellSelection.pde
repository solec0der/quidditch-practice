class SpellSelection {

  private boolean isVisible = false;
  private ArrayList<Spell> availableSpells;
  private int activeIndeX;
  private float w;
  private float h;

  public SpellSelection() {
    this.availableSpells = new ArrayList();
    
    PFont myFont = createFont("PMono", 10);
    textFont(myFont);

    this.availableSpells.add(new Spell("Stupefy", 37, 52, 252));
    this.availableSpells.add(new Spell("Sectumsempra", 252, 37, 77));
    this.availableSpells.add(new Spell("Reducto", 37, 227, 252));

    this.w = width;
    this.h = 150;
  }

  public void show() {
    // Show options
    int elements = availableSpells.size();
    float elementWidth = this.w / elements;

    for (int i = 0; i < elements; i++) {
      Spell spell = this.availableSpells.get(i);
      noStroke();
      fill(spell.getR(), spell.getG(), spell.getB());
      rect(elementWidth * i, height - this.h, elementWidth, this.h);
      fill(255);
      textSize(32);
      textAlign(CENTER);

      text(spell.getName(), elementWidth * i + elementWidth / 2, height - this.h / 2);
      //println("test");
    }
  }

  public void activateSpellSelection() {
    this.isVisible = true;
  }

  public void deactivateSpellSelection() {
    this.isVisible = false;
  }

  public boolean isVisible() {
    return this.isVisible;
  }
}
