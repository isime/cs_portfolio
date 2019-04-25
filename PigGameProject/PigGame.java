/**
 * Ian Sime
 * Pig Game
 * October 2015
 */
import java.util.Scanner;
public class PigGame {
  public static final int GOAL = 100;
  private static boolean verbose;
  private PigPlayer player1;
  private PigPlayer player2;
  
  public PigGame(){
    player1 = new UserPigPlayer("player1");
    player2 = new UserPigPlayer("player2");
  }
  
  public PigGame(String name1, String name2){
    player1 = new UserPigPlayer(name1);
    player2 = new UserPigPlayer(name2);
  }
  
  public PigGame(PigPlayer PigPlayer1, PigPlayer PigPlayer2){
    player1 = PigPlayer1;
    player2 = PigPlayer2;
  }
  
  public void reset(){
    player1.reset();
    player2.reset();
  }
  
  public void setVerbose(boolean verboseValue){
    verbose = verboseValue;
  }
  
  public static int playTurn(PigPlayer player, PigPlayer opponent){
    Die die = new Die();
    int rollValue;
    int turnTotal = 0;
    
    do{
      rollValue = die.rollDie();
      if(verbose){
        System.out.println("You rolled a " + rollValue);
      }
      if(rollValue == 1){
        if(verbose){
          System.out.println("Your turn total is 0");
        }
        return 0;
      }
      else{
        turnTotal = turnTotal + rollValue;
      }
    }while (player.isRolling(turnTotal, opponent.getScore()));
    if(verbose){
      System.out.println("Your turn total is " + turnTotal);
    }
    return turnTotal;
  }
  
  public void playGame(){
    int score1 = 0;
    int score2 = 0;
    do{
      if(verbose){
        System.out.println(player1.getName() + "'s score; " + player1.getScore());
        System.out.println(player2.getName() + "'s score; " + player2.getScore());
        System.out.println("It is " + player1.getName() + "'s turn");
      }
      
      score1 = playTurn(player1, player2);
      player1.addPoints(score1);
      
      if(player1.won() == false){
        if(verbose){
          System.out.println(player1.getName() + "'s score; " + player1.getScore());
          System.out.println(player2.getName() + "'s score; " + player2.getScore());
          System.out.println("It is " + player2.getName() + "'s turn");
        }
      }
      score2 = playTurn(player2, player1);
      player2.addPoints(score2);
      
    }while(player1.won() == false && player2.won() == false);
    
    if(player1.won() == true){
      if(verbose){
        System.out.println(player1.getName() + " wins");
        System.out.println(player1.getName() + "'s score: " + player1.getScore());
        System.out.println(player2.getName() + "'s score: " + player2.getScore());
      }
    }
    
    else{
      if(verbose){
        System.out.println(player2.getName() + " wins");
        System.out.println(player2.getName() + "'s score: " + player2.getScore());
        System.out.println(player1.getName() + "'s score: " + player1.getScore());
      }
    }
  }
  
  public static void userVsUser(){
    Scanner keyboard = new Scanner(System.in);
    
    System.out.println("Lets play Pig!");
    System.out.println("Two players race to 100 points.");
    System.out.println("Each turn, a player repeatedly rolls a die until either a 1 is rolled or the player holds and scores the sum of the rolls.");
    System.out.println("When givin the choice to roll, press enter to roll and anything else to hold.");
    
    System.out.println("What is the first player's name?");
    String name1 = keyboard.nextLine();
    
    System.out.println("What is the second player's name?");
    String name2 = keyboard.nextLine();
    
    double number = Math.random();
    
    if((number>=0) && (number<.5)){
      System.out.println(name1 + " will go first");
      PigGame game = new PigGame(name1, name2);
      game.playGame();
    }
    else{
      System.out.println(name2 +" will go first");
      PigGame game = new PigGame(name2, name1);
      game.playGame();
    }
  }
  
  public static void userVsComputer(){
    Scanner keyboard = new Scanner(System.in);  
    
    System.out.println("Lets play Pig!");
    System.out.println("Two players race to 100 points.");
    System.out.println("Each turn, a player repeatedly rolls a die until either a 1 is rolled or the player holds and scores the sum of the rolls.");
    System.out.println("When givin the choice to roll, press enter to roll and anything else to hold.");
    
    System.out.println("What is the player's name?");
    String name1 = keyboard.nextLine();
    
    String name2 = "Computer";
    
    PigPlayer player = new UserPigPlayer(name1);
    PigPlayer computer = new FourTurnsPlayer(name2);
    
    double number = Math.random();
    
    if((number>=0) && (number<.5)){
      System.out.println(name1 + " will go first");
      PigGame game = new PigGame(player, computer);
      game.playGame();
    }
    else{
      System.out.println("The " + name2 +" will go first");
      PigGame game = new PigGame(computer, player);
      game.playGame();
    }
  }
  
  public static void computerVsComputer(){
    if(verbose){
      System.out.println("Lets play Pig!");
      System.out.println("Two players race to 100 points.");
      System.out.println("Each turn, a player repeatedly rolls a die until either a 1 is rolled or the player holds and scores the sum of the rolls.");
      System.out.println("When givin the choice to roll, press enter to roll and anything else to hold.");
    }
    
    String name1 = "player1";
    String name2 = "player2";
    
    PigPlayer player = new SimpleHoldPlayer(name1);
    PigPlayer computer = new SimpleHoldPlayer(name2);
    
    double number = Math.random();
    
    if((number>=0) && (number<.5)){
      if(verbose){
        System.out.println(name1 + " will go first");
      }
      PigGame game = new PigGame(player, computer);
      game.playGame();
    }
    else{
      if(verbose){
        System.out.println(name2 +" will go first");
      }
      PigGame game = new PigGame(computer, player);
      game.playGame();
    }
  }
  
  public static void main(String [ ] args){
    //userVsUser();
    //userVsComputer();
    computerVsComputer();
  }
}
