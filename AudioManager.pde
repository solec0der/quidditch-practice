import ddf.minim.*;

class AudioManager {

  private AudioPlayer player;
  private Minim minim;

  public AudioManager(String audioPath, QuidditchPractice context) {
    this.minim = new Minim(context);
    this.player = this.minim.loadFile(audioPath, 2048);
  }

  public void play() {
    player.play();
  }
}
