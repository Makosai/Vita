import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AccountInfo {
  static void loadInboxes() async {
    Box<Account> box = await Hive.openBox<Account>('accountInfo');

    box.values.forEach((element) {
      print(element);
    });
  }

  static Future<List<String>> getAccountNames() async {
    Box<Account> box = await Hive.openBox<Account>('accountInfo');

    return box.values.map((account) => account.email).toList();
  }

  static void createEmailAccount(
    String email,
    String password,
  ) async {
    Box<Account> box = await Hive.openBox<Account>('accountInfo');

    box.add(
      EmailAccount(
        email: email,
        password: password,
      ),
    );
  }

  static void createGoogleAccount(
    String email,
    AccessToken? accessToken,
    String? refreshToken,
    String? idToken,
  ) async {
    Box<Account> box = await Hive.openBox<Account>('accountInfo');

    box.add(
      GoogleAccount(
        email: email,
        accessToken: accessToken,
        refreshToken: refreshToken,
        idToken: idToken,
      ),
    );
    print("Added an account");
  }
}

@HiveType(typeId: 10)
enum AccountType {
  @HiveField(0)
  Email,
  @HiveField(1)
  Google,
}

abstract class Account extends HiveObject {
  String email;
  AccountType type;

  Account({
    required this.email,
    required this.type,
  });
}

@HiveType(typeId: 1)
class EmailAccount extends Account {
  @HiveField(2)
  String
      password; // TODO: Store the password for email accounts in an encrypted format
  //  just so anything reading it will have to go an extra step to decrypt
  //  it to actually get the password.

  EmailAccount.fromAccount(EmailAccount account)
      : password = account.password,
        super(email: account.email, type: AccountType.Email);

  EmailAccount({
    required String email,
    required this.password,
  }) : super(email: email, type: AccountType.Email);
}

class EmailAccountAdapter extends TypeAdapter<EmailAccount> {
  @override
  final typeId = 1;

  @override
  EmailAccount read(BinaryReader reader) {
    return EmailAccount.fromAccount(reader.read());
  }

  @override
  void write(BinaryWriter writer, EmailAccount obj) {
    writer.write(obj.email);
    writer.write(obj.password);
    writer.write(obj.type);
  }
}

class GoogleAccount extends Account {
  AccessToken? accessToken;
  String? refreshToken;
  String? idToken;

  GoogleAccount.fromAccount(GoogleAccount account)
      : super(email: account.email, type: AccountType.Email) {
    this.accessToken = account.accessToken;
    this.refreshToken = account.refreshToken;
    this.idToken = account.idToken;
  }

  GoogleAccount({
    required email,
    required this.accessToken,
    required this.refreshToken,
    required this.idToken,
  }) : super(email: email, type: AccountType.Google);
}
