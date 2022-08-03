import 'package:flutter/material.dart';

class DashbordScreen extends StatefulWidget {

  static const routeName = '/dashbordScreen';

  const DashbordScreen({Key? key}) : super(key: key);

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("shathurshn"),
      ),
    );
  }
}
