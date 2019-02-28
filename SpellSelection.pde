class SpellSelection {

  private QuidditchPractice context;
  private boolean isVisible = false;
  private ArrayList<Spell> availableSpells;
  private int activeSpellIndex = 0;
  private PImage wandCursor;
  private float w;
  private float h;
  private float wandW;
  private float wandH;

  public SpellSelection(QuidditchPractice context) {
    this.context = context;

    this.availableSpells = new ArrayList();

    PFont myFont = createFont("PMono", 10);
    textFont(myFont);

    this.availableSpells.add(new Spell("Sectumsempra", "resources/audio/sectumsempra.wav", context));
    this.availableSpells.add(new Spell("Reducto", "resources/audio/reducto.wav", context));

    this.wandCursor = loadImage("resources/img/wand_cursor.png");

    this.wandW = this.wandCursor.width * 0.125;
    this.wandH = this.wandCursor.height * 0.125;

    this.w = width;
    this.h = 150;
  }

  public void show() {
    // Show options
    int elements = availableSpells.size();
    float elementWidth = width * 0.15;
    float elementHeight = height * 0.05;

    float marginWidth = width * 0.05;
    float marginHeight = height * 0.05;

    float containerHeight = elements * elementHeight + (marginHeight * elements);

    float currentYPosition = height - containerHeight - marginHeight;



    for (int i = 0; i < elements; i++) {
      Spell spell = this.availableSpells.get(i);
      noStroke();

      fill(37, 227, 252);
      rect(width - elementWidth - marginWidth, currentYPosition, elementWidth, elementHeight);
      fill(255);
      textAlign(CENTER);
      text(spell.getName(), width - elementWidth - marginWidth + elementWidth / 2, currentYPosition + elementHeight / 2);

      if (i == activeSpellIndex) {
        image(this.wandCursor, width - elementWidth - marginWidth + elementWidth * 0.95, currentYPosition + elementHeight / 2, this.wandW, this.wandH);
      }

      currentYPosition += marginHeight / 2 + elementHeight;
    }
  }

  // text(spell.getName(), elementWidth * i + elementWidth / 2, height - this.h / 2);

  public void activateSpellSelection() {
    this.isVisible = true;
  }

  public void deactivateSpellSelection() {
    this.isVisible = false;
  }

  public void executeSpell() {
    Spell activeSpell = this.availableSpells.get(this.activeSpellIndex);
    activeSpell.playSpellAudio();
  }

  public void nextSpell() {
    this.activeSpellIndex = this.activeSpellIndex != this.availableSpells.size() - 1 ? ++this.activeSpellIndex : this.activeSpellIndex;
    println(this.activeSpellIndex);
  }

  public void previousSpell() {
    this.activeSpellIndex = this.activeSpellIndex > 0 ? --this.activeSpellIndex : this.activeSpellIndex;
  }

  public boolean isVisible() {
    return this.isVisible;
  }
}
