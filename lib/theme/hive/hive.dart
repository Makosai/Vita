import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vita/theme/hive/boxes/account_info.dart';
import 'package:vita/theme/hive/boxes/account_info.typeadapters.dart' as Adapters;

class HiveConfig {

  static Future<void> initFlutter() async {
    await Hive.initFlutter();

    // Register Adapters
    Hive.registerAdapter<EmailAccount>(Adapters.EmailAccountAdapter());
    Hive.registerAdapter<GoogleAccount>(Adapters.GoogleAccountAdapter());
    Hive.registerAdapter<AccountType>(Adapters.AccountTypeAdapter());
    Hive.registerAdapter<AccessToken>(Adapters.AccessTokenAdapter());

    AccountInfo.loadInboxes();

    // Hive.deleteBoxFromDisk("accountInfo");
  }
}