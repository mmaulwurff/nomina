# Nomina

An addon that adds custom names (tags) to a selection of custom Doom monsters
and weapons.

In a perfect world, mod authors add tags to their custom classes. Currently,
there are a lot of mods that lack name definitions. In this case, the engine
falls back to class name. This addon tries to fix this by providing a database
of custom names.

## How to use

* For some mods, *nomina* will just work. Examples: NC HUD.
* For some mods, *nomina* must be loaded before them.
* For some mods (specifically, that get tags from GetDefaultByType result),
  *nomina* won't work of of the box. Examples: War Trophies. These mods can be
  modified to utilize *nomina* using this code:

```
play
bool, String getCustomName(String className) const
{
  String nominaName = "NominaAPI";
  class<Actor> nominaClass = nominaName;

  if (nominaClass == NULL)
  {
    return false, "";
  }

  let    nominaAPI  = getDefaultByType(nominaClass);
  String customName = nominaAPI.getObituary(NULL, NULL, className, false);
  bool   nameExists = (customName.length() != 0);

  return nameExists, customName;
}
```

This code will return a name provided by *nomina* if it's loaded, and return
`false` otherwise.


## Supported names

* The Ultimate Torment & Torture
* DoomRL Arsenal
* Bullet-Eye
* Compendium
* REKKR
* Freedoom
* The Adventures of Square (Episodes 1 & 2)

## Name Sources

* War Trophies (Accensus, Tapwave)
* Target Spy (m8f)


## Thanks

* Proydoha for Freedoom corrections
