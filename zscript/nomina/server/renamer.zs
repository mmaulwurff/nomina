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
 * This class handles renaming.
 */
class na_Renamer play
{

// public: /////////////////////////////////////////////////////////////////////////////////////////

  static
  void renameClass(Class<Actor> classToRename, string newName)
  {
    let i = ThinkerIterator.Create(classToRename);
    Actor a;
    while (a = Actor(i.next()))
    {
      a.setTag(newName);
    }
  }

  static
  void resetClass(Class<Actor> classToReset)
  {
    string defaultName = getDefaultByType(classToReset).getTag();
    renameClass(classToReset, defaultName);
  }

  static
  void renameInstance(Actor instance, string newName)
  {
    if (instance == NULL) return;

    instance.setTag(newName);
  }

  static
  void resetInstance(Actor instance)
  {
    if (instance == NULL) return;

    instance.setTag(getDefaultName(instance));
  }

  static
  string getDefaultName(Actor instance)
  {
    return getDefaultByType(instance.getClass()).getTag();
  }

} // class na_Renamer
