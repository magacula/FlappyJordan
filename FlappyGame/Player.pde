class Player {
  float xPos;
  float yPos;
  float objWidth;
  float objHeight;
  float jumpImpulse;
  float gravity;
  float yVelocity;
  PImage jordan;

  Player() {
    jordan = loadImage("image.bred1.png");
    yVelocity = 0;
    jumpImpulse = -9;
    gravity = 0.5;
    objWidth = jordan.width;
    objHeight = jordan.height;
    xPos = 50;
    yPos = (height/2) - objHeight;
  }

  // Shows player.
  void show() {
    // WRITE METHOD
    image(jordan,xPos,yPos,objWidth,objHeight);
  }

  // Moves player down.
  void move() {
    // WRITE METHOD
    yVelocity = yVelocity + gravity;
    yPos = yPos + yVelocity;
  }

  // Moves player up.
  void jump() {
    // WRITE METHOD
    yVelocity = jumpImpulse;
  }
}