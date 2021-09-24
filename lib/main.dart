import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themed/themed.dart';
import 'package:vita/routes/home/home.dart';
import 'package:vita/routes/settings/settings.dart';
import 'package:vita/theme/hive/hive.dart';
import 'package:window_size/window_size.dart';
import 'package:vita/routes/inbox/inbox.dart';
import 'package:vita/theme/models.dart';

import 'theme/globals.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle(Globals.projectName);
    setWindowMinSize(const Size(700, 500));
    setWindowMaxSize(Size.infinite);
  }

  // Hive Storage
  await HiveConfig.initFlutter();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SidebarModel()),
      ChangeNotifierProvider(create: (_) => AccountsModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Themed(
      child: MaterialApp(
        title: Globals.projectName,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          fontFamily: 'Caros',
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/settings',
        onGenerateRoute: (settings) {
          Widget? page;
          if (settings.name == '/') {
            page = HomePage();
          }

          if (settings.name == '/inbox') {
            page = InboxPage();
          }

          if (settings.name == '/settings') {
            page = SettingsPage();
          }

          return Settings.onGenerateRoute(settings, page);
        },
      ),
    );
  }
}
