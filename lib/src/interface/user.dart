
import 'dart:io';

class User{

  static String defaultUser = 'defaultUser';
  static String defaultDisplayName = '';

  UserStatus status = UserStatus.browsing;

  static User getDefault() => User()
    ..displayName = defaultDisplayName
    ..id = defaultUser;

  String id;
  String displayName;
  File image;

}

enum UserStatus{
  browsing,
  disconnected,
  waitingToJoin,
  thinking,
  waitingToGo,
  observing
}