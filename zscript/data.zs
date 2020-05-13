class na_Data
{

  static
  na_Data of()
  {
    let result = new("na_Data");
    result.mNames = Dictionary.Create();
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

  private Dictionary mNames;

} // class na_Data
