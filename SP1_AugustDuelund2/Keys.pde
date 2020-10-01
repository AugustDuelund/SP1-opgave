class Keys
{
  private boolean wDown = false;
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;
  //AUGUST
  private boolean upDown = false;
  private boolean leftDown = false;
  private boolean downDown = false;
  private boolean rightDown = false;

  public Keys() {
  }

  public boolean wDown()
  {
    return wDown;
  }

  public boolean aDown()
  {
    return aDown;
  }

  public boolean sDown()
  {
    return sDown;
  }

  public boolean dDown()
  {
    return dDown;
  }
  //AUGUST

  public boolean upDown()
  {
    return upDown;
  }
  public boolean leftDown ()
  {
    return leftDown;
  }
  public boolean downDown ()
  {
    return downDown;
  }
  public boolean rightDown()
  {
    return rightDown;
  }

  void onKeyPressed1() 
  {
    if (key == CODED) {
      if (keyCode == UP) {
        upDown = true;
      } else if (keyCode == LEFT)
      {
        leftDown = true;
      } else if (keyCode == DOWN)
      {
        downDown = true;
      } else if (keyCode == RIGHT)
      {
        rightDown = true;
      }
    }
  }

  void onKeyReleased1()
  {
    if (upDown) {
      upDown = false;
    } else if (leftDown)
    {
      leftDown = false;
    } else if (downDown)
    {
      downDown = false;
    } else if (rightDown)
    {
      rightDown = false;
    }
  }


  void onKeyPressed(char ch)
  {
    if (ch == 'W' || ch == 'w')
    {
      wDown = true;
    } else if (ch == 'A' || ch == 'a')
    {
      aDown = true;
    } else if (ch == 'S' || ch == 's')
    {
      sDown = true;
    } else if (ch == 'D' || ch == 'd')
    {
      dDown = true;
    }
  }

  void onKeyReleased(char ch)
  {
    if (ch == 'W' || ch == 'w')
    {
      wDown = false;
    } else if (ch == 'A' || ch == 'a')
    {
      aDown = false;
    } else if (ch == 'S' || ch == 's')
    {
      sDown = false;
    } else if (ch == 'D' || ch == 'd')
    {
      dDown = false;
    }
  }
}
