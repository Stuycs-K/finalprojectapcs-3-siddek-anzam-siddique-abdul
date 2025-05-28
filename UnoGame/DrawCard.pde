class DrawCard extends Card{
  DrawCard(String colors){
    super(colors, "+2");
  }
  
  void effect(UnoGame game){
    int next = (game.currentplayer +1) % game.players.size();
  }
    
}
