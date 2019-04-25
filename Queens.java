/** 
 * Solve the n - queens problem using recursive backtracking algorithm.
 * 
 * @author [Ian Sime]
 **/

public class Queens {
  private final static int DEFAULT_BOARD_SIZE = 9;  
  
  private char board[][]; 	// game board
  	
  private int boardSize;	// size of game board
  
  /**
   * Constructor: Creates an empty square board of default size.
   */
  public Queens() {
    this(DEFAULT_BOARD_SIZE);
  }          
  
  /**
   * Constructor: Creates an empty n x n square board.
   */
  public Queens(int boardSize) {
    board = new char[boardSize][boardSize];
    this.boardSize = boardSize;
    
    for (int r = 0; r < boardSize; r++) 
    	for (int c = 0; c < boardSize; c++)
    		board[r][c] = '*';    
  }           
  
  
  /**
   * Clears the game board.
   */
  public void clearBoard() {
	  for (int r = 0; r < boardSize; r++) 
	    	for (int c = 0; c < boardSize; c++)
	    		board[r][c] = '*';    
	  }
  
  /** Solves Eight Queens problem.
    * Precondition: Empty game board  
    * Postcondition: If a solution is found, each 
    * row of the board contains one queen where
    * queens are non-attacking, and method 
    * returns true; otherwise, returns false (no 
    * solution exists for a queen anywhere in row 
    * specified) and the board is empty.
    */
  public boolean solveQueensProblem() {
	  // we begin from row 0
    if (placeQueens(0) == true) 
      return true;
    else {
    	// no solution found, so return failure
    	clearBoard(); 
    	return false;
    }
  }      
  
  /**
   * Places queens in row of the board beginning
   * at the specified row. Queens are placed using
   * the recursive backtracking algorithm.
   * 
   * Precondition: Queens are placed correctly in
   * row 0 through row-1.
   * 
   * Postcondition: If a solution is found, each
   * row of the board contains one queen and method
   * returns true; otherwise, returns false (no
   * solution exists for a queen anywhere in row
   * specified).
   * 
   * @param row
   * @return
   */
  private boolean placeQueens(int row) {
    if (row >= boardSize) {
      return true;  // Solution found: entire board has been filled!
    } 
    else{
    	for(int c = 0; c < boardSize; c++){
    		if(isUnderAttack(row, c) == false){
    			setQueen(row,c);
    			boolean call = placeQueens(row +1);
    			if(call == false){
    				removeQueen(row, c);
    			}
    			else{
    				return true;
    			}
    		}
    	}
    }      
   
    return false;
    
  } 
  
  /**
   * Place a queen at specified row and column
   * @param row
   * @param column
   */
  private void setQueen(int row, int column) {
    board[row][column] = 'Q';
  }  
  
  /**
   * Removes a queen at specified row and column
   * @param row
   * @param column
   */
  private void removeQueen(int row, int column) {
	  board[row][column] = '*';
  }  
  
  /**
   * Determines if placing a Queen at specified row and column
   * will leave the Queen under attack.
   * 
   * This method must check if a Queen placed at the specified 
   * row:column is under attack by another Queen in the same column,
   * left-diagonal, or right diagonal.
   * 
   * @param row - The row the Queen is being placed
   * @param column - The column the Queen is being placed
   * @return True if queen is under attack, false otherwise.
   */
  private boolean isUnderAttack(int row, int column) {
	 	
    return underAttackRight(row, column) || underAttackLeft(row, column) || underAttackCol(row, column);
    
  }  
  
  private boolean underAttackCol(int row, int col){
	  if(row >= 0){
		  if(board[row][col] == 'Q'){
			  return true;
		  }
		  else{
			 return underAttackCol(row-1, col);
		  }
	  }
	  else{
		  return false;
	  }
  }
  
  private boolean underAttackLeft(int row, int col){
	  if(row >= 0 && col >= 0){
		  if(board[row][col] == 'Q'){
			  return true;
		  }
		  else{
			 return underAttackLeft(row-1, col-1);
		  }
	  }
	  else{
		  return false;
	  }
  }
  
  private boolean underAttackRight(int row, int col){
	  if(row >= 0 && col < boardSize){
		  if(board[row][col] == 'Q'){
			  return true;
		  }
		  else{
			 return underAttackRight(row-1, col+1);
		  }
	  }
	  else{
		  return false;
	  }
  }
  
  // returns the game board
  public char[][] getBoard() {
	  return board;
  }
  
  
  public static void main(String[] args) {
      if (args.length != 1) {
          System.err.println("Usage: You must specify the size of the game board.");
      }
      else {
          // specifies the size of the game board
          int size = Integer.parseInt(args[0]);
	  
          // creates a new instance of the specified size
          Queens board = new Queens(size);
	  
          // call solveQueensProblem()
          if (board.solveQueensProblem()) {
              char newBoard[][] = board.getBoard();
    	  
              QueensGUI gui = new QueensGUI(size,size);
              gui.draw(newBoard);
          }
          else {
              System.out.println("No solution for board of size " + size);
          }
      }
  }
}