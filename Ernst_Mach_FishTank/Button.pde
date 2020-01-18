class Button {
  color Colour;            // colour of the object
  color Stroke;            // colour of the text
  float xPosition;         // object x coordinate
  float yPosition;         // object y coordinate
  float Width;             // object width
  float Height;            // object height
  String Message;          // the message that the object will project
  int textSize;            // the size of the text
  float textColour;        // colour of the text font

  // This is the default constructor
  Button(float xCoord, float yCoord, color ColourVal, color ColourStroke, float WidthSet, float HeightSet, String text) {
    yPosition = yCoord;
    xPosition = xCoord;
    Colour = ColourVal;
    Stroke = ColourStroke;
    Width = WidthSet;
    Height = HeightSet;
    Message = text;
    textSize = 13;
    textColour = 0;
  }

  // draws the object at the current location
  void draw() {
    fill(Colour);
    textSize(textSize);
    stroke(Stroke);
    rect(xPosition, yPosition, Width, Height);
    fill(textColour);
    text(Message, xPosition+Width/2-textWidth(Message)/2, yPosition+Height/2);
  }

  // Checks if the mouse is over the button
  void Invert() { 
    if (mouseX > xPosition && mouseX < xPosition+Width && 
      mouseY > yPosition && mouseY < yPosition+Height) {
      MousePressed = !MousePressed;    // inverts the boolean
    }
  }
}