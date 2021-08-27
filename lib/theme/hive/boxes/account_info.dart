import 'package:hive_flutter/hive_flutter.dart';

class AccountInfo {
  static void loadInboxes() async {
    Box<_Account> box = await Hive.openBox<_Account>('accountInfo');

    box.values.forEach((element) {
      print(element);
    });
  }

  static void createAccount(
      String nickname, String token, String refreshToken) async {
    Box<_Account> box = await Hive.openBox<_Account>('accountInfo');

    box.add(
      _Account(
        nickname: nickname,
        token: token,
        refreshToken: refreshToken,
      ),
    );
  }
}

class _Account {
  String nickname;
  String token;
  String refreshToken;

  _Account({
    required this.nickname,
    required this.token,
    required this.refreshToken,
  });
}
