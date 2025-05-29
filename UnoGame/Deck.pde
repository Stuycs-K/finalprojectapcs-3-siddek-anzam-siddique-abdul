import java.util.ArrayList;
import java.util.Collections;

class Deck{
  private ArrayList<Card> cards;
  
  public Deck() {
    cards = new ArrayList<>();
    initializeDeck();
    shuffle();
  }
  
  private void initializeDeck() {
    String[] colors = {"RED", "BLUE", "GREEN", "YELLOW"};

    for (String clr : colors) {
       cards.add(new Card(clr, 0));
       
       for (int i = 1; i <= 9; i++) {
         cards.add(new Card(clr, i));
         cards.add(new Card(clr, i));
       }
       
       for (int i = 0; i < 2; i++) {
         cards.add(new SkipCard(clr));
         cards.add(new ReverseCard(clr));
         cards.add(new DrawCard(clr, 2));
       }
       
       for (int i = 0; i < 4; i++) {
         cards.add(new WildCard());
         cards.add(new DrawCard("wild", 4));
       }
    }
  }
  
  public void shuffle() {
    Collections.shuffle(cards);
  }
  
  public Card drawCard() {
    return cards.remove(0);
  }
  
  
}
