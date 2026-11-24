import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_workspace/app.dart';
import 'package:freelancer_workspace/firebase_options.dart';
import 'package:freelancer_workspace/providers/themeprovider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => Themeprovider())],
    child: App(),
  ),);



}
