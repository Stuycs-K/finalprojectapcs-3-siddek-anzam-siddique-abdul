class DrawCard extends Card{
  public DrawCard(String clr, int value){
    super(clr, value);
  }
  
  void effect(UnoGame game){
    int next = (game.currentplayer +1) % game.players.size();
  }
    
}
