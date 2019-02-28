class Spell {
  private String name;
  private QuidditchPractice context;
  private String spellAudioPath;

  public Spell(String name, String spellAudioPath, QuidditchPractice context) {
    this.name = name;
    this.context = context;
    this.spellAudioPath = spellAudioPath;
  }

  public String getName() {
    return this.name;
  }

  public void playSpellAudio() {
    AudioManager spellAudio = new AudioManager(spellAudioPath, context);
    spellAudio.play();
  }
}
