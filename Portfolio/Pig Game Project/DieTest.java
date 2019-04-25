import junit.framework.TestCase;

public class DieTest extends TestCase {
  
  /**
   * test the mutator and accessor methods work
   */
  public void testValidSides() {
    Die valid = new Die();
    valid.setSides(10);
    assertEquals(10, valid.getSides());
  }
  
  /**
   * test the mutator rejects invalid sides
   */
  public void testInvalidSides() {
    Die invalid = new Die();
    invalid.setSides(-1);

    assertFalse(invalid.getSides() == -1);
    
    invalid.setSides(0);
    assertFalse(invalid.getSides() == 0);
  }
  
  /**
   * test static Die method - should only return 1, 2, 3, 4, 5, 6
   */
  public void testDie() {
    int[] results = new int[6];
    for (int i=0; i<results.length; i++)
      results[i] = 0;
    Die die = new Die();
    for (int i=0; i<6000; i++) {
      int j = die.roll() - 1;
      results[j]++;
    }
    for (int i=0; i<results.length; i++)
      assertTrue(850 < results[i] && results[i] < 1150);
      
  }
  
  /**
   * test that a three-sided die only returns 1, 2, and 3
   * evenly distributed between the three options
   */
  public void testThreeSided() {
    Die die = new Die();
    die.setSides(3);
    assertEquals(3, die.getSides());
    
    //initialize array to count die results
    int[] results = new int[3];
    for (int i=0; i<results.length; i++)
      results[i] = 0;
    
    for (int i=0; i<3000; i++) {
      int j = die.rollDie();
      assertTrue(j == 1 || j == 2 || j == 3);
      j = j-1;  // valid array indices are 0, 1, 2
      results[j]++;
    }
    for (int i=0; i<results.length; i++)
      assertTrue(850 < results[i] && results[i] < 1150);    
  }
  
  /**
   * test that a 12-sided die only returns 1, 2,..., 11, 12
   * evenly distributed between the 12 options
   */
  public void testTwelveSided() {
    Die die = new Die();
    die.setSides(12);
    assertEquals(12, die.getSides());
    
    //initialize array to count die results
    int[] results = new int[12];
    for (int i=0; i<results.length; i++)
      results[i] = 0;
    
    for (int i=0; i<12000; i++) {
      int j = die.rollDie();
      assertTrue(0 < j && j <= 12);
      j = j-1;  // valid array indices are 0 to 11
      results[j]++;
    }
    for (int i=0; i<results.length; i++)
      assertTrue(850 < results[i] && results[i] < 1150);    
  }
  
}
