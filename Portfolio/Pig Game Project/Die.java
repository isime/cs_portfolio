/**
 * Ian Sime
 * Die Class
 * October 2015
 */
public class Die {
  
  private int sides;
  
  public Die() {
    sides = 6;
  }
  
  public Die(int sides){
    if(sides != 0){
    this.sides = Math.abs(sides);
    }
  }
  
  //Generates a random number as if you were rolling a 6 sided die
  public static int roll() {
    int roll;
    roll = (int) (Math.random() * 6) + 1;
    return roll;  
  }
  
  public void setSides(int numberOfSides){
    if(numberOfSides != 0){
    sides = Math.abs(numberOfSides);
    }
  }
  
  public int getSides(){
    return sides;
  }
  
  public int rollDie(){
    int roll;
    int range = this.getSides();
    roll = (int) (Math.random() * range) + 1;
    return roll;
  }
  
  public static void main(String[] args) { 
    Die d1 = new Die();
    System.out.println(d1.roll());
    System.out.println(d1.roll());
    System.out.println(d1.roll());
    System.out.println(d1.roll());
    System.out.println(d1.roll());
    System.out.println(d1.roll());
    
    Die d2 = new Die();
    d2.setSides(10);
    System.out.println(d2.getSides() + " sides");
    System.out.println(d2.rollDie());
    System.out.println(d2.rollDie());
    System.out.println(d2.rollDie());
    System.out.println(d2.rollDie());
    System.out.println(d2.rollDie());
    System.out.println(d2.rollDie());
    System.out.println(d2.rollDie());
    System.out.println(d2.rollDie());
    System.out.println(d2.rollDie());
  }
}


