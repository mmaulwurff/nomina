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
 * This class provides the player's current selected weapon.
 */
class na_WeaponWatcher : na_Watcher
{

// public: /////////////////////////////////////////////////////////////////////////////////////////

  static
  na_WeaponWatcher from(PlayerInfo player)
  {
    let result = new("na_WeaponWatcher");
    result.mPlayer = player;
    result.mWeapon = NULL;
    return result;
  }

  override
  void watch()
  {
    Actor weapon = Actor(mPlayer.ReadyWeapon);
    if (weapon != NULL)
    {
      mWeapon = weapon;
    }
  }

  override
  Actor getWatched() const
  {
    return mWeapon;
  }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private PlayerInfo mPlayer;
  private Actor      mWeapon;

} // class na_WeaponWatcher
