class UnoGame;
Deck deck;
ArrayList<Player> players;
int currentplayer;

UnoGame(){
  deck = new Deck(); 
}


void setup() {
  size(400, 400); 
  background(255); 
}

void draw() {
  background(255, 0, 0);
  ellipse(100, 100, 50, 50);
}
