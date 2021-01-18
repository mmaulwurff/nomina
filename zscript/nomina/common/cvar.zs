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
 * This class provides access to a user or server Cvar.
 *
 * Accessing Cvars through this class is faster because calling Cvar.GetCvar()
 * is costly. This class caches the result of Cvar.GetCvar() and handles
 * loading a savegame.
 */
class na_Cvar
{

// public: /////////////////////////////////////////////////////////////////////////////////////////

  static
  na_Cvar from(String name)
  {
    let result = new("na_Cvar");

    result.mPlayer = players[consolePlayer];
    result.mName   = name;
    result.mCvar   = NULL;

    result.load();

    return result;
  }

  String getString() { load(); return mCvar.GetString(); }
  bool   getBool()   { load(); return mCvar.GetInt();    }
  int    getInt()    { load(); return mCvar.GetInt();    }
  double getDouble() { load(); return mCvar.GetFloat();  }

  void setString(String value) { load(); mCvar.SetString(value); }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private
  void load()
  {
    if (isLoaded()) return;

    mCvar = Cvar.GetCvar(mName, mPlayer);

    if (!isLoaded())
    {
      na_Log.error(string.format("cvar %s not found", mName));
    }
  }

  private
  bool isLoaded() const
  {
    return (mCvar != NULL);
  }

  private PlayerInfo     mPlayer;
  private String         mName;
  private transient Cvar mCvar;

} // class na_Cvar
