class NominaAPI : Actor
{

  override
  String getObituary(Actor dummy1, Actor dummy2, Name className, bool dummy3)
  {
    let    nominaInstance = Nomina(EventHandler.Find("nomina"));
    bool   nameExists;
    String name;
    [nameExists, name] = nominaInstance.getName(className);

    return name;
  }

} // class NominaAPI
