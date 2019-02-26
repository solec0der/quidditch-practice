class Animation {
  PImage[] images;
  int imageCount;
  int frame;

  int isExpired = 5;

  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float x, float y, float w, float h) {
    if (isExpired ==5) {
      frame = (frame+1) % imageCount;
      image(images[frame], x, y, w, h);

      isExpired = 0;
    } else {
      
      image(images[frame], x, y, w, h);
     isExpired++; 
    }
  }

  int getWidth() {
    return images[0].width;
  }

  int getHeight() {
    return images[0].height;
  }
}
