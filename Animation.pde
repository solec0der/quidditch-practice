class Animation {
  private PImage[] images;
  private int imageCount;
  private int frame;

  private int isExpired = 5;

  public Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }

  public void display(float x, float y, float w, float h) {
    if (isExpired == 5) {
      frame = (frame+1) % imageCount;
      image(images[frame], x, y, w, h);
      isExpired = 0;
    } else {
      image(images[frame], x, y, w, h);
      isExpired++;
    }
  }

  public int getWidth() {
    return images[0].width;
  }

  public int getHeight() {
    return images[0].height;
  }
}
