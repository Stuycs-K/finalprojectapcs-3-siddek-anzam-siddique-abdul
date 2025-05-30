class Card{
  private String clr; 
  private String value;
    
  public Card(String clr, String value){
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
  
  public String getValue() {
    return value;
  }
   
  boolean playable(Card topCard){
    String otherColor = topCard.getColor();
    int otherValue = topCard.getValue();
    
    return clr.equals(otherColor) || value == otherValue;
  }
  
  public void effect() {
    
  }
}
