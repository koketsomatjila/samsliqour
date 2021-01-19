import 'package:flutter/material.dart';
import 'package:sams_liqour/Pages/Log%20In.dart';
import './Pages/Log In.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: LogIn(),
  ));
}
