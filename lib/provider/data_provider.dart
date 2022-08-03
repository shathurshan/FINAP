import 'package:finap_test/DB/user_database.dart';
import 'package:finap_test/models/user.dart';
import 'package:flutter/cupertino.dart';

class DataProvider with ChangeNotifier {
  void addUser(Users users) {
    DBHelper.insertUsers(
      'users',
      {
        'id': users.id,
        'userId': users.userId,
        'email': users.email,
        'password': users.password,
      },
    );
    notifyListeners();
  }
}
