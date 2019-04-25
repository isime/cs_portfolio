/**
 * Ian Sime
 * Simulations 
 * November 2015
 */
public class Simulations {
  
  public static void firstAdvantage(long simulations){
    PigPlayer player1 = new SimpleHoldPlayer("player1");
    PigPlayer player2 = new SimpleHoldPlayer("player2");
    PigGame sim = new PigGame(player1, player2);
    sim.setVerbose(false);
    
    for(int i = 0; i < simulations; i++){
      
      sim.playGame();
      // System.out.println("Game: " + (i+1) + " p2 won: " + player2.won());
      sim.reset();
      //System.out.println("p2 win record: " + player2.getWinRecord());
      //System.out.println("p1 win record: " + player1.getWinRecord());
    }
    System.out.println("player1 wins: " + player1.getWinRecord());
    System.out.println("player2 wins: " + player2.getWinRecord());
  }
  public static double comparePlayers(long simulations, PigPlayer first, PigPlayer second){
    double firstWins = 0;
    
    for(int i = 0; i < simulations/2; i++){
      PigGame sim1 = new PigGame(first, second);
      sim1.setVerbose(false);
      sim1.playGame();
      if(first.won() == true){
        firstWins++;
      }
      sim1.reset();
    }
    
    for(int c = 0 ; c < simulations/2; c++){
      PigGame sim2 = new PigGame(second, first);
      sim2.setVerbose(false);
      sim2.playGame();
      if(first.won() == true){
        firstWins++;
      }
      sim2.reset();
    }
    
    return firstWins/simulations;
  }
  
  public static void compareSimpleHoldPlayers(){
    for(int i = 15; i <= 30; i++){
      PigPlayer player1 = new SimpleHoldPlayer("player1", i);
      PigPlayer player2 = new SimpleHoldPlayer("player2", 20);
      double wonByPlayer1 = comparePlayers(100, player1, player2);
      System.out.println("Player1 hold value: " + i);
      System.out.println("Player1 won " + wonByPlayer1*100 + "% of games");
    }
  }
  
  public static void findGoodWatchValues(){
    double wonByFirst=0;
    double best = 0;
    
    for(int i = 5; i <= 35; i++){  
      for(int j = 15; j <= 28; j++){
        for(int g = 2; g <= 8; g++){
          PigPlayer watch = new WatchOpponentPlayer("watch", j, g, 75);
          PigPlayer simple = new SimpleHoldPlayer("simple");
          
          wonByFirst=comparePlayers(10000, watch, simple);
          
          if(wonByFirst > best){
            best = wonByFirst;
            System.out.println("reasonable: " + j + " number: " + g + " close: " + i + " wonByFirst: " + wonByFirst); 
          }
        }
      }
    }
    System.out.println("end of sim");
  }
  
  public static void StrategicPlayervsSimpleHold(){
    PigPlayer player1 = new StrategicPlayer();
    PigPlayer player2 = new SimpleHoldPlayer();
    double wonByPlayer1 = comparePlayers(100000, player1, player2);
    System.out.println("Strategic Player won " + wonByPlayer1*100 + "% of games");
  }
  
  public static void StrategicPlayervsWatchOpponent(){
    PigPlayer player1 = new StrategicPlayer();
    PigPlayer player2 = new WatchOpponentPlayer();
    double wonByPlayer1 = comparePlayers(100000, player1, player2);
    System.out.println("Strategic Player won " + wonByPlayer1*100 + "% of games");
  }
  
  public static void FourTurnsVsSimpleHold(){
    PigPlayer player1 = new FourTurnsPlayer();
    PigPlayer player2 = new SimpleHoldPlayer();
    double wonByPlayer1 = comparePlayers(100000, player1, player2);
    System.out.println("Four Turns Player won " + wonByPlayer1*100 + "% of games");
  }
  
  public static void FourTurnsVsWatchOpponent(){
    PigPlayer player1 = new FourTurnsPlayer();
    PigPlayer player2 = new WatchOpponentPlayer();
    double wonByPlayer1 = comparePlayers(100000, player1, player2);
    System.out.println("Four Turns Player won " + wonByPlayer1*100 + "% of games");
  }
  
  public static void FourTurnsVsStrategicPlayer(){
    PigPlayer player1 = new FourTurnsPlayer();
    PigPlayer player2 = new StrategicPlayer();
    double wonByPlayer1 = comparePlayers(100000, player1, player2);
    System.out.println("Four Turns Player won " + wonByPlayer1*100 + "% of games");
  }
  
  public static void SimpleHoldVsWatchOpponet(){
    PigPlayer player1 = new SimpleHoldPlayer();
    PigPlayer player2 = new WatchOpponentPlayer();
    double wonByPlayer1 = comparePlayers(100000, player1, player2);
    System.out.println("Simple Hold won " + wonByPlayer1*100 + "% of games");
  }
  
  
  public static void main(String [ ] args){
    //firstAdvantage(100);
    //compareSimpleHoldPlayers();
    //26 best hold value
    //findGoodWatchValues();
    //reasonable: 20 number: 5 close: 28 wonByFirst: 0.5649
    //SimpleHoldVsWatchOpponet();
    //FourTurnsVsStrategicPlayer();
    //FourTurnsVsWatchOpponent();
    //FourTurnsVsSimpleHold();
    StrategicPlayervsWatchOpponent();
    //StrategicPlayervsSimpleHold();
  }
}
