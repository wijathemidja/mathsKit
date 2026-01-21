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
    return (Scaffold(appBar: AppBar(title: Text("Maths Kit")),body: QuadraticSolver()));
  }
}

class QuadraticSolver extends StatefulWidget {
  const QuadraticSolver({super.key});

  @override
  State<QuadraticSolver> createState() => _QuadraticSolverState();
}

class _QuadraticSolverState extends State<QuadraticSolver> {
  final _quadraticAText = TextEditingController();
  final _quadraticBText = TextEditingController();
  final _quadraticCText = TextEditingController();
  double quadraticUsrA = 1;
  double quadraticUsrB = 0;
  double quadraticUsrC = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [TextField(
      controller: _quadraticAText,
      onSubmitted: (String input){
        var quadraticUsrAStr = _quadraticAText.text;
        setState(() {
          quadraticUsrA = double.parse(quadraticUsrAStr);
        });

      },
    ), TextField(
      controller: _quadraticBText,
      onSubmitted: (String input){
        var quadraticUsrBStr = _quadraticBText.text;
        setState(() {
          quadraticUsrB = double.parse(quadraticUsrBStr);
        });

      },
    ),TextField(
      controller: _quadraticCText,
      onSubmitted: (String input){
        var quadraticUsrCStr = _quadraticCText.text;
        setState(() {
          quadraticUsrC = double.parse(quadraticUsrCStr);
        });

      },
    ), Text(testSolve(quadraticUsrA, quadraticUsrB, quadraticUsrC))],),
    );
  }
}




String testSolve(a,b,c){
    Quadratic quadq = Quadratic(a:a,b:b,c:c);
    return(quadq.qslve());
}

