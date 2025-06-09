class DrawCard extends Card {
  private int drawAmount;

  public DrawCard(String clr, int value){
    super(clr, value);
    drawAmount = value;
  }

  public void effect(Uno game) {
    int next = (game.currentplayer + game.direction + game.players.size()) % game.players.size();
    Player user = game.players.get(next);

    for (int i = 0; i < drawAmount; i++) {
      user.drawCard(game.deck.drawCard());
    }

    UnoGame.logmessage(user.getName() + " drew " + drawAmount + " cards.");
  }
}
