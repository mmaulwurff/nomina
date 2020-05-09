version 4.3

class Nomina : EventHandler
{

// public: /////////////////////////////////////////////////////////////////////

  bool, String getName(String className)
  {
    String name       = mNames.at(className);
    bool   nameExists = (name.length() != 0);

    return nameExists, name;
  }

  override
  void onRegister()
  {
    mNames = Dictionary.Create();
    fillNames();
  }

  override
  void worldThingSpawned(WorldEvent event)
  {
    // Expect the unexpected!
    if (event == NULL || event.thing == NULL) { return; }

    nameActor(event.thing);
  }

// private: ////////////////////////////////////////////////////////////////////

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

  private
  void add(String key, String value)
  {
    mNames.insert(key, value);
  }

  private
  void fillNames()
  {
    add( "BFGZombie"          , "BFG Zombie"           );
    add( "BaronOfHellGreen"   , "Baron of Hell"        );
    add( "BatFamiliar"        , "Bat Familiar"         );
    add( "BelphegorClone"     , "Belphegor"            );
    add( "BloodDemonClone"    , "Mech-demon"           );
    add( "CacoDemonBlue"      , "Cacodemon"            );
    add( "CacolanternClone"   , "Cacolantern"          );
    add( "ChaingunMajor"      , "Chaingun Major"       );
    add( "ChainsawZombie"     , "Chainsaw Zombie"      );
    add( "DoomTrooper"        , "Mutant Space Trooper" );
    add( "DragonFamiliar"     , "Dragon Familiar"      );
    add( "EnhancedCacodemon"  , "Enhanced Cacodemon"   );
    add( "HS"                 , "Hades Sphere"         );
    add( "HectebusNew"        , "Hectebus"             );
    add( "HellGuard"          , "Hell Guard"           );
    add( "HellKnightGreen"    , "Hell Knight"          );
    add( "HellWarrior"        , "Hell Warrior"         );
    add( "HellsFury"          , "Hell's Fury"          );
    add( "ImpWarlord"         , "Imp Warlord"          );
    add( "Incarnate"          , "Death Incarnate"      );
    add( "KDiZDNightmare"     , "Nightmare"            );
    add( "LordofHeresy"       , "Heresy Lord"          );
    add( "LostSoulSmoke"      , "Lost Soul"            );
    add( "MaulerDemon"        , "Mauler Demon"         );
    add( "NamiDarkImp"        , "Dark Imp"             );
    add( "NetherworldDrone"   , "Netherworld Drone"    );
    add( "PlasmaElemental"    , "Plasma Elemental"     );
    add( "PlasmaZombie"       , "Plasma Zombie"        );
    add( "PyroCannon"         , "PyroCannon Prototype" );
    add( "RailArachnotron"    , "Rail Arachnotron"     );
    add( "RapidFireTrooper"   , "Rapid Fire Zombie"    );
    add( "RocketGuy"          , "Rocket Zombie"        );
    add( "RocketGuy2"         , "Rocket Zombie"        );
    add( "STDarkImp"          , "Dark Imp"             );
    add( "STMinigun"          , "Minigun"              );
    add( "SnakeImp"           , "Snake Imp"            );
    add( "SoulHarvester"      , "Soul Harvester"       );
    add( "SourceGuardians"    , "Source Guardians"     );
    add( "StoneImp"           , "Stone Imp"            );
    add( "SuicideBomber"      , "Suicide Bomber"       );
    add( "TNTEnhancedCaco"    , "EnhancedCaco"         );
    add( "TNTHellWarrior"     , "Hell Warrior"         );
    add( "TNTMiniSpider"      , "Spider"               );
    add( "TNTSoulHarvester"   , "Soul Harvester"       );
    add( "TNTSpider"          , "Giant Spider"         );
    add( "TheSource"          , "The Source"           );
    add( "TorturedSoul"       , "Tortured Soul"        );
    add( "VoidDarkImp"        , "Dark Imp"             );
    add( "WarlordOfHell"      , "Warlord of Hell"      );
    add( "ZombieMarine"       , "Zombie Marine"        );
    add( "ZombieRailgunner"   , "Zombie Railgunner"    );
    add( "ZombieRailgunner30" , "Zombie Railgunner"    );
    add( "ZombieRailgunner50" , "Zombie Railgunner"    );
    add( "ZombieRailgunner70" , "Zombie Railgunner"    );
  }

  private Dictionary mNames;

} // class na_EventHandler
