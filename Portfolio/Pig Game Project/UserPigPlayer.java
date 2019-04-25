/**
 * Ian Sime
 * November 2015
 * User Pig Player Class
 */

import java.util.Scanner;

public class UserPigPlayer extends PigPlayer {
  protected String name;
  Scanner keyboard = new Scanner(System.in);
  
  public UserPigPlayer(String name){
    super(name); 
  }
  
  public UserPigPlayer(){
    name = "User";
  }
  
  public boolean isRolling(int turnTotal, int opponentScore){
    System.out.println("Your turn total is: " + turnTotal);
    System.out.println("Press enter to roll again, anything else to hold.");
    String ch = keyboard.nextLine();
    
    if (ch.length() == 0) {
      return true;
    }
    else {
      return false;
    }
  }
  
  public static void main(String [ ] args){
    boolean isRollingValue;
    UserPigPlayer player1 = new UserPigPlayer("player1");
    isRollingValue = player1.isRolling(10,30);
    System.out.println(isRollingValue);
  }
}
