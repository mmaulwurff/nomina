version 4.3

class na_EventHandler : EventHandler
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void onRegister()
  {
    console.printf("hello");
  }

  override
  void worldThingSpawned(WorldEvent event)
  {
    console.printf("event");
  }

} // class na_EventHandler
