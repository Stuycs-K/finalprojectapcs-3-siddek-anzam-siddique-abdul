class DrawCard extends Card {
  private int drawAmount;

  public DrawCard(String clr, int value){
    super(clr, value);
  }

  public void effect(Uno game) {
    int next = game.currentplayer + game.direction;
    if (next < 0) {
      next += game.players.size();
    }
    next = next % game.players.size();

    Player user = game.players.get(next);

    for (int i = 0; i < drawAmount; i++) {
      user.drawCard(game.deck.drawCard());
    }

    game.currentplayer = next; 
  }
}
