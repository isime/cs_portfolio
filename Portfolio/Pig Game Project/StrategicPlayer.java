/**
 * Ian Sime
 * StrategicPlayer
 * November 2015
 */
public class StrategicPlayer extends PigPlayer {
  private int hold;
  private int close;
  
  public StrategicPlayer(){
    super("strategic");
    hold = 20;
    close = PigGame.GOAL - 25;
  }
  
  public StrategicPlayer(String name){
    super(name);
    hold = 20;
    close = PigGame.GOAL - 25;
  }
  
  public StrategicPlayer(String name, int hold, int close){
    super(name);
    this.hold = hold;
    this.close = close;
  }
  
  public boolean isRolling(int turnTotal, int opponentScore){
    if(this.getScore() >= close){
      hold = PigGame.GOAL - close;
    }
    
    if(turnTotal < hold && (this.getScore() + turnTotal) < PigGame.GOAL){
      return true;
    }
    else{
      return false;
    }
  }
  
}
