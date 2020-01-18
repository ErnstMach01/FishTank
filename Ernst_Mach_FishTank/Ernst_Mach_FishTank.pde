/**
 * Assignment: [ISP - Fistank]
 * Author: [Ernst Mach]
 * Date: [31/05/2017]
 * Description: Creates a fishtank simulation, fish will appear on the screen along with bubbles 
 * and an assortment of other things that can be found in a fish tank. The user can control how fast 
 * the fish can move, stop and start the fish, as well as reseting the simulation. 
 * NOTE: Created for 1280 by 1024 screen resolutions.
 */

// creates instruction messages for the user
String Message2 = "Press the Pause/Start button to stop and resume the fish";
String Message3 = "Press the Increase button to speed up the fish";
String Message4 = "Press the Decrease button to slow down the fish";
String Message5 = "The static objects are 1 treasure chest, 1 group of seaweed, 2 coral, and 2 rocks";

// array for creating the fish in the program
Fish[] Fish = {
  new Fish(int(random(0, 100)), int(random(500)), "Fish1.png", "Fish1Flip.png", 70, 40, random(-2, 2), random(-1, 1)), 
  new Fish(int(random(150, 250)), int(random(500)), "Fish2.png", "Fish2Flip.png", 70, 40, random(-2, 2), random(-1, 1)), 
  new Fish(int(random(300, 400)), int(random(500)), "Fish3.png", "Fish3Flip.png", 70, 40, random(-2, 2), random(-1, 1)), 
  new Fish(int(random(450, 550)), int(random(500)), "Fish4.png", "Fish4Flip.png", 70, 40, random(-2, 2), random(-1, 1)), 
  new Fish(int(random(600, 650)), int(random(500)), "Fish5.png", "Fish5Flip.png", 70, 40, random(-2, 2), random(-1, 1)), 
  new Fish(int(random(700, 800)), int(random(500)), "Fish6.png", "Fish6Flip.png", 70, 40, random(-2, 2), random(-1, 1)), 
};

// array for creating all the different static objects in the program
Static[] Object = {
  new Static(1000, 864, "Stone.png", 90, 60), 
  new Static(350, 864, "Stone.png", 90, 60), 
  new Static(200, 774, "Coral.png", 150, 150), 
  new Static(800, 774, "Coral.png", 150, 150), 
  new Static(500, 724, "Seaweed.png", 200, 200), 
  new Static(0, 724, "Chest.png", 200, 200), 
};

// array for creating all the buttons in the program
Button[] Buttons = {
  new Button(0, 924, #21AA26, 255, 100, 100, "Pause/Start"), 
  new Button(100, 924, #FC3B3B, 255, 100, 100, "Reset"), 
  new Button(1080, 924, #F007D5, 255, 100, 100, "Increase" ), 
  new Button(1180, 924, #F0E507, 255, 100, 100, "Decrease" ), 
  new Button(200, 924, #86DEFF, 255, 880, 100, "Press the Reset button to send the fish back to their original spots" ), 
};

// array for creating all the bubbles in the program
Bubble[] Bubbles={
  new Bubble(int(random(1280)), width, int(random(10, 40)), int(random(1, 3))), 
  new Bubble(int(random(1280)), width, int(random(10, 40)), int(random(1, 3))), 
  new Bubble(int(random(1280)), width, int(random(10, 40)), int(random(1, 3))), 
  new Bubble(int(random(1280)), width, int(random(10, 40)), int(random(1, 3))), 
  new Bubble(int(random(1280)), width, int(random(10, 40)), int(random(1, 3))), 
  new Bubble(int(random(1280)), width, int(random(10, 40)), int(random(1, 3))), 
  new Bubble(int(random(1280)), width, int(random(10, 40)), int(random(1, 3))), 
  new Bubble(int(random(1280)), width, int(random(10, 40)), int(random(1, 3))), 
};

boolean MousePressed = true;            // boolean used to control the fish
PImage Background;                      // PImage used to store the background
Animation Animations;                   // creating the instance of the limb object in the program

void setup() {
  fullScreen();                                                    // makes sure that the screen is full screen
  Background = loadImage("Background.jpg");                        // loads the background image
  image(Background, 0, 0, width, 924);                             // renders the background image on the screen once
  Animations = new Animation("Crab", 6, 1100, 800, 180, 125);      // creates the limb object

  // set up the fish and static objects to be rendered on the screen
  for (int i = 0; i<6; i++ ) {  
    Fish[i].load();          // loads the fish images
    Fish[i].getBGImage();    // grabs the background  of where the fish will be rendered
    Object[i].load();        // loads the object images
  }

  // set up the bubbles to be rendered on the screen
  for (int i=0; i<8; i++) {
    Bubbles[i].load();         // loads the bubble image
    Bubbles[i].getBGImage();   // grabs the background of where the bubble will be rendered
  }
}

void draw() {

  // draws all the buttons on the screen
  for ( int i=0; i<5; i++ ) {
    Buttons[i].draw();
  }

  // draws the message instructions on the screen
  text(Message2, 200+924/2-textWidth(Message2)/2, 920+100/2-12);
  text(Message3, 200+924/2-textWidth(Message3)/2, 920+100/2+20);
  text(Message4, 200+924/2-textWidth(Message4)/2, 920+100/2+36);
  text(Message5, 200+924/2-textWidth(Message5)/2, 920+100/2-29);

  // draws the moving limb object on the screen
  Animations.display();

  for (int i=0; i<6; i++) {
    Object[i].draw();                // draws the objects on the screen
    for ( int n=0; n<6; n++) {
      Object[i].collision(Fish[n]);  // calculates if a fish collides with the object
    }
  }

  for (int i = 0; i<6; i++ ) {
    Fish[i].returnImage();           // removes the fish image by placing a background image over the fish
  }

  for (int i=0; i<8; i++) {
    Bubbles[i].returnImage();        // removes the bubbles by placing a background image over the bubble
  }

  for (int i = 0; i<6; i++ ) {
    Fish[i].getBGImage();            // calculates where the fish will go next and grabs the background pixels
  }

  for (int i=0; i<8; i++) {
    Bubbles[i].getBGImage();        // calcaultes where the bubble will go next and grabs the background pixels
  }

  for (int i = 0; i <6; i++ ) {
    Fish[i].paint();                // draws the fish onto the screen
  }

  for (int i=0; i<8; i++) {
    Bubbles[i].display();           // draws the bubbles on the screen
  }

  // calculates if a fish collides with another fish
  Fish[0].collide(Fish[1]);
  Fish[0].collide(Fish[2]);
  Fish[0].collide(Fish[3]);
  Fish[0].collide(Fish[4]);
  Fish[0].collide(Fish[5]);

  Fish[1].collide(Fish[2]);
  Fish[1].collide(Fish[3]);
  Fish[1].collide(Fish[4]);
  Fish[1].collide(Fish[5]);

  Fish[2].collide(Fish[3]);
  Fish[2].collide(Fish[4]);
  Fish[2].collide(Fish[5]);

  Fish[3].collide(Fish[4]);
  Fish[3].collide(Fish[5]);

  Fish[4].collide(Fish[5]);

  // calculates if a bubble collides with a fish
  for (int i=0; i<8; i++) {
    for (int n=0; n<6; n++) {
      Bubbles[i].collide(Fish[n]);
    }
  }
}

void mousePressed() {
  Buttons[0].Invert();        // invertes the boolean
  // checks if a button is pressed
  for (int i = 0; i<6; i++ ) {  
    Fish[i].Reset(Buttons[1]);  // fish return to the location they were rendered on originally
    Fish[i].Increase(Buttons[2]);  // fish speed increase
    Fish[i].Decrease(Buttons[3]);  // fish speed decrease
  }
}