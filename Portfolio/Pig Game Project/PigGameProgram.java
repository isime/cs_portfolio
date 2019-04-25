/**
 * runs a Graphical Pig Game
 */

/* This code relies on 
 *     the roll() method from your Die class
 *     the PigGame.GOAL constant
 *     the isRolling method from the SimpleHoldPlayer
 *
 * You may choose to use a different computer strategy 
 * by modifying line 16 below.
 */

public class PigGameProgram {  
  // modify this line if you want to test a different computer strategy
  public final static PigPlayer strategy = new SimpleHoldPlayer();
  
  public static void main(String[] args) {
    //Schedule a job for the event-dispatching thread:
    //creating and showing this application's GUI.
    javax.swing.SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        PigGameGUI.createAndShowGUI(strategy);
      }
    });
  }
}

/* If you have having trouble getting the program to run, make sure:
 *  you have all your own java files in the same folder (PigGame, Die, PigPlayer, etc)
 *  you have PigGameGUI.class in the same folder (included in PigGameGUI.zip
 *  you have an images folder in the same folder (included in PigGameGUI.zip)
 */