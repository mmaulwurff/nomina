class Nomina : EventHandler
{

// public: /////////////////////////////////////////////////////////////////////

  bool, String getName(String className)
  {
    String customName = mNames.at(className);
    bool   nameExists = (customName.length() != 0);

    return nameExists, customName;
  }

  override
  void onRegister()
  {
    int gameType = getDehackedGameType();
    switch (gameType)
    {
    case GAME_REKKR:    mNames = fillRekkrNames();    break;
    case GAME_FREEDOOM: mNames = fillFreedoomNames(); break;
    case GAME_D4V:      mNames = fillD4VNames();      break;
    default:            mNames = fillNames();         break;
    }
  }

  override
  void worldThingSpawned(WorldEvent event)
  {
    //// Expect the unexpected!
    //if (event == NULL || event.thing == NULL) { return; }

    //nameActor(event.thing);
  }

// private: ////////////////////////////////////////////////////////////////////

  enum Games
  {
    GAME_NO_DEHACKED,
    GAME_REKKR,
    GAME_FREEDOOM,
    GAME_D4V,
  }

  private
  static int getDehackedGameType()
  {
    //String d4VClass = "D4V_Shotgun";
    bool isD4V = ((Class<Object>)(String.Format("D4V_Shotgun")) != NULL);
    if (isD4V) { return GAME_D4V; }

    bool isRekkr = (Wads.FindLump("REKCREDS") != -1);
    if (isRekkr) { return GAME_REKKR; }

    bool isFreedoom = (Wads.FindLump("FREEDOOM") != -1);
    if (isFreedoom) { return GAME_FREEDOOM; }

    return 0;
  }

  private
  void nameActor(Actor thing)
  {
    String className = thing.getClassName();
    String tag       = thing.getTag();

    bool   nameExists;
    String name;
    [nameExists, name] = getName(className);

    if (nameExists)
    {
      thing.setTag(name);
    }
  }

  private na_Data mNames;

} // class na_EventHandler
