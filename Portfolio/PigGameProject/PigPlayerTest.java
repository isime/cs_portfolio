import junit.framework.TestCase;

public class PigPlayerTest extends TestCase {
  // tests mutator and accessor for name
  public void testName() {
    UserPigPlayer person = new UserPigPlayer("user");
    assertEquals("user",person.getName());
    person.setName("Helen");
    assertEquals("Helen",person.getName());
  }
  
  // tests that score starts at 0
  public void testScore() {
    UserPigPlayer person = new UserPigPlayer("user");
    assertEquals(0,person.getScore());
  }
  
  // tests the addPoints and getScore methods work
  public void testAddPoints() {
    UserPigPlayer person = new UserPigPlayer("user");
    assertEquals(0,person.getScore());
    person.addPoints(12);
    assertEquals(12,person.getScore());
    person.addPoints(13);
    assertEquals(25,person.getScore());
  }
  
  // tests the addPOints, getScore, and reset methods work
  public void testAddReset() {
    UserPigPlayer person = new UserPigPlayer("user");
    assertEquals(0,person.getScore());
    person.addPoints(12);
    person.addPoints(13);
    assertEquals(25,person.getScore());
    person.reset();
    assertEquals(0,person.getScore());
    person.addPoints(22);
    assertEquals(22,person.getScore());
  }
  
  // assumes PigGame.GOAL is 100
  public void testWon() {
    UserPigPlayer person = new UserPigPlayer("user");
    person.addPoints(99);
    assertFalse(person.won());
    
    // check 100 points
    person.addPoints(1);       
    assertTrue(person.won());
    
    // check 101 points
    person = new UserPigPlayer("user");
    person.addPoints(101);
    assertTrue(person.won());
  }
  
  // assumes PigGame.GOAL is 100
  public void testWinRecord() {
    UserPigPlayer person = new UserPigPlayer("user");
    person.addPoints(20);
    assertEquals(0,person.getWinRecord());
    person.addPoints(102);
    assertEquals(1,person.getWinRecord());
    person.reset();
    assertEquals(1,person.getWinRecord());
    person.addPoints(85);
    person.addPoints(35);
    assertEquals(2,person.getWinRecord());
  }
}
