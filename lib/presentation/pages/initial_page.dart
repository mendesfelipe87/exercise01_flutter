import 'dart:async';

import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 5),
      () => Navigator.pushNamed(context, "/countPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle _textStyle = TextStyle(
      color: Color.fromARGB(255, 147, 112, 219),
      fontSize: 32,
    );

    return Center(
      child: Container(
        color: Color.fromARGB(255, 0, 0, 0),
        child: Text(
          "Count App",
          textDirection: TextDirection.ltr,
          style: _textStyle,
        ),
      ),
    );
  }
}
