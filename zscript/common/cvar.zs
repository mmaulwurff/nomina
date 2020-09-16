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
  na_Cvar from(String name, PlayerInfo player = NULL)
  {
    let result = new("na_Cvar");

    result._player = player;
    result._name   = name;
    result._cvar   = NULL;

    result.load();

    return result;
  }

  String getString() { load(); return _cvar.GetString(); }
  bool   getBool()   { load(); return _cvar.GetInt();    }
  int    getInt()    { load(); return _cvar.GetInt();    }
  double getDouble() { load(); return _cvar.GetFloat();  }

  void setString(String value) { load(); _cvar.SetString(value); }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private
  void load()
  {
    if (isLoaded()) return;

    _cvar = Cvar.GetCvar(_name, _player);

    if (!isLoaded())
    {
      na_Log.error(string.format("cvar %s not found", _name));
    }
  }

  private
  bool isLoaded() const
  {
    return (_cvar != NULL);
  }

  private PlayerInfo     _player;
  private String         _name;
  private transient Cvar _cvar;

} // class na_cvar
