import 'package:finap_test/UI/authpages/login_view.dart';
import 'package:finap_test/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (context) => DataProvider(),
          child: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            home: const LoginScreen(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
