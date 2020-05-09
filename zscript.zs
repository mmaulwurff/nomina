version 4.3

class NominaAPI : Actor
{

  override
  String getObituary(Actor dummy1, Actor dummy2, Name className, bool dummy3)
  {
    let    nominaInstance = Nomina(EventHandler.Find("nomina"));
    bool   nameExists;
    String name;
    [nameExists, name] = nominaInstance.getName(className);

    return name;
  }

} // class NominaAPI

class Nomina : EventHandler
{

// public: /////////////////////////////////////////////////////////////////////

  bool, String getName(String className)
  {
    String customName;
    int    gameType = getDehackedGameType();
    switch (gameType)
    {
    case GAME_REKKR:    customName = mRekkrNames.at(className); break;
    case GAME_FREEDOOM: customName = mFreedoomNames.at(className); break;
    default:            customName = mNames.at(className); break;
    }

    bool nameExists = (customName.length() != 0);

    return nameExists, customName;
  }

  override
  void onRegister()
  {
    mNames         = Dictionary.Create();
    mRekkrNames    = Dictionary.Create();
    mFreedoomNames = Dictionary.Create();

    fillNames();
    fillRekkrNames();
    fillFreedoomNames();
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

  private
  void add(String key, String value)
  {
    mNames.insert(key, value);
  }

  private
  void addRekkr(String key, String value)
  {
    mRekkrNames.insert(key, value);
  }

  private
  void addFree(String key, String value)
  {
    mFreedoomNames.insert(key, value);
  }

  private
  void fillNames()
  {
    add("BFGZombie"                     , "BFG Zombie"                         );
    add("BaronOfHellGreen"              , "Baron of Hell"                      );
    add("BatFamiliar"                   , "Bat Familiar"                       );
    add("BelphegorClone"                , "Belphegor"                          );
    add("BioTechEnemy1"                 , "Prisoner"                           );
    add("BioTechEnemy2"                 , "Shotgun Prisoner"                   );
    add("BioTechEnemy3"                 , "Biotech Imp"                        );
    add("BioTechEnemy4"                 , "Biotech Demon"                      );
    add("BioTechEnemy5"                 , "Biotech Spider"                     );
    add("BioTechEnemy6"                 , "Sec Droid"                          );
    add("BioTechEnemy7"                 , "Biotech Stalker"                    );
    add("Biowarthundersounds"           , "Lightning Itself"                   );
    add("BlazeStreamWeapon"             , "Blaze Stream (Slot 1)"              );
    add("BlazeStreamWeaponS2"           , "Blaze Stream (Slot 2)"              );
    add("BlazeStreamWeaponS3"           , "Blaze Stream (Slot 3)"              );
    add("BloodDemonClone"               , "Mech-demon"                         );
    add("BusterWeapon"                  , "Buster (Slot 1)"                    );
    add("BusterWeaponS2"                , "Buster (Slot 2)"                    );
    add("BusterWeaponS3"                , "Buster (Slot 3)"                    );
    add("CacoDemonBlue"                 , "Cacodemon"                          );
    add("CacolanternClone"              , "Cacolantern"                        );
    add("ChaingunMajor"                 , "Chaingun Major"                     );
    add("ChainsawZombie"                , "Chainsaw Zombie"                    );
    add("ChaserMissileWeapon"           , "Chaser Missile (Slot 1)"            );
    add("ChaserMissileWeaponS2"         , "Chaser Missile (Slot 2)"            );
    add("ChaserMissileWeaponS3"         , "Chaser Missile (Slot 3)"            );
    add("CleimosRobot"                  , "Cleimos Robot"                      );
    add("CoDChaingunGuy"                , "Possessed Commando"                 );
    add("CoDCyber"                      , "BFG Cyberdemon"                     );
    add("CoDKnight"                     , "Invisible Hellknight"               );
    add("CoDPossessed"                  , "Possessed Zombie"                   );
    add("CoDSergeant"                   , "Possessed Sergeant"                 );
    add("CoDSpider"                     , "Mother Spiderdemon"                 );
    add("CoDVile"                       , "Arch-Invocator"                     );
    add("CommanderKeen"                 , "Commander Keen"                     );
    add("CrushBlastWeapon"              , "Crush Blast (Slot 1)"               );
    add("CrushBlastWeaponS2"            , "Crush Blast (Slot 2)"               );
    add("CrushBlastWeaponS3"            , "Crush Blast (Slot 3)"               );
    add("Cyberdemonjr"                  , "Cyberdemon Jr."                     );
    add("DoomTrooper"                   , "Mutant Space Trooper"               );
    add("DragonFamiliar"                , "Dragon Familiar"                    );
    add("EnhancedCacodemon"             , "Enhanced Cacodemon"                 );
    add("EnjaySuperImp"                 , "New kind of imp"                    );
    add("EnjayZombieGunner"             , "New kind of zombie"                 );
    add("EnslaveEnemy1"                 , "Enslaved Demon"                     );
    add("EnslaveEnemy2"                 , "Robotic Skull"                      );
    add("Fastimp"                       , "Fast Imp"                           );
    add("FrostSnapValnos"               , "Frost Snap (Slot 1)"                );
    add("FrostSnapValnoss2"             , "Frost Snap (Slot 2)"                );
    add("FrostSnapValnoss3"             , "Frost Snap (Slot 3)"                );
    add("FrostSnapValnoss4"             , "Frost Snap (Slot 4)"                );
    add("GrindHalberdWeapon"            , "Grind Halberd (Slot 1)"             );
    add("GrindHalberdWeaponS2"          , "Grind Halberd (Slot 2)"             );
    add("GrindHalberdWeaponS3"          , "Grind Halberd (Slot 3)"             );
    add("HS"                            , "Hades Sphere"                       );
    add("HTP_Enemy1"                    , "Hell Guard"                         );
    add("HTP_Enemy2"                    , "HTP Robot"                          );
    add("HTP_Enemy3"                    , "Liquid Metal Orb"                   );
    add("HTP_Enemy4"                    , "HTP Fireball Robot"                 );
    add("HTP_Enemy5"                    , "Master Metal Orb"                   );
    add("HTP_Enemy6"                    , "HTP Heavy Robot"                    );
    add("HTP_Prop1"                     , "HTP Core"                           );
    add("HardAss"                       , "Hard Ass Zombie"                    );
    add("HectebusNew"                   , "Hectebus"                           );
    add("HellGuard"                     , "Hell Guard"                         );
    add("HellKnightGreen"               , "Hell Knight"                        );
    add("HellWarrior"                   , "Hell Warrior"                       );
    add("HellsFury"                     , "Hell's Fury"                        );
    add("Holobotinvisable"              , "Camouflaged Holobot"                );
    add("HuntingLaserWeapon"            , "Hunting Laser (Slot 1)"             );
    add("HuntingLaserWeaponS2"          , "Hunting Laser (Slot 2)"             );
    add("HuntingLaserWeaponS3"          , "Hunting Laser (Slot 3)"             );
    add("ImpWarlord"                    , "Imp Warlord"                        );
    add("Incarnate"                     , "Death Incarnate"                    );
    add("KDiZDNightmare"                , "Nightmare"                          );
    add("LordofHeresy"                  , "Heresy Lord"                        );
    add("LostSoulSmoke"                 , "Lost Soul"                          );
    add("MarsDoomGargoyle"              , "Martian Gargoyle"                   );
    add("MarsDoomMarinePlasma"          , "Plasma Space Marine"                );
    add("MarsDoomMarineRocket"          , "Rocket Space Marine"                );
    add("MarsDoomMarineShotgun"         , "Space Marine"                       );
    add("MarsDoomMissile"               , "Missile"                            );
    add("MarsDoomSecurityDrone"         , "Mars Security Drone"                );
    add("MarsDoomTurret"                , "Mars Turret"                        );
    add("MaulerDemon"                   , "Mauler Demon"                       );
    add("MetalMonstrosityWeapon"        , "Metal Monstrosity (Slot 1)"         );
    add("MetalMonstrosityWeaponS2"      , "Metal Monstrosity (Slot 2)"         );
    add("MetalMonstrosityWeaponS3"      , "Metal Monstrosity (Slot 3)"         );
    add("NamiDarkImp"                   , "Dark Imp"                           );
    add("NetherworldDrone"              , "Netherworld Drone"                  );
    add("OSIRISAnubis"                  , "Anubis"                             );
    add("OSIRISArcheologist"            , "Archaeologist"                      );
    add("OSIRISBat"                     , "Goddamned Bat"                      );
    add("OSIRISPharaoh"                 , "Pharaoh"                            );
    add("OSIRISReaper"                  , "Reaper"                             );
    add("Obituary_Bazookaman"           , "Bazooka Man"                        );
    add("Obituary_harderImp"            , "Super Imp"                          );
    add("Obituary_hitechguy"            , "Hi-Tech Guy"                        );
    add("POSTProp15"                    , "Coniferous Tree"                    );
    add("PlasmaElemental"               , "Plasma Elemental"                   );
    add("PlasmaZombie"                  , "Plasma Zombie"                      );
    add("PyroCannon"                    , "PyroCannon Prototype"               );
    add("QuickStrikeWeapon"             , "Quick Strike (Slot 1)"              );
    add("QuickStrikeWeaponS2"           , "Quick Strike (Slot 2)"              );
    add("QuickStrikeWeaponS3"           , "Quick Strike (Slot 3)"              );
    add("RLAbominantArtifactGuardian"   , "Abominant Guardian"                 );
    add("RLBruiserBrother"              , "Elder Bruiser Brother"              );
    add("RLBruiserBrother2"             , "Younger Bruiser Brother"            );
    add("RLCyberneticBaronofHellreborn" , "Techno-lord (Reborn)"               );
    add("RLCyberneticDemonReborn"       , "Mechdemon (Reborn)"                 );
    add("RLEliteHumanBattleRifle"       , "Elite Human (Rifle)"                );
    add("RLEliteHumanBattleRifle2"      , "Elite Human(Rifle, Alt)"            );
    add("RLEliteHumanCombatPistol"      , "Elite Human(C. Pistol)"             );
    add("RLEliteHumanHandCannon"        , "Elite Human(Handcannon)"            );
    add("RLEliteSergeantAssaultShotgun" , "Elite Sergeant(A.Shotgun)"          );
    add("RLEliteSergeantDoubleShotgun"  , "Elite Sergeant(D. Shotgun)"         );
    add("RLEliteSergeantPlasmaShotgun"  , "Elite Sergeant(P.Shotgun)"          );
    add("RLFormerCommandoBattleRifle"   , "Former Commando(Rifle)"             );
    add("RLFormerHumanBattleRifle"      , "Former Human (Rifle)"               );
    add("RLFormerHumanBattleRifle2"     , "Former Human (Rifle, Alt)"          );
    add("RLFormerHumanBattleRifle3"     , "Former Female Human"                );
    add("RLFormerHumanPistol"           , "Former Human (Pistol)"              );
    add("RLFormerSergeantCombatShotgun" , "Former Human Sergeant (C. Shotgun)" );
    add("RLIscream"                     , "Vanilla Ice Cream"                  );
    add("RLIscreamC"                    , "Chocolate Ice Cream"                );
    add("RLIscreamS"                    , "Strawberry Ice Cream"               );
    add("RLLostSoulAgony"               , "Agony Lost Soul"                    );
    add("RLLostSoulAgonyspawner"        , "Agonizing Lost Soul"                );
    add("RLLostSoulDeathAgonySpawner"   , "Agony Soul"                         );
    add("RLLostSoulNPE"                 , "Lost Soul (N. Elemental)"           );
    add("RLNightmareLostSoulNPE"        , "Nightmare Soul (Elemental)"         );
    add("RLNightmareRevenantReborn"     , "Nightmare Revenant (Reborn)"        );
    add("RailArachnotron"               , "Rail Arachnotron"                   );
    add("RapidFireTrooper"              , "Rapid Fire Zombie"                  );
    add("RapidVulcanWeapon"             , "Rapid Vulcan (Slot 1)"              );
    add("RapidVulcanWeaponS2"           , "Rapid Vulcan (Slot 2)"              );
    add("RapidVulcanWeaponS3"           , "Rapid Vulcan (Slot 3)"              );
    add("RepeaterWeapon"                , "Repeater (Slot 1)"                  );
    add("RepeaterWeaponS2"              , "Repeater (Slot 2)"                  );
    add("RepeaterWeaponS3"              , "Repeater (Slot 3)"                  );
    add("RocketGuy"                     , "Rocket Zombie"                      );
    add("RocketGuy2"                    , "Rocket Zombie"                      );
    add("SCI2_Scientistboss"            , "The Scientist (Boss)"               );
    add("SCI2_scientistbase"            , "The Scientist"                      );
    add("STDarkImp"                     , "Dark Imp"                           );
    add("STMinigun"                     , "Minigun"                            );
    add("ScrapLauncherWeapon"           , "Scrap Launcher (Slot 1)"            );
    add("ScrapLauncherWeaponS2"         , "Scrap Launcher (Slot 2)"            );
    add("ScrapLauncherWeaponS3"         , "Scrap Launcher (Slot 3)"            );
    add("ShotwaveWeapon"                , "Shotwave (Slot 1)"                  );
    add("ShotwaveWeaponS2"              , "Shotwave (Slot 2)"                  );
    add("ShotwaveWeaponS3"              , "Shotwave (Slot 3)"                  );
    add("SnakeImp"                      , "Snake Imp"                          );
    add("SniperCannonWeapon"            , "Sniper Cannon (Slot 1)"             );
    add("SniperCannonWeaponS2"          , "Sniper Cannon (Slot 2)"             );
    add("SniperCannonWeaponS3"          , "Sniper Cannon (Slot 3)"             );
    add("SoulHarvester"                 , "Soul Harvester"                     );
    add("SourceGuardians"               , "Source Guardians"                   );
    add("Spectrehellknight"             , "Spectral Knight"                    );
    add("Spectreimp"                    , "Spectral Imp"                       );
    add("SpitfireWeapon"                , "Spitfire (Slot 1)"                  );
    add("SpitfireWeaponS2"              , "Spitfire (Slot 2)"                  );
    add("SpitfireWeaponS3"              , "Spitfire (Slot 3)"                  );
    add("SpreadShotWeapon"              , "Spread Shot (Slot 1)"               );
    add("SpreadShotWeaponS2"            , "Spread Shot (Slot 2)"               );
    add("SpreadShotWeaponS3"            , "Spread Shot (Slot 3)"               );
    add("StoneImp"                      , "Stone Imp"                          );
    add("StormGrenadeWeapon"            , "Storm Grenade (Slot 1)"             );
    add("StormGrenadeWeaponS2"          , "Storm Grenade (Slot 2)"             );
    add("StormGrenadeWeaponS3"          , "Storm Grenade (Slot 3)"             );
    add("SuicideBomber"                 , "Suicide Bomber"                     );
    add("TNTEnhancedCaco"               , "EnhancedCaco"                       );
    add("TNTHellWarrior"                , "Hell Warrior"                       );
    add("TNTMiniSpider"                 , "Spider"                             );
    add("TNTSoulHarvester"              , "Soul Harvester"                     );
    add("TNTSpider"                     , "Giant Spider"                       );
    add("TTPEvilTrooper"                , "Evil Trooper"                       );
    add("TVRprop1"                      , "Chained Zombieman"                  );
    add("TheSource"                     , "The Source"                         );
    add("TorturedSoul"                  , "Tortured Soul"                      );
    add("TripleWyvernWeapon"            , "Triple Wyvern (Slot 1)"             );
    add("TripleWyvernWeaponS2"          , "Triple Wyvern (Slot 2)"             );
    add("TripleWyvernWeaponS3"          , "Triple Wyvern (Slot 3)"             );
    add("VampiricGauntletsWeapon"       , "Vampiric Gauntlets (Slot 1)"        );
    add("VampiricGauntletsWeaponS2"     , "Vampiric Gauntlets (Slot 2)"        );
    add("VampiricGauntletsWeaponS3"     , "Vampiric Gauntlets (Slot 3)"        );
    add("ViperWaveWeapon"               , "Viper Wave (Slot 1)"                );
    add("ViperWaveWeaponS2"             , "Viper Wave (Slot 2)"                );
    add("ViperWaveWeaponS3"             , "Viper Wave (Slot 3)"                );
    add("VoidDarkImp"                   , "Dark Imp"                           );
    add("VolleyShotWeapon"              , "Volley Shot (Slot 1)"               );
    add("VolleyShotWeaponS2"            , "Volley Shot (Slot 2)"               );
    add("VolleyShotWeaponS3"            , "Volley Shot (Slot 3)"               );
    add("WarlordOfHell"                 , "Warlord of Hell"                    );
    add("WingedReaverWeapon"            , "Winged Reaver (Slot 1)"             );
    add("WingedReaverWeaponS2"          , "Winged Reaver (Slot 2)"             );
    add("WingedReaverWeaponS3"          , "Winged Reaver (Slot 3)"             );
    add("ZombieMarine"                  , "Zombie Marine"                      );
    add("ZombieRailgunner"              , "Zombie Railgunner"                  );
    add("ZombieRailgunner30"            , "Zombie Railgunner"                  );
    add("ZombieRailgunner50"            , "Zombie Railgunner"                  );
    add("ZombieRailgunner70"            , "Zombie Railgunner"                  );
    add("allhellarachnotron"            , "Mounted Arachnotron"                );
    add("allhelldemon"                  , "Demon (on fire)"                    );
    add("allhellevilmarine"             , "Evil Marine"                        );
    add("allhellflyingbaron"            , "Flying Baron"                       );
    add("allhellhelicopter"             , "Attack Helicopter"                  );
    add("allhellhugecyber"              , "Huge Cyberdemon"                    );
    add("allhelltwoface"                , "Two headed Chaingunner"             );
    add("allhellwingeddemon1"           , "Winged Demon"                       );
    add("bfgtrooper"                    , "BFG Trooper"                        );
    add("hangedmario"                   , "It's a me, Mario!"                  );
    add("rebirthsnowman"                , "Evil Snowman"                       );
    add("talosmarine"                   , "Talos Marine"                       );
  }

  private
  void fillRekkrNames()
  {
    addRekkr( "Cacodemon"         , "Sorrow"                  );
    addRekkr( "Demon"             , "Husk"                    );
    addRekkr( "Spectre"           , "Mean Husk"               );
    addRekkr( "BaronOfHell"       , "Treebeast"               );
    addRekkr( "HellKnight"        , "Skelly Belly"            );
    addRekkr( "Zombieman"         , "Former Human"            );
    addRekkr( "ShotgunGuy"        , "Jackalope"               );
    addRekkr( "Archvile"          , "Turret"                  );
    addRekkr( "Revenant"          , "Mean Imp"                );
    addRekkr( "Fatso"             , "Former Duke"             );
    addRekkr( "ChaingunGuy"       , "Former King"             );
    addRekkr( "Chaingun"          , "Former King"             );
    addRekkr( "LostSoul"          , "Eyeball"                 );
    addRekkr( "SpiderMastermind"  , "Dark Foe"                );
    addRekkr( "Cyberdemon"        , "Dark Foe"                );
    addRekkr( "Arachnotron"       , "Mean Jackalope"          );
    addRekkr( "WolfensteinSS"     , "Grotesque"               );
    addRekkr( "DoomImp"           , "Imp"                     );
    addRekkr( "HangNoGuts"        , "Spider"                  );
    addRekkr( "DehackedPickup4"   , "Soul Launcher"           );
    addRekkr( "DeadShotgunGuy"    , "Remains of Grotesque"    );
    addRekkr( "DeadZombieMan"     , "Remains of Former Human" );
    addRekkr( "DeadDemon"         , "Remains of Husk"         );
    addRekkr( "DeadCacodemon"     , "Remains of Sorrow"       );
    addRekkr( "GibbedMarineExtra" , "Remains of Viking"       );
    addRekkr( "GibbedMarine"      , "Remains of Viking"       );
    addRekkr( "HeadsOnAStick"     , "Tree"                    );
    addRekkr( "CommanderKeen"     , "Bottled Health"          );
    addRekkr( "DehackedPickup14"  , "Platemail Armor"         );
    addRekkr( "DehackedPickup13"  , "Ringmail Armor"          );
    addRekkr( "DehackedPickup16"  , "Health Essence"          );
    addRekkr( "Medikit"           , "Bottled Health"          );
    addRekkr( "DehackedPickup15"  , "Medicinal Herb"          );
    addRekkr( "ArmorBonus"        , "Armor Patch"             );
    addRekkr( "Backpack"          , "Sack of Carrying"        );
    addRekkr( "DehackedPickup12"  , "Mana Seal"               );
    addRekkr( "DehackedPickup0"   , "Mana Sprite"             );
    addRekkr( "RocketBox"         , "Stack of Runes"          );
    addRekkr( "RocketAmmo"        , "Rune"                    );
    addRekkr( "ShellBox"          , "Sack of Steelshot"       );
    addRekkr( "Shell"             , "Steelshot"               );
    addRekkr( "ClipBox"           , "Soul Prism"              );
    addRekkr( "Berserk"           , "WODE"                    );
    addRekkr( "Allmap"            , "Map of the Area"         );
    addRekkr( "RadSuit"           , "Boots of Protection"     );
    addRekkr( "DehackedPickup17"  , "Shamans Brew"            );
    addRekkr( "DehackedPickup18"  , "Ethereal Guard"          );
    addRekkr( "DehackedPickup19"  , "Cloak of deceit"         );
    addRekkr( "DehackedPickup20"  , "Torch"                   );
    addRekkr( "DehackedPickup21"  , "Soul"                    );
    addRekkr( "DeadMarine"        , "Dead Body"               );
    addRekkr( "DeadLostSoul"      , "Remains of Eyeball"      );
    addRekkr( "LiveStick"         , "Puppy"                   );
    addRekkr( "HeadOnAStick"      , "Grass"                   );
    addRekkr( "Gibs"              , "Blood"                   );
    addRekkr( "DehackedPickup5"   , "Soul"                    );
    addRekkr( "DeadStick"         , "Dead Body"               );
    addRekkr( "RedCard"           , "Red Key"                 );
    addRekkr( "BlueCard"          , "Blue Key"                );
    addRekkr( "YellowCard"        , "Yellow Key"              );
    addRekkr( "ExplosiveBarrel"   , "Barrel"                  );
    addRekkr( "RedSkull"          , "Red Skeleton Key"        );
    addRekkr( "BlueSkull"         , "Blue Skeleton Key"       );
    addRekkr( "YellowSkull"       , "Yellow Skeleton Key"     );
    addRekkr( "DehackedPickup11"  , "Blessing of the Gods"    );
    addRekkr( "DehackedPickup10"  , "Holy Relic"              );
    addRekkr( "DehackedPickup8"   , "Runic Staff"             );
    addRekkr( "DehackedPickup9"   , "Axe"                     );
    addRekkr( "NonsolidTwitch"    , "Bell"                    );
    addRekkr( "HeartColumn"       , "Viking"                  );
    addRekkr( "HangTLookingUp"    , "Hanging Body"            );
    addRekkr( "SmallBloodPool"    , "Hanging Body"            );

    addRekkr("Chainsaw"       , "Axe"                  );
    addRekkr("Fist"           , "Fists"                );
    addRekkr("Pistol"         , "Soul Bow"             );
    addRekkr("Shotgun"        , "Steelshot Launcher"   );
    addRekkr("Chaingun"       , "Soul Launcher"        );
    addRekkr("RocketLauncher" , "Runic Staff"          );
    addRekkr("PlasmaRifle"    , "Holy Relic"           );
    addRekkr("BFG9000"        , "Blessing of the Gods" );
  }

  private
  void fillFreedoomNames()
  {
    addFree( "Arachnotron"      , "Technospider"             );
    addFree( "Archvile"         , "Flame Bringer"            );
    addFree( "BaronOfHell"      , "Pain Lord"                );
    addFree( "Cacodemon"        , "Trilobite"                );
    addFree( "ChaingunGuy"      , "Minigun Zombie"           );
    addFree( "CommanderKeen"    , "Alien Spawn"              );
    addFree( "Cyberdemon"       , "Assault Tripod"           );
    addFree( "Demon"            , "Flesh Worm"               );
    addFree( "DoomImp"          , "Serpentipede"             );
    addFree( "Fatso"            , "Combat Slug"              );
    addFree( "LostSoul"         , "Deadflare"                );
    addFree( "PainElemental"    , "Summoner"                 );
    addFree( "Revenant"         , "Dark Soldier"             );
    addFree( "ShotgunGuy"       , "Shotgun Zombie"           );
    addFree( "SpiderMastermind" , "Large Technospider"       );
    addFree( "WolfensteinSS"    , "Sailor"                   );
    addFree( "Zombieman"        , "Zombie"                   );

    addFree( "Chainsaw"         , "Angle Grinder"            );
    addFree( "Fist"             , "Fists"                    );
    addFree( "Pistol"           , "Handgun"                  );
    addFree( "SuperShotgun"     , "Double-barrelled Shotgun" );
    addFree( "Shotgun"          , "Pump-action Shotgun"      );
    addFree( "Chaingun"         , "Minigun"                  );
    addFree( "RocketLauncher"   , "Missile Launcher"         );
    addFree( "PlasmaRifle"      , "Polaric Energy Cannon"    );
    addFree( "BFG9000"          , "SKAG 1337"                );
  }

  private Dictionary mNames;
  private Dictionary mRekkrNames;
  private Dictionary mFreedoomNames;

} // class na_EventHandler
