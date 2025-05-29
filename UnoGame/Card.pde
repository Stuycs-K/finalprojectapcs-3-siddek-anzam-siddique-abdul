class Card{
  private String clr; 
  private int value;
    
  public Card(String clr, int value){
    this.clr = clr;
    this.value = value;
  }
  
  public String getColor() {
    return clr;
  }
  
  public int getValue() {
    return value;
  }
   
  boolean playable(Card topCard){
    String otherColor = topCard.getColor();
    int otherValue = topCard.getValue();
    
    return clr.equals(otherColor) || value == otherValue;
  }
}
