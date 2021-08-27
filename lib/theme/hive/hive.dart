import 'package:hive_flutter/hive_flutter.dart';
import 'package:vita/theme/hive/boxes/account_info.dart';

class HiveConfig {

  static Future<void> initFlutter() async {
    await Hive.initFlutter();

    AccountInfo.loadInboxes();
  }
}