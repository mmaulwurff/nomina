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
 * This class stores predefined and user-defined custom names.
 */
class na_Storage
{

// public: /////////////////////////////////////////////////////////////////////////////////////////

  static
  na_Storage from(na_Cvar userDefinedNamesCvar)
  {
    let result = new("na_Storage");
    result.mUserDefinedNamesCvar = userDefinedNamesCvar;
    result.mPredefinedNames      = loadPredefinedNames();
    return result;
  }

  string getName(string aClass) const
  {
    String userDefinedName = loadUserDefinedNames().at(aClass);
    if (userDefinedName != "") return userDefinedName;

    String predefinedName = mPredefinedNames.at(aClass);
    if (predefinedName != "") return predefinedName;

    return "";
  }

  void setName(string aClass, string name)
  {
    Dictionary nameDictionary = loadUserDefinedNames();
    nameDictionary.insert(aClass, name);
    mUserDefinedNamesCvar.setString(nameDictionary.toString());
  }

  void clearUserDefinedNames()
  {
    mUserDefinedNamesCvar.setString("");
  }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private
  Dictionary loadUserDefinedNames() const
  {
    return Dictionary.fromString(mUserDefinedNamesCvar.getString());
  }

  private static
  Dictionary loadPredefinedNames()
  {
    bool isD4V = ((Class<Object>)(string.format("D4V_Shotgun")) != NULL);
    if (isD4V) return fromJson("data/d4v.json");

    bool isRekkr = (Wads.findLump("REKCREDS") != -1);
    if (isRekkr) return fromJson("data/rekkr.json");

    bool isFreedoom = (Wads.findLump("FREEDOOM") != -1);
    if (isFreedoom) return fromJson("data/freedoom.json");

    return fromJson("data/normal.json");
  }

  private static
  Dictionary fromJson(string path)
  {
    let result = Dictionary.FromString(Wads.ReadLump(Wads.CheckNumForFullName(path)));

    if (DictionaryIterator.Create(result).Next() == false)
    {
      na_Log.error(string.format("no data in %s", path));
    }

    return result;
  }

  private na_Cvar    mUserDefinedNamesCvar;
  private Dictionary mPredefinedNames;

} // class na_Storage
