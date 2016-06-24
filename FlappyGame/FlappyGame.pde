import processing.sound.*;

int score;
int gameState; // 0 = start, 1 = running, 2 = ove
Player me;
Pipe pipeOne;
PImage background;
SoundFile bgMusic;
SoundFile scoreSound;

void setup() {
  size(500, 500);
  textAlign(CENTER);
  score = 0;
  gameState = 0;
  me = new Player();
  pipeOne = new Pipe(1);
  background = loadImage("background.jpg");
  bgMusic = new SoundFile(this,"NCAA March Madness Theme Song.mp3");
  bgMusic.loop();
  scoreSound = new SoundFile(this,"Maro Jump Sound Effect.mp3");
}

void draw() {
  image(background,0,0,width,height);
  if (gameState == 0) {
    textSize(40);
    text("Flappy Js", width/2, 100);
    me.show();// game start
  } else if (gameState == 1) {
    // game running
   
    // PHYSICS
    me.move();
    pipeOne.move();

    // GAME LOGIC
    // check if player is off screen
    if (me.yPos < 0 || me.yPos + me.objHeight > height) {
      gameState = 2;
    }
    // check if player hits the pipe
    if (me.xPos < pipeOne.xPos + pipeOne.objWidth
      && me.xPos + me.objWidth > pipeOne.xPos
      && me.yPos < pipeOne.yPos + pipeOne.objHeight
      && me.yPos + me.objHeight > pipeOne.yPos) {
      gameState = 2;
    }
    // increase score when pipe is passed
    if (pipeOne.counted == false && me.xPos > pipeOne.xPos + pipeOne.objWidth) {
    score = score + 1;
    pipeOne.counted = true;
    scoreSound.play();
    }

    // GRAPHICS
    me.show();
    pipeOne.show();
    fill(255,0,0);
    textSize (30);
    text(score,width/2,60);
} else { // gameState == 2
    // game over
    me.show();
    pipeOne.show();
    fill(255,0,0);
    textSize(50);
    text("GAME OVER", width/2, height/2);
    fill(255);
    textSize (30);
    text(score,width/2,60);
  }
}
void keyPressed() {
  if (key == ' ' && gameState == 0) 
  {
    gameState = 1;
  }
  if (key == ' ' && gameState == 1)
  {
    me.jump();
  }
  if (key == ' ' && gameState == 2){
  score = 0;
  gameState = 1;
  me = new Player ();
  pipeOne = new Pipe(1);
  me.jump();
  }
}