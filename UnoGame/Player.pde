import java.util.ArrayList;

class Player{
  private String name;
  private ArrayList<Card> deck;

  public Player(String name) {
    this.name = name;
    this.deck = new ArrayList<>();
  }
  
  public String getName() {
    return name;
  }
  
  public ArrayList<Card> getDeck() {
    return deck;
  }
  
  public drawCard(Card card) {
    deck.add(card);
  }
  
  public playCard(int index) {
    return deck.remove(index);
  }
}
