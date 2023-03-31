import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_bloc_app/screens/tab_screen.dart';
import 'package:to_do_bloc_app/services/app_router.dart';

import 'blocs/bloc_exports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(MyApp(
    approuter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.approuter});
  final AppRouter approuter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness:
                  state.switchValue ? Brightness.dark : Brightness.light,
            ),
            home: const TabScreen(),
            onGenerateRoute: approuter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
