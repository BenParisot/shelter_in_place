import 'dart:async';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  var currentUser;

  Future getUser() {
    return Future.value(currentUser);
  }

  /**
   * ADD FIREBASE
   *  1. Firebase for Flutter
   * https://codelabs.developers.google.com/codelabs/flutter-firebase/index.html?index=..%2F..index#5
   *  2. Finish intergration in the project as described in
   * https://dev.to/aaronksaunders/simple-firebase-login-flow-in-flutter-now-firebase-23nk
   */
  // wrapping the firebase calls
  Future logout() {
    this.currentUser = null;
    notifyListeners();
    return Future.value(currentUser);
  }

  // wrapping the firebase calls
  Future createUser(
      {String firstName,
        String lastName,
        String email,
        String password}) async {}

  // TODO just temporary :D
  Future loginUser({String email, String password}) {
    if (password == 'password123') {
      this.currentUser = {'email': email};
      notifyListeners();
      return Future.value(currentUser);
    } else {
      this.currentUser = null;
      return Future.value(null);
    }
  }
}
