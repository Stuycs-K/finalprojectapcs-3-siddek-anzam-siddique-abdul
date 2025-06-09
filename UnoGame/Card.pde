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
    String otherColor = clr.split(" ")[0];
    String topBaseColor = topCard.getColor().split(" ")[0];
    int otherValue = topCard.getValue();
    
    if (otherColor.equals("wild")) {
      return true;
    }
    
    if (topCard instanceof DrawCard || this instanceof DrawCard) {
      return otherColor.equals(topBaseColor);
    }
    
    return otherColor.equals(topBaseColor) || value == otherValue;
  }
  
  public void effect(Uno game) {
    
  }
}
