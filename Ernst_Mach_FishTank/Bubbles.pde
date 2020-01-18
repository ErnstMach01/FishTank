class Bubble {
  int PositionX;    // bubble x coordinate
  int PositionY;    // bubble y coordinate
  int Size;         // size of the bubble
  int speed;        // how fast the bubble moves
  float jiggle;     // bubble moving irregularly to be more realistic 
  PImage BGImage;   // Background image
  PImage Bubble;    // Bubble image

  // This is the default constructor
  Bubble(int xPosition, int yPosition, int diameter, int velocity) {
    PositionX = xPosition;
    PositionY = yPosition;
    speed = velocity;
    Size = diameter;
  }

  // load image
  void load() {
    Bubble = loadImage("Bubble.png");
  }

  // draws the bubble with background management, once the bubble rises to a certain point the bubble will then go to the bottom of the screen and rise back up
  void display() {
    jiggle = random(-1, 1);    // used to make the bubble move in a more reaslitic way
    if (PositionY < -70) {
      image(BGImage, PositionX - int(jiggle)-1, PositionY, Size+2, Size+2);      // clears background
      PositionY = 924;                                                           // puts bubble back to the bottom of the screen
      PositionX = int(random(width));                                            // sets new random x location
      BGImage=get(PositionX - int(jiggle)-1, PositionY, Size+2, Size+2);         // gets the new background
    }
    image(Bubble, PositionX+jiggle, PositionY, Size, Size);                      // draws the bubble
  }

  // clear the screen
  void returnImage() {
    image(BGImage, PositionX - int(jiggle)-1, PositionY, Size+2, Size+2);
  }

  // calculate the new location of the bubble and grabs the pixel background
  void getBGImage() {
    PositionY -= speed;
    BGImage=get(PositionX - int(jiggle)-1, PositionY, Size+2, Size+2);
  }

  // collision detection for fish, if touches makes the bubble disapear and then begin to rise again
  void collide(Fish other) {
    float distY = PositionY-other.position.y ;
    if (distY < other.BoundingRectY && PositionY > other.position.y && PositionX > other.position.x  && PositionX < other.position.x+other.BoundingRectX) {
      returnImage();    // clears the screen
      PositionY = -60;  // moves the bubble to a loaction off-screen
      getBGImage();     // calculates the new loaction of the bubble and grabs background
    }
  }
}