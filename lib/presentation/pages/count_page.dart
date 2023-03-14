import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exercise_flutter/logic/cubits/counter/counter_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountPage extends StatefulWidget {
  const CountPage({super.key});

  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    const TextStyle _textStyle = TextStyle(
      color: Color.fromARGB(255, 147, 112, 219),
      fontSize: 32,
    );

    return BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
      final CounterCubit counterCubit = context.read<CounterCubit>();
      int _counter = counterCubit.state.counter;

      if (Platform.isAndroid) {
        return Scaffold(
          body: Center(
            child: Container(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                "The Floating Button was pressed $_counter times",
                style: _textStyle,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 147, 112, 219),
            onPressed: () {
              counterCubit.countValue();
            },
            child: Icon(Icons.add),
          ),
        );
      } else {
        return CupertinoPageScaffold(
          child: Stack(
            children: <Widget>[
              Container(
                color: Color.fromARGB(255, 0, 0, 0),
                padding: EdgeInsets.only(left: 40),
                child: Center(
                  child: Text(
                    "The Counter comes to value $_counter",
                    style: _textStyle,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: FloatingActionButton(
                    backgroundColor: Color.fromARGB(255, 147, 112, 219),
                    onPressed: () {
                      counterCubit.countValue();
                    },
                    child: Icon(CupertinoIcons.add),
                  ),
                ),
              )
            ],
          ),
        );
      }
    });
  }
}
