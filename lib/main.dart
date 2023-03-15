import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exercise_flutter/logic/cubits/counter/counter_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'presentation/pages/initial_page.dart';
import 'presentation/pages/count_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  if (Platform.isAndroid) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterCubit(),
          ),
        ],
        child: MaterialApp(
          initialRoute: "/",
          routes: {"/countPage": (context) => CountPage()},
          home: InitialPage(),
        ),
      ),
    );
  } else {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterCubit(),
          ),
        ],
        child: CupertinoApp(
          initialRoute: "/",
          routes: {"/countPage": (context) => CountPage()},
          home: InitialPage(),
        ),
      ),
    );
  }
}
