class Card{
String colors; 
String value;

 
Card(String colors, String value){
  this.colors = colors;
  this.value = value;
}
 
boolean playable(Card topCard){
  return this.colors.equals(topCard.colors) || this.value.equals(topCard.value);
}
}
