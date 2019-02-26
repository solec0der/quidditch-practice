class Cloud {
 private float x;
 private float y;
 private float w;
 private float h;
 
 private PImage image;
 
 public Cloud() {
  this.x = width + random(0, 200);
  this.y = random(0, height / 4);
  
  this.image = loadImage("resources/img/cloud-1.png");
  this.w = image.width * 0.5;
  this.h = image.height * 0.5;
 }
 
 public void show() {
  image(this.image, this.x, this.y, this.w, this.h); 
 }
 
 public void update(float xSpeed) {
  this.x -= xSpeed; 
 }
 
}
