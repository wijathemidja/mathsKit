import 'package:flutter/material.dart';
import 'package:quadratic_solve/quadratic_solve.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

// App Main Screen

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List MiniApp = [QuadraticApp(), SettingsApp()];
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MiniApp[i],
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.superscript),
            label: "Quadratic",
          ),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
        ],
        selectedIndex: i,
        onDestinationSelected: (int index) {
          setState(() {
            i = index;
          });
        },
      ),
    );
  }
}

// App Widgets

class QuadraticApp extends StatefulWidget {
  const QuadraticApp({super.key});

  @override
  State<QuadraticApp> createState() => _QuadraticAppState();
}

class _QuadraticAppState extends State<QuadraticApp> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text("Solve Quadratics")),
      body: QuadraticSolver(),
    ));
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
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _quadraticAText,
            onSubmitted: (String input) {
              var quadraticUsrAStr = _quadraticAText.text;
              setState(() {
                quadraticUsrA = double.parse(quadraticUsrAStr);
              });
            },
          ),
          TextField(
            controller: _quadraticBText,
            onSubmitted: (String input) {
              var quadraticUsrBStr = _quadraticBText.text;
              setState(() {
                quadraticUsrB = double.parse(quadraticUsrBStr);
              });
            },
          ),
          TextField(
            controller: _quadraticCText,
            onSubmitted: (String input) {
              var quadraticUsrCStr = _quadraticCText.text;
              setState(() {
                quadraticUsrC = double.parse(quadraticUsrCStr);
              });
            },
          ),
          Text(testSolve(quadraticUsrA, quadraticUsrB, quadraticUsrC)),
        ],
      ),
    );
  }
}

class SettingsApp extends StatelessWidget {
  const SettingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Text("Settings"),
    );
  }
}

// Functions

String testSolve(a, b, c) {
  Quadratic quadq = Quadratic(a: a, b: b, c: c);
  return (quadq.qslve());
}
