class Uno {
  Deck deck;
  ArrayList<Player> players;
  int currentplayer;
  int direction;
  
  Uno (){
    deck = new Deck();
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
