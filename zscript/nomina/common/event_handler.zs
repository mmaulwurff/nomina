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

class Nomina : EventHandler
{

// public: /////////////////////////////////////////////////////////////////////////////////////////

  override
  void playerEntered(PlayerEvent event)
  {
    if (mServer == NULL)
    {
      mMenu = na_MenuFields.from( na_Cvar.from("na_aimed_enemy_name")
                                , na_Cvar.from("na_selected_weapon_name")
                                );
      mServer = na_Server.from(mMenu);
    }

    mServer.addPlayer(event.playerNumber);

    if (event.playerNumber == consolePlayer)
    {
      mClient = na_Client.from(mMenu);
    }
  }

  override
  void worldTick()
  {
    mServer.tick();
    mClient.tick();
  }

  override
  void networkProcess(ConsoleEvent event)
  {
    mServer.onNetworkProcess(event.name, event.player);
  }

  override
  void worldThingSpawned(WorldEvent event)
  {
    if (event.thing == NULL) return;

    mServer.onThingSpawned(event.thing);
  }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private na_Server mServer;
  private na_Client mClient;
  private na_MenuFields mMenu;

} // class Nomina
