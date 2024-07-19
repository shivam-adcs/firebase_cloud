import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Shared_Preferences_Service {

//   static final Shared_Preferences_Service _instance=Shared_Preferences_Service._internal();
//   factory Shared_Preferences_Service(){
//     return _instance;
//   }

//   Shared_Preferences_Service._internal(){setPreferenceVariable();}

// late final prefs;
//   void setPreferenceVariable() async{
//     prefs=await SharedPreferences.getInstance();
//   }
  
  late var user_data;
  Future<dynamic> setUserData(String data) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user_data", data);
    return true;
  }
  
  Future<dynamic> getUserData() async{
    final prefs= await SharedPreferences.getInstance();
    user_data=prefs.getString("user_data");
    user_data=jsonDecode(user_data);
    return true;
  }
}

final Shared_Preferences_Service prefs=Shared_Preferences_Service();