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

enum na_Commands
{

  na_CommandUndefined = 0,
  na_CommandNothing,
  na_CommandRenameWeaponInstance,
  na_CommandRenameWeaponClass,
  na_CommandRenameEnemyInstance,
  na_CommandRenameEnemyClass,
  na_CommandClearUserDefinedNames,

} // enum na_Commands

/**
 * This class parses Nomina-related netevents.
 */
class na_NeteventParser
{

// public: /////////////////////////////////////////////////////////////////////////////////////////

  /**
   * @returns the command and the new name.
   */
  static
  int, string parse(String netevent)
  {
    Array<string> args;
    netevent.split(args, ":");

    if (args[0] == "na_rename_weapon_instance"  ) return na_CommandRenameWeaponInstance  , args[1];
    if (args[0] == "na_rename_weapon_class"     ) return na_CommandRenameWeaponClass     , args[1];
    if (args[0] == "na_rename_enemy_instance"   ) return na_CommandRenameEnemyInstance   , args[1];
    if (args[0] == "na_rename_enemy_class"      ) return na_CommandRenameEnemyClass      , args[1];
    if (args[0] == "na_clear_user_defined_names") return na_CommandClearUserDefinedNames , "";

    return na_CommandNothing, "";
  }

} // class na_NeteventParser
