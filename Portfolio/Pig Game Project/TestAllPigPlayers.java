import junit.framework.TestCase;
import static junit.framework.Assert.*;

/* assumes PigGame.GOAL is 100 */

public class TestAllPigPlayers extends TestCase {
  
  private static int bestHoldValue = 18;  // not the best hold value - just a place holder
  private static long simulations = 1000;  // small numbers will run faster, but may occassionally give the wrong result
  
  // tests playTurn in PigGame
  public void testPigGame() {
    PigGame game = new PigGame();
    SimpleHoldPlayer player = new SimpleHoldPlayer("player", 20);
    SimpleHoldPlayer other = new SimpleHoldPlayer("other", 10);
    for (int i=0; i<simulations; i++) {
      int total = game.playTurn(player, other);
      assertTrue(total != 1);
      assertTrue(total == 0 || 20 <= total);
      assertTrue(total == 0 || total < 26);
      player.reset();
    }
  }
  
  public void testSimpleHoldGeneral() {
    SimpleHoldPlayer player = new SimpleHoldPlayer("player", 15);
    assertFalse(player.isRolling(25, 0));
    assertTrue(player.isRolling(10, 100));
  }
  
  public void testSimpleHoldBoundary() {
    SimpleHoldPlayer player = new SimpleHoldPlayer("player", 15);
    
    assertFalse(player.isRolling(15, 14));
    assertTrue(player.isRolling(14, 15));
  }
  
  public void testSimpleHoldWon() {
    SimpleHoldPlayer player = new SimpleHoldPlayer("player", 15);
    
    // A player who has won should stop rolling!
    player.addPoints(99);
    assertFalse(player.isRolling(3, 14));
  }
  
  public void testSimpleHoldExisting() {
    SimpleHoldPlayer player = new SimpleHoldPlayer("player", 15);
    
    // Ensure that player's score is not taken into account (at least obviously)
    player.addPoints(99);
    assertFalse(player.isRolling(15, 14));
  }
  
  // Checking Four Turns - hold values should match exactly
  public void testFourTurns() {
    FourTurnsPlayer player = new FourTurnsPlayer();
    
    // 0 holds
    assertTrue(player.isRolling(24, 0));
    assertFalse(player.isRolling(27, 0));
    
    player.addPoints(28);
    // 1 hold, score 28. Hold value should be 24.
    assertTrue(player.isRolling(23, 0));
    assertFalse(player.isRolling(24, 0));
    
    player.addPoints(24);
    // 2 holds, score 52. Hold value should be 24 again.
    assertTrue(player.isRolling(23, 0));
    assertFalse(player.isRolling(29, 0));
    
    player.addPoints(29);
    
    // 3 holds, score 81. Hold value should be 19.
    assertTrue(player.isRolling(18, 0));
    assertFalse(player.isRolling(19, 0));
    
    // Player should have won after this point.
    player.addPoints(19);
    assertTrue(player.won());
  }
  
  // checking that reset works
  public void testFourTurnsReset() {
    FourTurnsPlayer player = new FourTurnsPlayer();
    
    // 0 turns
    assertTrue(player.isRolling(24, 0));
    assertFalse(player.isRolling(28, 0));
    
    player.addPoints(28);
    // 1 turn, score 28. Hold value should be 24.
    assertTrue(player.isRolling(23, 0));
    assertFalse(player.isRolling(28, 0));
    
    player.addPoints(28);
    // 2 turns, score 56. Hold value should be 22.
    assertTrue(player.isRolling(21, 0));
    assertFalse(player.isRolling(22, 0));
    
    player.addPoints(22);
    
    // 3 turns, score 78. Hold value should be 22.
    assertTrue(player.isRolling(21, 0));
    assertFalse(player.isRolling(22, 0));
    player.addPoints(22);
    
    // Player should have won after this point.
    player.reset();
    
    // hold value should be back to 25
    assertTrue(player.isRolling(24, 0));
    assertFalse(player.isRolling(25, 0));
  }
  
  // checks that WatchOpponent is a better strategy than SimpleHoldPlayer
  public void testFourTurnsComparison() {
    FourTurnsPlayer four = new FourTurnsPlayer("watcher");
    SimpleHoldPlayer holder = new SimpleHoldPlayer("best hold", bestHoldValue);
    assertTrue(Simulations.comparePlayers(simulations, four, holder)>0.5);
  }   
  
   // need to update bestHoldValue on line 8
   // checks that WatchOpponent is a better strategy than SimpleHoldPlayer
   public void testWatchOpponent() {
   WatchOpponentPlayer watcher = new WatchOpponentPlayer("watcher");
   SimpleHoldPlayer holder = new SimpleHoldPlayer("best hold", bestHoldValue);
   assertTrue(Simulations.comparePlayers(simulations, watcher, holder)>0.5);
   }   
   
   // need to update bestHoldValue on line 8
   // checks that StrategicPlayer is a better strategy than SimpleHoldPlayer
   public void testStrategicPlayer() {
   StrategicPlayer strategy = new StrategicPlayer("strategic");
   SimpleHoldPlayer holder = new SimpleHoldPlayer("best hold", bestHoldValue);
   assertTrue(Simulations.comparePlayers(simulations, strategy, holder)>0.5);
   }  
   
   
}
