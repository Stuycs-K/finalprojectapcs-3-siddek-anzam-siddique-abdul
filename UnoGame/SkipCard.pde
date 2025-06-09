class SkipCard extends Card{
  public SkipCard(String clr) {
    super(clr);
  }
  
  public void effect(Uno game) {
    game.skipNext = true;
  }
}
