class Uno {
  Deck deck;
  ArrayList<Player> players;
  int currentplayer;
  int direction;
  Card topCard;
  boolean waitingForInput = false;
  
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
      
      println("No playable card. Drawing one.");
      player.drawCard(deck.drawCard());
      advanceTurn();
      return;
    }
    
    boolean played = false;
    
    for (int i = 0; i < hand.size(); i++) {
      Card card = hand.get(i);
      
      if (card.playable(topCard)) {
        topCard = player.playCard(i);
        println(player.getName() + "played" + topCard.getColor() + topCard.getValue());
        topCard.effect();
        played = true;
        break;
      }
    }
    
    if (!played) {
      player.drawCard(deck.drawCard());
      println(player.getName() + "drew");
    }
    
    advanceTurn();
  }  
  
  public void setWaitingForHumanInput(boolean value) {
  waitingForInput = value;
}
  
  public void playHumanCard(int index) {
    Player player = players.get(currentplayer);
    ArrayList<Card> hand = player.getDeck();
    Card selected = hand.get(index);

    if (selected.playable(topCard)) {
      topCard = player.playCard(index);
      println("played" + topCard.getColor() + topCard.getValue());
      topCard.effect();
      advanceTurn();
    } else {
      println("Card not playable. Try another.");
    }

    waitingForInput = false;
  }
  
  private void advanceTurn() {
    if (checkWin() != -1) {
      println(players.get(currentplayer).getName() + "won");
      noLoop();
      return;
    }
    currentplayer = (currentplayer + direction + players.size()) % players.size();
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
