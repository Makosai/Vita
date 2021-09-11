import 'package:flutter/material.dart';
import 'package:vita/routes/scaffold_wrap.dart';
import 'package:vita/theme/globals.dart';

import 'inbox_content.dart';

class InboxPage extends StatefulWidget {
  InboxPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title = Globals.projectName;

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  List<_InboxItem> contents = [
    _InboxItem(
      title: "testTitle",
      subject: "testSubject",
      summary: "testSummary",
      message: "testMessage",
    ),
    _InboxItem(
      title: "testTitle2",
      subject: "testSubject2",
      summary: "testSummary",
      message: "testMessage",
    ),
    _InboxItem(
      title: "testTitle3",
      subject: "testSubject3",
      summary: "testSummary",
      message: "testMessage",
    ),
    _InboxItem(
      title: "testTitle4",
      subject: "testSubject4",
      summary: "testSummary",
      message: "testMessage",
    ),
    _InboxItem(
      title: "testTitle5",
      subject: "testSubject5",
      summary: "testSummary",
      message: "testMessage",
    ),
  ];

  List<Widget> getInbox() {
    List<Widget> list = [];
    contents.forEach(
        (e) => list.add(Text("Title: ${e.title}\nSubject: ${e.subject}")));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrap(content: InboxContent(getInbox: getInbox));
  }
}

class _InboxItem {
  final String title, subject, summary, message;

  _InboxItem({
    required this.title,
    required this.subject,
    required this.summary,
    required this.message,
  });
}
