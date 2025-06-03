Uno game;

void setup() {
  size(800, 600);
  game = new Uno("You", 3); 
}

void draw() {
  background(255);
  showTopCard();
  showPlayerHand();
  showTurnInfo();
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

void drawCard(Card card, int x, int y) {
  int w = 60;
  int h = 90;
  fill(getCardColor(card.getColor()));
  rect(x, y, w, h);
  fill(0);
  textSize(12);
  textAlign(CENTER, CENTER);

  String label;

  if (card.getValue() == -1) {
    label = card.getClass().getSimpleName();
  } 
  else {
    if (card.getColor() == "wild") {
      label = "Draw " + card.getValue();
    } else {
    label = card.getColor() + " " + card.getValue();
    }
  }

  text(label, x + w / 2, y + h / 2);
}
void showTurnInfo() {
  Player player = game.getCurrentPlayer();
  fill(0);
  textSize(16);
  text("Current Turn: " + player.getName(), 550, 30);
} 
color getCardColor(String clr) {
  if (clr.equals("RED")) {
    return color(255, 0, 0);
  } else if (clr.equals("BLUE")) {
    return color(0, 145, 255);
  } else if (clr.equals("GREEN")) {
    return color(0, 200, 0);
  } else if (clr.equals("YELLOW")) {
    return color(255, 255, 0);
  } else {
    return color(150); // wild or unknown
  }
}
