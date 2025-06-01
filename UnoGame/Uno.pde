class Uno {
  Deck deck;
  ArrayList<Player> players;
  int currentplayer;
  int direction;
  
  Uno (String username, int numBots){
    deck = new Deck();
    players = new ArrayList<Player>();
    currentplayer = 0;
    direction = 1;
    Card topCard;
  
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
  
  public int checkWin() {
    for (int i = 0; i < players.size(); i++) {
      Player user = players.get(i);
      if (user.getDeck().size() == 0) {
        return i;
      }
    }
    
    return -1;
  }
}
