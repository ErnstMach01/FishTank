class Fish {
  int PositionX, PositionY, BoundingRectX, BoundingRectY;    // x position, y position, and the bounding rectangle of the fish
  float xIncrease, yIncrease;                                // the x and y speed of the fish
  PImage SpriteImage;                                        // image of the fish
  String Sprite;                                             // name used to load fish
  String FlipSprite;                                         // name used to load opposite flip of fish
  PImage BGImage;                                            // background image
  Vector position;                                           // vector for position of the fish
  Vector velocity;                                           // vector for the speed of the fish
  Vector velocityHold;                                       // vector to remember the original speed of the fish

  // This is the default constructor
  Fish(int xPosition, int yPosition, String LoadSprite, String FlipSpriteImage, int BoundingX, int BoundingY, float xInc, float yInc) {
    PositionX = xPosition;
    PositionY = yPosition;
    FlipSprite = FlipSpriteImage;
    Sprite = LoadSprite;
    BoundingRectX = BoundingX;
    BoundingRectY = BoundingY;
    xIncrease = xInc;
    yIncrease = yInc;
    velocity = new Vector(xInc, yInc);
    position = new Vector(xPosition, yPosition);
    velocityHold = new Vector(0, 0);
  }

  // load image
  void load() {
    SpriteImage = loadImage(Sprite);
  }

  // draws the fish onto the screen
  void paint() {
    // checks if the fish touches the side of the screen
    if ( position.x > width - BoundingRectX || position.x < 0) {
      velocity.x *= -1;
    }

    // checks if the fish touches the top or bottom of the screen
    if (position.y > height-100 - BoundingRectY || position.y < 0) {
      velocity.y *= -1;
    }

    // checks if the fish is going to the right and flips the image of the fish 
    if (velocity.x > 0) {          
      SpriteImage = loadImage(Sprite);
      image(SpriteImage, position.x, position.y, BoundingRectX, BoundingRectY);
    }

    // checks if the fish is going to the left and flips the image of the fish
    if (velocity.x < 0) {
      SpriteImage = loadImage(FlipSprite);
      image(SpriteImage, position.x, position.y, BoundingRectX, BoundingRectY);
    }
  }

  // clear the screen
  void returnImage() {
    image(BGImage, position.x, position.y, BoundingRectX, BoundingRectY);
  }

  // calculate the new location of the fish and grabs the pixel background
  void getBGImage() {
    if (MousePressed == false) {
      image(SpriteImage, position.x, position.y, BoundingRectX, BoundingRectY);   // clears the screen when the fish returns to the original spot
      return;
    }
    position.add(velocity);
    BGImage = get(int(position.x), int(position.y), BoundingRectX, BoundingRectY);
  }

  // collision detection for fish, if touches changes direction of both fish
  void collide(Fish other) {
    if (other.position.x+other.BoundingRectX > position.x && other.position.x < position.x+BoundingRectX && 
      other.position.y+other.BoundingRectY > position.y && position.y+BoundingRectY > other.position.y) {
      velocity.x *= -1;
      velocity.y *= -1;
      other.velocity.x *=-1;
      other.velocity.y *= -1;
    }
  }

  // checks if button is pressed, resets the speed and position of the fish to the original
  void Reset(Button other) {
    if (mouseX > other.xPosition && mouseX < other.xPosition+other.Width && mouseY > other.yPosition && mouseY < other.yPosition+other.Height) {
      image(BGImage, position.x, position.y, BoundingRectX, BoundingRectY);
      position = new Vector(PositionX, PositionY);      // reset the position to the starting position
      velocity = new Vector(xIncrease, yIncrease);      // rest the speed to the starting speed
      BGImage = get(int(position.x), int(position.y), BoundingRectX, BoundingRectY);      // grabs the background of the new location
    }
  }

  // checks if button is pressed, increases the speed of the fish
  void Increase(Button other) {
    if (mouseX > other.xPosition && mouseX < other.xPosition+other.Width && mouseY > other.yPosition && mouseY < other.yPosition+other.Height) {
      velocity.multiply(1.2);
    }
  }

  // checks if button is pressed, decrease the speed of the fish
  void Decrease(Button other) {
    if (mouseX > other.xPosition && mouseX < other.xPosition+other.Width && mouseY > other.yPosition && mouseY < other.yPosition+other.Height) {
      velocity.multiply(0.8);
    }
  }
}