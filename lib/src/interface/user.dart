
import 'dart:io';

class User{

  User();

  static String defaultUser = 'defaultUser';
  static String defaultDisplayName = '';

  static User getDefault() => User()
    ..displayName = defaultDisplayName
    ..id = defaultUser;

  String id;
  String displayName;
  File image;


}