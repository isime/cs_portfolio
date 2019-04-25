/**
 * Ian Sime
 * Pig Player
 * October 2015
 */
public abstract class PigPlayer{
  private String name;
  private int score;
  private int wins;
  
  public PigPlayer(String name){
    this.name = name;
  }
  
  public PigPlayer(){
    name = "Greg";
  }
  
  public void setName(String name){
    this.name = name;
  }
  
  public String getName(){
    return name;
  }
  
  public void reset(){
    score = 0;
  }
  
  public void addPoints(int turnTotal){
    score = score + turnTotal;
    if (score >= PigGame.GOAL){
      wins++;
    }
  }
  
  public boolean won(){
    if (score >= PigGame.GOAL) {
      return true;
    }
    else{
      return false;
    }
  }
  
  public int getScore(){
    return score;
  }
  
  public int getWinRecord(){
    return wins;
  }
  
  public String toString(){
    return "Name: " + name + " Score: " + score;
  }
  
  public abstract boolean isRolling(int turnTotal, int opponentScore);
  
  /**
   public static void main(String [] args){
   PigPlayer one = new UserPigPlayer("Ian");
   
   one.addPoints(50);
   System.out.println(one.getScore());
   System.out.println(one.won());
   
   one.addPoints(50);
   System.out.println(one.getScore());
   System.out.println(one.won());
   System.out.println(one.getWinRecord());
   
   one.reset();
   
   System.out.println(one.getScore());
   System.out.println(one.won());
   System.out.println(one.getWinRecord());
   
   one.addPoints(101);
   System.out.println(one.getScore());
   System.out.println(one.won());
   System.out.println(one.getWinRecord());
   
   }
   **/
  
}
