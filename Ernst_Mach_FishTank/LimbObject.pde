// Class for animating a sequence of GIFs
// Code taken from https://processing.org/examples/animatedsprite.html
// Animated Sprite (Shifty + Teddy) by James Paterson

class Animation {
  PImage[] images;                    // array to hold the multiple images of the gif
  int imageCount;                     // number of pictures
  float frame=1;                      // which frame the gif is at
  PImage BGImage;                     // background image
  float PositionX, PositionY;         // x position and y position of the image
  int BoundingRectX, BoundingRectY;   // width and height of the image

  // This is the default constructor
  Animation(String imagePrefix, int count, float xpos, float ypos, int BoundingX, int BoundingY) {
    imageCount = count;
    images = new PImage[imageCount];
    PositionX = xpos;
    PositionY = ypos;
    BoundingRectX = BoundingX;
    BoundingRectY = BoundingY;

    // load the multiple images
    for (int i = 1; i < imageCount; i++) {
      String filename = imagePrefix + i + ".gif";  
      images[i] = loadImage(filename);
    }
    BGImage = get(int(PositionX), int(PositionY), BoundingRectX, BoundingRectY);  // gets the background image
  }

  // draws the images onto the screen
  void display() {
    frame += 0.05;                                                       // increases to control which image is placed onto the screen
    if (frame > imageCount-1) {                                          // allows for the images to be continuously draw
      frame =1;                                                          // resets the frame count
    }
    image(BGImage, PositionX, PositionY, BoundingRectX, BoundingRectY);  // clears screen 
    image(images[int(frame)], PositionX, PositionY);                     // draws new image on screen
  }
}