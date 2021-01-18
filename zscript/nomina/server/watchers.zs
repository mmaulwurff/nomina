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

class na_Watchers play
{

// public: /////////////////////////////////////////////////////////////////////////////////////////

  static
  na_Watchers from()
  {
    let result = new("na_Watchers");
    for (uint i = 0; i < MAXPLAYERS; ++i)
    {
      result.mWatchers[i] = NULL;
    }
    return result;
  }

  void watch()
  {
    for (uint i = 0; i < MAXPLAYERS; ++i)
    {
      if (mWatchers[i] != NULL)
      {
        mWatchers[i].watch();
      }
    }
  }

  void addWatcher(int playerNumber, na_Watcher watcher)
  {
    mWatchers[playerNumber] = watcher;
  }

  na_Watcher of(int playerNumber) const
  {
    return mWatchers[playerNumber];
  }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private na_Watcher mWatchers[MAXPLAYERS];

} // class na_Watchers
