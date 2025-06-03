class Card{
  private String clr; 
  private int value;
    
  public Card(String clr, int value){
    this.clr = clr;
    this.value = value;
  }
  
  public Card(String clr) {
    this.clr = clr;
    value = -1;
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
    
    if (clr.equals("wild")) {
      return true;
    }
    
    if (topCard instanceof DrawCard || this instanceof DrawCard) {
      return clr.equals(otherColor);
    }
    
    return clr.equals(otherColor) || value == otherValue;
  }
  
  public void effect() {
    
  }
}
