class Static {
  float PositionX, PositionY, BoundingRectX, BoundingRectY;       // x position, y position, and the bounding rectangle of the object
  PImage SpriteImage;                                             // image of the object
  String Sprite;                                                  // name used to load object

  // This is the default constructor
  Static(float xPosition, float yPosition, String LoadSprite, float BoundingX, float BoundingY) {
    PositionX = xPosition;
    PositionY = yPosition;
    Sprite = LoadSprite;
    BoundingRectX = BoundingX;
    BoundingRectY = BoundingY;
  }

  // load image
  void load() {
    SpriteImage = loadImage(Sprite);
  }

  // draws the object at the current location
  void draw() {
    image(SpriteImage, PositionX, PositionY, BoundingRectX, BoundingRectY);
  }

  // collision detection for fish, if touches makes the fish will go in the complete opposite direction 
  void collision(Fish other) {
    if (other.position.x+other.BoundingRectX > PositionX && other.position.x < PositionX+BoundingRectX && 
      other.position.y+other.BoundingRectY > PositionY) {
      other.velocity.x *= -1;
      other.velocity.y *= -1;
    }
  }
}