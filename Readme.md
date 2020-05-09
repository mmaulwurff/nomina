# Nomina

An addon that adds custom names (tags) to a selection of custom Doom monsters.

In a perfect world, mod authors add tags to their custom monsters. Currently,
there are a lot of mods that lack name definitions. In this case, the engine
falls back to class name. This addon tries to fix this by providing a database
of custom names.

## How to use

* For some mods, *nomina* will just work.
* For some mods, *nomina* must be loaded before them.
* For some mods (specifically, that get tags from GetDefaultByType result),
  *nomina* won't work of of the box. These mods can be modified to utilize
  *nomina* using this code:

```
bool, String getCustomName(String className)
{
  let nominaInstance = Nomina(EventHandler.Find("nomina"));

  if (nominaInstance == NULL)
  {
    return false, "";
  }

  bool nameExists;
  String name;

  [nameExists, name] = nominaInstance.getName(className);

  return nameExists, name;
}
```

This code will return a name provided by *nomina* if it's loaded, and return
`false` otherwise.


## Supported names

* The Ultimate Torment & Torture
* DoomRL Arsenal
* Bullet-Eye
* Compendium

## Name Sources

* War Trophies (Accensus, Tapwave)
