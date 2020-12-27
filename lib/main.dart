import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/providers/auth_provider.dart';
import 'package:todo/app/providers/tasks_provider.dart';
import 'package:todo/app/view/login/page/login_page.dart';

import 'routing/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .then((FirebaseApp value) => print('Firebase Initialize'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // ignore: always_specify_types
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (BuildContext context) => AuthProvider(),
        ),
        ChangeNotifierProvider<TaskProvider>(
          create: (BuildContext context) => TaskProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        title: 'Todo',
        home: LoginPage(),
      ),
    );
  }
}
