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

  public void pause() {
    player.pause();
  }

  public void reduceVolume() {
    player.setGain(-20);
  }

  public void restoreVolume() {
    player.setGain(0);
  }
}
