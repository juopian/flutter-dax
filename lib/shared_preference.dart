import 'package:shared_preferences/shared_preferences.dart';
import 'package:dax/dax.dart';

class ISharedPreferences implements LoxGetCallable{
  @override
  Object? get(Token name) {
    switch(name.lexeme){
      case 'getInstance':
        return SharedPreferencesBuilder();  
    }
  }
}

class SharedPreferencesBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return SharedPreferences.getInstance().then((prefs){
      return SharedPreferenceIns(prefs);
    });
  }
}

class SharedPreferenceIns implements  LoxGetCallable {
  late final SharedPreferences _sharedPreferences;
  SharedPreferenceIns(this._sharedPreferences);
  @override
  Object? get(Token name) {
     switch(name.lexeme){
       case 'clear':
         return _sharedPreferences.clear;
       case 'containsKey':
         return _sharedPreferences.containsKey;
       case 'get':
         return _sharedPreferences.get;
       case 'getBool':
        return _sharedPreferences.getBool;
       case 'getDouble':
        return _sharedPreferences.getDouble;
       case 'getInt':
        return _sharedPreferences.getInt;
       case 'getKeys':
        return _sharedPreferences.getKeys;
       case 'getString':
        return _sharedPreferences.getString;
       case 'getStringList':
        return _sharedPreferences.getStringList;
       case 'reload':
        return _sharedPreferences.reload;
       case 'setInt':
        return _sharedPreferences.setInt;
       case 'setString':
        return _sharedPreferences.setString;
       case'setStringList':
        return _sharedPreferences.setStringList;
     }
  }
}