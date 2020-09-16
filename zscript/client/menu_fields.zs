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

class na_MenuFields
{

// public: /////////////////////////////////////////////////////////////////////////////////////////

  static
  na_MenuFields from(na_Cvar enemyNameCvar, na_Cvar weaponNameCvar)
  {
    let result = new("na_MenuFields");
    result.mEnemyNameCvar  = enemyNameCvar;
    result.mWeaponNameCvar = weaponNameCvar;
    return result;
  }

  void setEnemyName(string name)
  {
    mEnemyNameCvar.setString(name);
  }

  void setWeaponName(string name)
  {
    mWeaponNameCvar.setString(name);
  }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private na_Cvar mEnemyNameCvar;
  private na_Cvar mWeaponNameCvar;

} // class na_MenuFields
