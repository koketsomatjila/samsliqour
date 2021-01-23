import 'package:flutter/material.dart';
import 'package:sams_liqour/Pages/Home.dart';
import 'package:sams_liqour/Pages/Log%20In.dart';
import 'package:sams_liqour/Pages/Splash.dart';
import 'package:sams_liqour/Provider/User%20Provider.dart';
import './Pages/Log In.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ChangeNotifierProvider(
    create: (_) => UserProvider.initialize(),
    child: MaterialApp(
      home: ScreensController(),
    ),
  ));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch (user.status) {
      case Status.Uninitialised:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LogIn();
      case Status.Authenticated:
        return HomePage();
      default:
        return LogIn();
    }
  }
}
