/**
 * Array 2D. 
 * 
 * Demonstrates the syntax for creating a two-dimensional (2D) array.
 * Values in a 2D array are accessed through two index values.  
 * 2D arrays are useful for storing images. In this example, each dot 
 * is colored in relation to its distance from the center of the image. 
 */
 
import java.util.Random;

Game game = new Game(25, 25, 10, 3  );
PFont font;
boolean gameOver = false;

public void settings() {
  size(1001, 1001);
}

void setup()
{
  frameRate(10);
  font = createFont("Arial", 16, true);
  textFont(font, 16);
}

void keyReleased()
{
  game.onKeyReleased(key);
  
  game.onKeyReleased1();
}

void keyPressed()
{
  game.onKeyPressed(key);

  game.onKeyPressed1();
}
 
  




void draw()
{
  
  if (gameOver){
  noLoop();
  }
  else {
    game.update();
  background(0); //Black  if (playerLife <= 0)
  
  // This embedded loop skips over values in the arrays based on
  // the spacer variable, so there are more values in the array
  // than are drawn here. Change the value of the spacer variable
  // to change the density of the points
  int[][] board = game.getBoard();
  for (int y = 0; y < game.getHeight(); y++)
  {
    for (int x = 0; x < game.getWidth(); x++)
    {
      //board
      if(board[x][y] == 0)
      {
        fill(0,0,0);
      }
      //player
      else if(board[x][y] == 1)
      {
        fill(0,0,255);
      }
      //enemies
      else if(board[x][y] == 2)
      {
        fill(255,0,0);
      }
      // ? - food
      else if(board[x][y] == 3)
      {
        fill(0,255,0);
      }
      //player pink
      else if(board[x][y] == 4)
      {
        fill(255,192,203);
      }
      stroke(100,100,100);
      rect(x*40, y*40, 40, 40);
    }
  }
  fill(255);
  text("Lifes: "+game.getPlayerLife(), 25,25);
  text("Lifes: "+game.getPlayer1Life(), 925,25);
}
if (game.playerLife <=0 || game.player1Life <= 0){
gameOver = true;
fill (255);
textAlign(CENTER);
textSize(100);
text("GAME OVER", width/2, height/3);
}


}
