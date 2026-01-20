import 'package:flutter/material.dart';
import 'package:quadratic_solve/quadratic_solve.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(appBar: AppBar(title: Text(testSolve())),));
  }
}

String testSolve(){
    Quadratic quadq = Quadratic(a:1,b:-5,c:-14);
    return(quadq.qslve());
}

