class Spell {
  private String name;
  // Colors
  private int r;
  private int g;
  private int b;

  public Spell(String name, int r, int g, int b) {
    this.name = name;
    this.r = r;
    this.g = g;
    this.b = b;
  }

  public String getName() {
    return this.name;
  }
  
  public int getR() {
    return this.r;
  }
  
  public int getG() {
    return this.g;
  }
  
  public int getB() {
    return this.b;
  }
}
