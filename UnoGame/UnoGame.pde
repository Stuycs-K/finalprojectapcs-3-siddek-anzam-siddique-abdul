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

void showTopCard() {
  fill(0);
  textSize(18);
  text("Top Card:", 50, 50);
  drawCard(game.getTopCard(), 150, 30);
}
void showPlayerHand() {
  Player player = game.getCurrentPlayer();
  ArrayList<Card> hand = player.getDeck();

  textSize(16);
  fill(0);
  text("Your Hand:", 50, height - 160);

  for (int i = 0; i < hand.size(); i++) {
    drawCard(hand.get(i), 100 + i * 70, height - 120);
  }
}

  
