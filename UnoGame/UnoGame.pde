Uno game;
static ArrayList<String> messageLog = new ArrayList<String>();
static int maxmessages = 5;

boolean noDelay = false;
int delays = 2000; 

void setup() {
  size(1000, 800);
  game = new Uno("You", 3); 
}

void draw() {
  if (game.checkWin() != -1) {
    background(255);
    fill(0);
    textSize(32);
    textAlign(CENTER, CENTER);
    text(game.getCurrentPlayer().getName() + " won!", width / 2, height / 2);
    noLoop();
    return;
  }

  background(255);
  showTopCard();
  showPlayerHand();
  showTurnInfo();
  drawnodelay();

  fill(200);
  rect(500, 100, 100, 40, 5);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(14);
  text("Restart", 550, 120);

  if (!game.isWaitingForHumanInput()) {
    delay(delays);
    game.playTurn();
  }

  drawMessageLog();
}



void drawMessageLog() {
  fill(0);
  textSize(14);
  textAlign(LEFT, TOP);
  int x = 50;
  int y = 200;

  for (int i = 0; i < messageLog.size(); i++) {
    text(messageLog.get(i), x, y + i * 20);
  }
}



void mousePressed() {
  if (mouseX > 500 && mouseX < 600 && mouseY > 40 && mouseY < 80) {
    noDelay = !noDelay;
    delays = noDelay ? 10 : 1000;
  }

  if (mouseX > 500 && mouseX < 600 && mouseY > 100 && mouseY < 140) {
    messageLog.clear();
    game = new Uno("You", 3);
    game.setWaitingForHumanInput(false);
    loop();   
  }

  if (!game.isWaitingForHumanInput()) return;

  Player player = game.getCurrentPlayer();
  ArrayList<Card> hand = player.getDeck();

  for (int i = 0; i < hand.size(); i++) {
    int x = 100 + i * 70;
    int y = height - 120;
    int w = 60;
    int h = 90;

    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      if (i >= 0 && i < hand.size()) {
        game.playHumanCard(i);
      }
    }
  }
}


void drawnodelay(){



if (noDelay){
fill(100,255,100);
}else{
fill(200);
}rect(500,40,100,40,5);
fill(0);
textAlign(CENTER,CENTER);
textSize(14);
text("No Delay", 550,60);
}

static void logmessage(String msg){
  messageLog.add(msg);
  if (messageLog.size() > maxmessages){
    messageLog.remove(0);
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
  if (clr.contains("RED")) {
    return color(255, 0, 0);
  } else if (clr.contains("BLUE")) {
    return color(0, 145, 255);
  } else if (clr.contains("GREEN")) {
    return color(0, 200, 0);
  } else if (clr.contains("YELLOW")) {
    return color(255, 255, 0);
  } else {
    return color(150); // wild or unknown
  }
}

void loadSkipCard() {
  messageLog.clear();
  game = new Uno("You", 3);
  UnoGame.logmessage("Loaded skip card scenario.");
  
  game.topCard = new Card("RED", 5);
  
  Player you = game.players.get(0);
  you.drawCard(new SkipCard("RED Skip"));
  
  game.setWaitingForHumanInput(true);
}

void loadReverseCard() {
  messageLog.clear();
  game = new Uno("You", 3);
  UnoGame.logmessage("Loaded reverse card scenario.");
  
  game.topCard = new Card("RED", 5);
  
  Player you = game.players.get(0);
  you.drawCard(new ReverseCard("RED Reverse"));
  
  game.setWaitingForHumanInput(true);
}

void loadPlus2Card() {
  messageLog.clear();
  game = new Uno("You", 3);
  UnoGame.logmessage("Loaded Draw 2 Card scenario.");
  
  game.topCard = new Card("RED", 5);
  
  Player you = game.players.get(0);
  you.drawCard(new DrawCard("RED +", 2));
  
  game.setWaitingForHumanInput(true);
}

void loadPlus4Card() {
  messageLog.clear();
  game = new Uno("You", 3);
  UnoGame.logmessage("Loaded Draw 4 Card scenario.");
  
  game.topCard = new Card("RED", 5);
  
  Player you = game.players.get(0);
  you.drawCard(new DrawCard("RED +", 4));
  
  game.setWaitingForHumanInput(true);
}

void loadWin() {
  messageLog.clear();
  game = new Uno("You", 3);
  UnoGame.logmessage("Loaded win scenario.");
  
  game.topCard = new Card("RED", 5);
  
  Player you = game.players.get(0);
  you.getDeck().clear();
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    loadSkipCard();
  }
  
  if (key == 'r' || key == 'R') {
    loadReverseCard();
  }
  
  if (key == 'w' || key == 'W') {
    loadWin();
  }
  
  if (key == '2') {
    loadPlus2Card();
  }
  
  if (key == '4') {
    loadPlus4Card();
  }
}
