import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vita/theme/mail/auth_google_desktop.dart';
import 'package:vita/theme/mail/auth_google_mobile.dart';

class AuthGoogle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      return AuthGoogleDesktop();
    }

    return AuthGoogleMobile();
  }
}
