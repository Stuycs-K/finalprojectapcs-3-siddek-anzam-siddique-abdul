class SkipCard extends Card{
  public SkipCard(String clr) {
    super(clr);
  }
  
  public void effect(Uno game) {
    int next = (game.currentplayer + game.direction) % game.players.size();
    game.currentplayer = next;
  }
}
