class DrawCard extends Card{
  public DrawCard(String clr, int value){
    super(clr, value);
  }
  
  public void effect(Uno game){
    int next = (game.currentplayer + game.direction) % game.players.size();
    Player user = game.players.get(next);
    
    for (int x = 0; x < super.value; x++) {
      user.drawCard(game.deck.drawCard());
    }
  }
    
}
