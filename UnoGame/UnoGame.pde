Uno game;

void setup() {
  size(800, 600);
  game = new Uno("You", 3); 
}

void draw() {
  background(255);
  

}

void mousePressed() {
  if (!game.isWaitingForHumanInput()) {
    return;
  }

  Player player = game.getCurrentPlayer();
  
