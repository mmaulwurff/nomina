class na_Data
{

  static
  na_Data of()
  {
    let result = new("na_Data");
    result.mNames = Dictionary.Create();
    return result;
  }

  static
  na_Data ofCvar(na_Cvar cvar)
  {
    let result = new("na_Data");
    result.mNames = Dictionary.fromString(cvar.getString());
    return result;
  }

  void add(String key, String value)
  {
    mNames.insert(key, value);
  }

  String at(String key)
  {
    return mNames.at(key);
  }

  void saveTo(na_Cvar cvar)
  {
    cvar.setString(mNames.toString());
  }

  private Dictionary mNames;

} // class na_Data
