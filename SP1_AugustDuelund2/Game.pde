import java.util.Random;

class Game
{
  private Random rnd;
  private int width;
  private int height;
  private int[][] board;
  private Keys keys;
  private int playerLife;
  private int player1Life;
  private Dot player;
  //AUGUST
  private Dot player1;
  private Dot[] enemies;
  private Dot[] food;
  boolean gameOver = false;





  Game(int width, int height, int numberOfEnemies, int numberOfFood)
  {
    if (width < 10 || height < 10)
    {
      throw new IllegalArgumentException("Width and height must be at least 10");
    }
    if (numberOfEnemies < 0)
    {
      throw new IllegalArgumentException("Number of enemies must be positive");
    } 
    if (numberOfFood < 0)
    {
      throw new IllegalArgumentException("Number of food must be positive");
    }
    this.rnd = new Random();
    this.board = new int[width][height];
    this.width = width;
    this.height = height;
    keys = new Keys();
    player = new Dot(0, 0, width-1, height-1);
    //AUGUST
    player1 = new Dot(0, 0, width-1, height-1);
    food = new Dot[numberOfFood];
    enemies = new Dot[numberOfEnemies];
    for (int i = 0; i < numberOfEnemies; ++i)
    {
      enemies[i] = new Dot(width-1, height-1, width-1, height-1);
    }
    for (int i = 0; i < numberOfFood; ++i)
    {
      food[i] = new Dot(width/2, height/2, width-1, height-1);
    }
    this.playerLife = 100; 
    this.player1Life = 100;
  }

  public int getWidth()
  {
    return width;
  }

  public int getHeight()
  {
    return height;
  }

  public int getPlayerLife()

  {
    return playerLife;
  }
  public int getPlayer1Life()
  {
    return player1Life;
  }
  public void onKeyPressed(char ch)
  {
    keys.onKeyPressed(ch);
  }

  public void onKeyReleased(char ch)
  {
    keys.onKeyReleased(ch);
  }

  public void onKeyPressed1()
  {
    keys.onKeyPressed1();
  }

  public void onKeyReleased1()
  {
    keys.onKeyReleased1();
  }

  public void update()
  {
    updatePlayer();
    updatePlayer1();
    updateEnemies();
    updateFood();
    checkForCollisions();
    clearBoard();
    populateBoard();
  }



  public int[][] getBoard()
  {
    //ToDo: Defensive copy?
    return board;
  }

  private void clearBoard()
  {
    for (int y = 0; y < height; ++y)
    {
      for (int x = 0; x < width; ++x)
      {
        board[x][y]=0;
      }
    }
  }

  private void updatePlayer()
  {
    //Update player
    if (keys.wDown() && !keys.sDown())
    {
      player.moveUp();
    }
    if (keys.aDown() && !keys.dDown())
    {
      player.moveLeft();
    }
    if (keys.sDown() && !keys.wDown())
    {
      player.moveDown();
    }
    if (keys.dDown() && !keys.aDown())
    {
      player.moveRight();
    }
  }

  private void updatePlayer1()
  {
    if (keys.upDown && !keys.downDown)
    {
      player1.moveUp();
    }
    if (keys.leftDown && !keys.rightDown)
    {
      player1.moveLeft();
    }
    if (keys.downDown && !keys.upDown)
    {
      player1.moveDown();
    }
    if (keys.rightDown && !keys.leftDown)
    {
      player1.moveRight();
    }
  }
  private void updateFood()
  {
    for (int i = 0; i < food.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if (rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player.getX() - food[i].getX();
        int dy = player.getY() - food[i].getY();
        int ddx = player1.getX() - food[i].getX();
        int ddy = player1.getY() - food[i].getY();
        if (abs(dx) > abs(dy))
          if (abs(ddx) > abs(ddy))
          {
            if (dx > 0)
            {
              //Player is to the right
              food[i].moveLeft();
            } else
            {
              //Player is to the left
              food[i].moveRight();
            }
          } else if (dy > 0)
          {
            //Player is down;
            food[i].moveUp();
          } else
          {//Player is up;
            food[i].moveDown();
          }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          food[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          food[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          food[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          food[i].moveDown();
        }
      }
    }
  }

  private void updateEnemies()
  {
    for (int i = 0; i < enemies.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if (rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player.getX() - enemies[i].getX();
        int dy = player.getY() - enemies[i].getY();
        int ddx = player1.getX() - enemies[i].getX();
        int ddy = player1.getY() - enemies[i].getY();
        if (abs(dx) > abs(dy))
          if (abs(ddx) > abs(ddy))
          {
            if (dx > 0)
            {
              //Player is to the right
              enemies[i].moveRight();
            } else
            {
              //Player is to the left
              enemies[i].moveLeft();
            }
          } else if (dy > 0)
          {
            //Player is down;
            enemies[i].moveDown();
          } else
          {//Player is up;
            enemies[i].moveUp();
          }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          enemies[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          enemies[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          enemies[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          enemies[i].moveDown();
        }
      }
    }
  }

  private void populateBoard()
  {
    //Insert player
    board[player.getX()][player.getY()] = 1;
    board[player1.getX()][player1.getY()] = 4;
    //Insert enemies
    for (int i = 0; i < enemies.length; ++i)
    {
      board[enemies[i].getX()][enemies[i].getY()] = 2;
    }
    for (int i = 0; i < food.length; ++i)
    {
      board[food[i].getX()][food[i].getY()] = 3;
    }
  }

  private void checkForCollisions()
  {
    //Check enemy collisions
    for (int i = 0; i < enemies.length; ++i)
    {
     if (enemies[i].getX() == player.getX() && enemies[i].getY() == player.getY())
     {
       --playerLife;
     }
    else if (enemies[i].getX() == player1.getX() && enemies[i].getY() == player1.getY()) 
    {
        //We have a collision
        --player1Life;
    }
    }
    for (int i = 0; i <food.length; ++i)
    {
      if (food[i].getX() == player.getX() && food[i].getY() == player.getY())
      {
        //We have a collision
        ++playerLife;
      }
      else if(food[i].getX() == player1.getX() && food[i].getY() == player1.getY())
       
        ++player1Life;
    }
  }
}
