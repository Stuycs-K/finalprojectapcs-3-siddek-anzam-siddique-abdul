class Uno {
  Deck deck;
  ArrayList<Player> players;
  int currentplayer;
  int direction;
  Card topCard;
  boolean waitingForInput = false;
  public boolean skipNext = false;
  
  Uno (String username, int numBots){
    deck = new Deck();
    players = new ArrayList<Player>();
    currentplayer = 0;
    direction = 1;
  
    players.add(new Player(username));
    
    for (int i = 1; i <= numBots; i++) {
      players.add(new Player("Bot " + i));
    }
    
    for (Player p : players) {
      for (int i = 0; i < 7; i++) {
        p.drawCard(deck.drawCard());
      }
    }
    
    while (true) {
      topCard = deck.drawCard();
      if (!(topCard instanceof SkipCard || topCard instanceof ReverseCard || topCard instanceof DrawCard || topCard instanceof WildCard)) {
        break;
      }
      else {
        deck.shuffle();
      }
    }
  }
  
public void playTurn() {
  Player player = players.get(currentplayer);
  ArrayList<Card> hand = player.getDeck();

  if (currentplayer == 0) {
    for (Card card : hand) {
      if (card.playable(topCard)) {
        waitingForInput = true;
        return;
      }
    }

    UnoGame.logmessage("No playable card. Drawing one.");
    player.drawCard(deck.drawCard());

    if (hand.size() == 1) {
      UnoGame.logmessage(player.getName() + " won");
      noLoop();
      return;
    }

    advanceTurn();
    return;
  }

  boolean played = false;

  for (int i = 0; i < hand.size(); i++) {
    Card card = hand.get(i);
    if (card.playable(topCard)) {
      topCard = player.playCard(i);
      UnoGame.logmessage(player.getName() + " played " + topCard.getColor() + " " + topCard.getValue());
      topCard.effect(this);

      if (player.getDeck().size() == 1) {
        UnoGame.logmessage(player.getName() + " won");
        noLoop();
        return;
      }

      played = true;
      break;
    }
  }

  if (!played) {
    player.drawCard(deck.drawCard());
    UnoGame.logmessage(player.getName() + " drew");

    if (player.getDeck().size() == 1) {
      UnoGame.logmessage(player.getName() + " won");
      noLoop();
      return;
    }
  }

  advanceTurn();
}



  
  public void setWaitingForHumanInput(boolean value) {
    waitingForInput = value;
  }
  
public void playHumanCard(int index) {
  Player player = players.get(currentplayer);
  ArrayList<Card> hand = player.getDeck();

  if (hand.isEmpty() || index < 0 || index >= hand.size()) {
    UnoGame.logmessage("Invalid card selection.");
    return;
  }

  Card selected = hand.get(index);

  if (selected.playable(topCard)) {
    topCard = player.playCard(index);
    UnoGame.logmessage(player.getName() + " played " + topCard.getColor() + " " + topCard.getValue());
    topCard.effect(this);
    waitingForInput = false;

    
    advanceTurn();
  } else {
    UnoGame.logmessage("Card not playable. Try another.");
    waitingForInput = true;
  }
}






  
  private void advanceTurn() {
    if (checkWin() != -1) {
      UnoGame.logmessage(players.get(currentplayer).getName() + " won");
      noLoop();
      return;
    }
    
    if (skipNext) {
      UnoGame.logmessage("Skipped " + players.get((currentplayer + direction + players.size()) % players.size()).getName());
      currentplayer = (currentplayer + 2 * direction + players.size()) % players.size();
      skipNext = false;
    } else {
      currentplayer = (currentplayer + direction + players.size()) % players.size();
    }
  }
  
  public int checkWin() {
    for (int i = 0; i < players.size(); i++) {
      Player user = players.get(i);
      if (user.getDeck().size() == 0) {
        return i;
      }
    }
    
    return -1;
  }
  
  public boolean isWaitingForHumanInput() {
    return waitingForInput;
  }

  public Player getCurrentPlayer() {
    return players.get(currentplayer);
  }

  public Card getTopCard() {
    return topCard;
  }
}
