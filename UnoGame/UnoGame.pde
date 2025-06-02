Uno game;

void setup() {
  size(800, 600);
  game = new Uno("You", 3); 
}

void draw() {
  background(255);
  if (!game.isWaitingForHumanInput()) {
    delay(1000);
    game.playTurn();
  }
}
  



void mousePressed() {
  if (!game.isWaitingForHumanInput()) {
    return;
  }

  Player player = game.getCurrentPlayer();
  ArrayList<Card> hand = player.getDeck();
  boolean clickedCard = false;

  for (int i = 0; i < hand.size(); i++) {
    int x = 100 + i * 70;
    int y = height - 120;
    int w = 60;
    int h = 90;

    if (!clickedCard && mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      game.playHumanCard(i);
      clickedCard = true;
    }
  }
}
  
