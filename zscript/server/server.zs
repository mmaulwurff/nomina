/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2020
 *
 * This file is a part of Nomina.
 *
 * Nomina is free software: you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 *
 * Nomina is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Nomina.  If not, see <https://www.gnu.org/licenses/>.
 */

/**
 * This class listens for Nomina netevents and reacts to them.
 */
class na_Server play
{

// public: /////////////////////////////////////////////////////////////////////////////////////////

  static
  na_Server from()
  {
    let result = new("na_Server");

    PlayerInfo mainPlayer  = players[consolePlayer];
    result.mWeaponWatchers = na_Watchers.from();
    result.mEnemyWatchers  = na_Watchers.from();
    result.mStorage        = na_Storage.from(na_Cvar.from("na_user_defined_names", mainPlayer));

    return result;
  }

  void addPlayer(int playerNumber)
  {
    PlayerInfo player = players[playerNumber];
    mWeaponWatchers.addWatcher(playerNumber, na_WeaponWatcher.from(player));
    mEnemyWatchers .addWatcher(playerNumber, na_EnemyWatcher .from(player));
  }

  void tick()
  {
    mWeaponWatchers.watch();
    mEnemyWatchers .watch();
  }

  void onNetworkProcess(string netevent, int playerNumber)
  {
    int    command;
    string newName;
    [command, newName] = na_NeteventParser.parse(netevent);

    switch (command)
    {
    case na_CommandRenameWeaponInstance  : renameWeaponInstance(playerNumber, newName); break;
    case na_CommandRenameWeaponClass     : renameWeaponClass   (playerNumber, newName); break;
    case na_CommandRenameEnemyInstance   : renameEnemyInstance (playerNumber, newName); break;
    case na_CommandRenameEnemyClass      : renameEnemyClass    (playerNumber, newName); break;

    case na_CommandResetWeaponInstance   : resetWeaponInstance (playerNumber); break;
    case na_CommandResetWeaponClass      : resetWeaponClass    (playerNumber); break;
    case na_CommandResetEnemyInstance    : resetEnemyInstance  (playerNumber); break;
    case na_CommandResetEnemyClass       : resetEnemyClass     (playerNumber); break;

    case na_CommandClearUserDefinedNames : clearUserDefinedNames(); break;
    }
  }

  void onThingSpawned(Actor thing)
  {
    string storedName = mStorage.getName(thing.getClassName());
    if (storedName != "")
    {
      na_Renamer.renameInstance(thing, storedName);
    }
  }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private
  void renameClass(Actor instance, string newName)
  {
    if (instance == NULL) return;

    mStorage.setName(instance.getClassName(), newName);
    na_Renamer.renameClass(instance.getClass(), newName);
  }

  private
  void renameWeaponInstance(int playerNumber, string newName)
  {
    na_Renamer.renameInstance(mWeaponWatchers.of(playerNumber).getWatched(), newName);
    na_Log.message(string.format("renamed current weapon to %s", newName));
  }

  private
  void renameWeaponClass(int playerNumber, string newName)
  {
    renameClass(mWeaponWatchers.of(playerNumber).getWatched(), newName);
    na_Log.message(string.format("renamed current weapon class to %s", newName));
  }

  private
  void renameEnemyInstance(int playerNumber, string newName)
  {
    na_Renamer.renameInstance(mEnemyWatchers.of(playerNumber).getWatched(), newName);
    na_Log.message(string.format("renamed aimed enemy to %s", newName));
  }

  private
  void renameEnemyClass(int playerNumber, string newName)
  {
    renameClass(mEnemyWatchers.of(playerNumber).getWatched(), newName);
    na_Log.message(string.format("renamed aimed enemy class to %s", newName));
  }

  private
  void resetClass(Actor instance)
  {
    if (instance == NULL) return;

    mStorage.setName(instance.getClassName(), na_Renamer.getDefaultName(instance));
    na_Renamer.resetClass(instance.getClass());
  }

  private
  void resetWeaponInstance(int playerNumber)
  {
    na_Renamer.resetInstance(mWeaponWatchers.of(playerNumber).getWatched());
    na_Log.message("reset current weapon name");
  }

  private
  void resetWeaponClass(int playerNumber)
  {
    resetClass(mWeaponWatchers.of(playerNumber).getWatched());
    na_Log.message("reset current weapon class name");
  }

  private
  void resetEnemyInstance(int playerNumber)
  {
    na_Renamer.resetInstance(mEnemyWatchers.of(playerNumber).getWatched());
    na_Log.message("reset aimed enemy name");
  }

  private
  void resetEnemyClass(int playerNumber)
  {
    resetClass(mEnemyWatchers.of(playerNumber).getWatched());
    na_Log.message("reset aimed enemy class name");
  }

  private
  void clearUserDefinedNames()
  {
    mStorage.clearUserDefinedNames();

    uint nActorClasses = allActorClasses.size();
    for (uint i = 0; i < nActorClasses; ++i)
    {
      Class<Actor> actorClass = allActorClasses[i];
      na_Renamer.renameClass(actorClass, getDefaultByType(actorClass).getTag());
    }

    na_Log.message("reset all user-defined names");
  }

  private na_Watchers mWeaponWatchers;
  private na_Watchers mEnemyWatchers;
  private na_Storage  mStorage;

} // class na_Server
