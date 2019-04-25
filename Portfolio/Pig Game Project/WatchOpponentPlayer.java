/**
 * Ian Sime
 * WatchOpponentPlayer
 * November 2015
 */
public class WatchOpponentPlayer extends PigPlayer {
  private int hold;
  private int reasonable;
  private int number;
  private int close;
  
  public WatchOpponentPlayer(){
    super("watchOpponent");
    reasonable = 20;
    number = 5;
    close = PigGame.GOAL - 28;
  }
  
  public WatchOpponentPlayer(String name){
    super(name);
    reasonable = 20;
    number = 5;
    close = PigGame.GOAL - 28;
  }
  
  public WatchOpponentPlayer(String name, int reasonable, int number, int close){
    super(name);
    this.reasonable = reasonable;
    this.number = number;
    this.close = close;
  }
  
  public boolean isRolling(int turnTotal, int opponentScore){
    if(this.getScore() < close && opponentScore < close){
      hold = reasonable + (opponentScore - this.getScore())/number;
    }
    else{
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
