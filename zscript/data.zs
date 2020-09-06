class na_Data
{

// public: /////////////////////////////////////////////////////////////////////////////////////////

  static
  na_Data fromJson(String path)
  {
    let result = new("na_Data");
    result.mNames = Dictionary.FromString(Wads.ReadLump(Wads.CheckNumForFullName(path)));

    if (DictionaryIterator.Create(result.mNames).Next() == false)
    {
      Console.Printf("[ERROR] Nomina: no data in %s.", path);
    }

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

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private Dictionary mNames;

} // class na_Data
