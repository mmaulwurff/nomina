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
 * This class watches for player's enemies and weapons and updates the menu.
 */
class na_Client play
{

// public: /////////////////////////////////////////////////////////////////////////////////////////

  static
  na_Client from()
  {
    let result = new("na_Client");

    PlayerInfo player = players[consolePlayer];
    result.mEnemyWatcher  = na_EnemyWatcher.from(player);
    result.mWeaponWatcher = na_WeaponWatcher.from(player);
    result.mMenu          = na_MenuFields.from( na_Cvar.from("na_aimed_enemy_name"     , player)
                                              , na_Cvar.from("na_selected_weapon_name" , player)
                                              );

    result.mMenu.setEnemyName("");
    result.mMenu.setWeaponName("");

    return result;
  }

  void tick()
  {
    // In netplay, opening the menu doesn't stop the world. Don't call watchers then.
    if (menuactive) return;

    mEnemyWatcher.watch();
    if (mEnemyWatcher.getWatched() != NULL)
    {
      mMenu.setEnemyName(mEnemyWatcher.getWatched().getTag());
    }

    mWeaponWatcher.watch();
    if (mWeaponWatcher.getWatched() != NULL)
    {
      mMenu.setWeaponName(mWeaponWatcher.getWatched().getTag());
    }
  }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private na_Watcher    mEnemyWatcher;
  private na_Watcher    mWeaponWatcher;
  private na_MenuFields mMenu;

} // class na_Client
