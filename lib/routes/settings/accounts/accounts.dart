import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vita/theme/hive/boxes/account_info.dart';
import 'package:vita/theme/sizing.dart';
import 'package:vita/theme/themes.dart';

import 'accounts_new.dart';

class AccountsPage extends StatelessWidget {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
    backgroundColor: CurrentTheme.textInfo,
    primary: CurrentTheme.canvas,
    padding: EdgeInsets.symmetric(
      horizontal: Sizing.padding1,
      vertical: Sizing.padding2,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Widget getAccounts() {
      return ValueListenableBuilder(
        valueListenable: Hive.box<Account>('accountInfo').listenable(),
        builder: (context, Box<Account> box, widget) {
          return Expanded(
            child: Scrollbar(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: box.length,
                itemBuilder: (c, i) {
                  Account account = box.getAt(i)!;

                  late Widget email;
                  late void Function() deleteFunc;
                  late void Function() editFunc;

                  switch (account.type) {
                    case AccountType.Email:
                      EmailAccount emailAccount = account as EmailAccount;
                      email = Text('${emailAccount.email}');
                      deleteFunc = () {
                        emailAccount.delete();
                      };
                      editFunc = () {
                        emailAccount.email = "${emailAccount.email}edited";
                        emailAccount.save();
                      };
                      break;

                    case AccountType.Google:
                      GoogleAccount googleAccount = account as GoogleAccount;
                      email = Text('${googleAccount.email}');
                      deleteFunc = () {
                        googleAccount.delete();
                      };
                      editFunc = () {
                        googleAccount.email = "${googleAccount.email}edited";
                        googleAccount.save();
                      };
                      break;

                    default:
                      email = Text('Error: Invalid Account Type');
                  }

                  return ListTile(
                    hoverColor: CurrentTheme.textInfo,
                    title: email,
                    subtitle: Row(
                      children: [
                        TextButton(
                            onPressed: deleteFunc, child: Text("Delete")),
                        TextButton(onPressed: editFunc, child: Text("Edit")),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      );
    }

    return Column(
      children: [
        getAccounts(),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(
                right: Sizing.padding2, bottom: Sizing.padding2 * 2),
            child: ElevatedButton(
              style: flatButtonStyle,
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const AccountsNew(),
                  ),
                );
              },
              child: Text("Add account"),
            ),
          ),
        ),
      ],
    );
  }
}
