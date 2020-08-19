class Nomina : EventHandler
{

// public: /////////////////////////////////////////////////////////////////////

  bool, String getName(String className)
  {
    String userDefinedName = mUserDefinedNames.at(className);
    if (userDefinedName.length() != 0) { return true, userDefinedName; }

    String customName = mNames.at(className);
    bool   nameExists = (customName.length() != 0);

    return nameExists, customName;
  }

  override
  void worldLoaded(WorldEvent event)
  {
    int gameType = getDehackedGameType();
    switch (gameType)
    {
    case GAME_REKKR:    mNames = fillRekkrNames();    break;
    case GAME_FREEDOOM: mNames = fillFreedoomNames(); break;
    case GAME_D4V:      mNames = fillD4VNames();      break;
    default:            mNames = fillNames();         break;
    }

    mWeaponNameCvar = na_Cvar.of("na_SelectedWeaponName", players[consolePlayer]);
    mUserDefinedNames = na_Data.ofCvar(na_Cvar.of("na_UserDefinedNames"));
  }

  override
  void worldThingSpawned(WorldEvent event)
  {
    // Expect the unexpected!
    if (event == NULL || event.thing == NULL) { return; }

    nameActor(event.thing);
  }

  override
  void worldTick()
  {
    let weapon = players[consolePlayer].readyWeapon;
    if (weapon != NULL)
    {
      mWeaponNameCvar.setString(weapon.getTag());
    }
  }

  override
  void networkProcess(ConsoleEvent event)
  {
    if (event.name == "na_ApplyWeaponNameChange" && getWeapon() != NULL)
    {
      String newTag = mWeaponNameCvar.getString();
      let weapon = getWeapon();
      retagClass(weapon.getClassName(), newTag);
      mUserDefinedNames.add(weapon.getClassName(), newTag);
      mUserDefinedNames.saveTo(na_Cvar.of("na_UserDefinedNames"));
    }
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
  void retagClass(String className, String newTag)
  {
    let i = ThinkerIterator.Create(className);
    Actor a;
    while (a = Actor(i.next()))
    {
      a.setTag(newTag);
    }
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
  Weapon getWeapon()
  {
    return players[consolePlayer].readyWeapon;
  }

  private
  void nameActor(Actor thing)
  {
    String className = thing.getClassName();
    bool   nameExists;
    String name;
    [nameExists, name] = getName(className);

    if (nameExists)
    {
      thing.setTag(name);
    }
  }

  private na_Data mNames;

  private na_Cvar mWeaponNameCvar;
  private na_Data mUserDefinedNames;

} // class na_EventHandler
