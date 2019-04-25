/**
 * Ian Sime
 * FourTurnsPlayer
 * November 2015
 */
public class FourTurnsPlayer extends PigPlayer {
  private double hold;
  private int turnsRemaining;
  
  public FourTurnsPlayer(){
    super("fourTurns");
    hold = PigGame.GOAL/4;
    turnsRemaining = 4;
  }
  
  public FourTurnsPlayer(String name){
    super(name);
    hold = PigGame.GOAL/4;
    turnsRemaining = 4;
  }
  
  public boolean isRolling(int turnTotal, int opponentScore){
    if(turnTotal < hold && (this.getScore() + turnTotal) < PigGame.GOAL){
      return true;
    }
    else{
      if(turnsRemaining > 1){
        turnsRemaining--;
        hold = (PigGame.GOAL-(this.getScore() + turnTotal))/turnsRemaining;
      }
      return false;
    }
  }
  public void reset(){
    turnsRemaining = 4;
    hold = PigGame.GOAL/4;
    super.reset();
  }
}
