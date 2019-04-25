/**
 *Ian Sime
 * Simple Hold Player Class
 * November 2015
 */
public class SimpleHoldPlayer extends PigPlayer {
  private int hold;
  
  public SimpleHoldPlayer(){
    super(); 
    hold = 20;
  }
  
  public SimpleHoldPlayer(String name){
    super(name);
    hold = 20;
    
  }   
  
  public SimpleHoldPlayer(String name, int hold){
    super(name);
    this.hold = hold;
  }
  
  public boolean isRolling(int turnTotal, int opponentScore){
    
    if(turnTotal < hold && (this.getScore() + turnTotal) < PigGame.GOAL){
      return true;
    }
    else{
      return false;
    }
  }
  
  public static void main(String [ ] args){
    SimpleHoldPlayer p1 = new SimpleHoldPlayer("p1");
    System.out.println(p1.isRolling(19,50));
  }
}
