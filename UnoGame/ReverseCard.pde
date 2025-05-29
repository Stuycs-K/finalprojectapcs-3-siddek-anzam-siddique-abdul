class ReverseCard extends Card{
  public ReverseCard(String clr) {
    super(clr);
  }
  
  public void effect(Uno game) {
    int direction = game.direction;
    
    game.direction = direction * -1;
  }
}
