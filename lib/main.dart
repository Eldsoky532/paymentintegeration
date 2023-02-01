import 'package:flutter/material.dart';
import 'package:paymentintegeration/core/neywork/dio_helper.dart';
import 'package:paymentintegeration/modules/screens/sign_up.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.initDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SignUpScreen(),
    );
  }
}
