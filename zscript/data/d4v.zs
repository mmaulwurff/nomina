extend class Nomina
{

  private static
  na_Data fillD4VNames()
  {
    let d = na_Data.of();

    // monsters
    // (the rest have original names)
    d.add( "CommanderKeen"       , "Imp"               ); // Why?
    d.add( "Revenant"            , "Mancubus"          ); // Why?
    d.add( "Fatso"               , "Revenant"          ); // Why?
    d.add( "Arachnotron"         , "Spider Mastermind" ); // Why?
    d.add( "Archvile"            , "Summoner"          );
    d.add( "DH_Demon"            , "Pinky"             );
    d.add( "DH_ChaingunGuy"      , "Hell Razer"        );
    d.add( "ShotgunGuy"          , "Security"          );
    d.add( "Zombieman"           , "Possessed"         );
    d.add( "PainElemental"       , "Gore Nest"         );
    d.add( "Cyberdemon"          , "Cyber-Mancubus"    ); // Why?
    d.add( "DH_SpiderMastermind" , "Cyberdemon"        ); // WHY?

    return d;
  }

} // extend class Nomina
