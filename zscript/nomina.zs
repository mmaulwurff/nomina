class Nomina : EventHandler
{

// public: /////////////////////////////////////////////////////////////////////

  bool, String getName(String className)
  {
    String customName;
    int    gameType = getDehackedGameType();
    switch (gameType)
    {
    case GAME_REKKR:    customName = mRekkrNames   .at(className); break;
    case GAME_FREEDOOM: customName = mFreedoomNames.at(className); break;
    default:            customName = mNames        .at(className); break;
    }

    bool nameExists = (customName.length() != 0);

    return nameExists, customName;
  }

  override
  void onRegister()
  {
    mNames         = fillNames();
    mRekkrNames    = fillRekkrNames();
    mFreedoomNames = fillFreedoomNames();
  }

  override
  void worldThingSpawned(WorldEvent event)
  {
    // Expect the unexpected!
    if (event == NULL || event.thing == NULL) { return; }

    nameActor(event.thing);
  }

// private: ////////////////////////////////////////////////////////////////////

  enum Games
  {
    GAME_NO_DEHACKED,
    GAME_REKKR,
    GAME_FREEDOOM,
  }

  private
  static int getDehackedGameType()
  {
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
  private na_Data mRekkrNames;
  private na_Data mFreedoomNames;

} // class na_EventHandler
