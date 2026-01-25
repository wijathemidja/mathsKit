import 'package:flutter/material.dart';
import 'package:quadratic_solve/quadratic_solve.dart';
import 'dart:math';

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
  List MiniApp = [QuadraticApp(), TriangleApp(), SettingsApp()];
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
          NavigationDestination(icon: Icon(Icons.change_history), label: "Triangle"),
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
            decoration: InputDecoration(label: Text("Enter A Value")),
            controller: _quadraticAText,
            onChanged: (String input) {
              var quadraticUsrAStr = _quadraticAText.text;
              setState(() {
                quadraticUsrA = double.parse(quadraticUsrAStr);
              });
            },
          ),
          TextField(
            decoration: InputDecoration(label: Text("Enter B Value")),
            controller: _quadraticBText,
            onChanged: (String input) {
              var quadraticUsrBStr = _quadraticBText.text;
              setState(() {
                quadraticUsrB = double.parse(quadraticUsrBStr);
              });
            },
          ),
          TextField(
            decoration: InputDecoration(label: Text("Enter C Value")),
            controller: _quadraticCText,
            onChanged: (String input) {
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

class SettingsApp extends StatefulWidget {
  const SettingsApp({super.key});

  @override
  State<SettingsApp> createState() => _SettingsAppState();
}

class _SettingsAppState extends State<SettingsApp> {
  versionNumber version = versionNumber(
    majorRelease: 0,
    minorRelease: 1,
    FeatureUpdate: 0,
    MajorBugfix: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Column(children: [Text("Version : $version")]),
    );
  }
}

// Functions

String testSolve(a, b, c) {
  Quadratic quadq = Quadratic(a: a, b: b, c: c);
  return (quadq.qslve());
}

// Classes

class versionNumber {
  int majorRelease = 0;
  int minorRelease = 0;
  int FeatureUpdate = 0;
  int MajorBugfix = 0;
  String? hotfix;
  versionNumber({
    required this.majorRelease,
    required this.minorRelease,
    required this.FeatureUpdate,
    required this.MajorBugfix,
    this.hotfix,
  });
  @override
  String toString() {
    if (hotfix != null) {
      return ("$majorRelease.$minorRelease.$FeatureUpdate.$MajorBugfix.$hotfix");
    } else {
      return ("$majorRelease.$minorRelease.$FeatureUpdate.$MajorBugfix");
    }
  }
}

// Global Variables

class TriangleApp extends StatefulWidget {
  const TriangleApp({super.key});

  @override
  State<TriangleApp> createState() => _TriangleAppState();
}

class _TriangleAppState extends State<TriangleApp> {
  int? findTriInt = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Triangle Kit")),
      body: Column(
        children: [
          RadioGroup(
            onChanged: (int? RadioChoice) {
              setState(() {
                findTriInt = RadioChoice;
              });
            },
            groupValue: findTriInt,
            child: Column(
              children: [
                RadioListTile(value: 0, title: Text("Find Hypotenuse")),
                RadioListTile(value: 1, title: Text("Find Leg")),
              ],
            ),
          ),
          TriFind(findTriInt),
        ],
      ),
    );
  }
}

class TriFindHyp extends StatefulWidget {
  const TriFindHyp({super.key});

  @override
  State<TriFindHyp> createState() => _TriFindHypState();
}

class _TriFindHypState extends State<TriFindHyp> {
  final _TeFi1 = TextEditingController();
  final _TeFi2 = TextEditingController();
  double aLeg = 0;
  double bLeg = 0;
  double? cHyp;
  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        TextField(
          decoration: InputDecoration(label: Text("Enter Triangle leg")),
          controller: _TeFi1,
          onChanged: (String input) {
            String _TeFi1Str = _TeFi1.text;
            setState(() {
              aLeg = double.parse(_TeFi1Str);
              cHyp = findHyp(a: aLeg, b: bLeg);
            });
          },
        ),
        TextField(
          decoration: InputDecoration(label: Text("Enter Triangle Leg")),
          controller: _TeFi2,
          onChanged: (String input) {
            String _TeFi2Str = _TeFi2.text;
            setState(() {
              bLeg = double.parse(_TeFi2Str);
              cHyp = findHyp(a: aLeg, b: bLeg);
            });
          },
        ),
        Text("The hypotenuse is $cHyp"),
      ],
    ));
  }
}

class TriFindLeg extends StatefulWidget {
  const TriFindLeg({super.key});

  @override
  State<TriFindLeg> createState() => _TriFindLegState();
}

class _TriFindLegState extends State<TriFindLeg> {
  final _TeFi1 = TextEditingController();
  final _TeFi2 = TextEditingController();
  double aLeg = 0;
  double cHyp = 0;
  double? bLeg;
  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        TextField(
          decoration: InputDecoration(label: Text("Enter Triangle leg")),
          controller: _TeFi1,
          onChanged: (String input) {
            var TeFi1Str = _TeFi1.text;
            setState(() {
              aLeg = double.parse(TeFi1Str);
              bLeg = findLeg(a: aLeg, c: cHyp);
            });
          },
        ),
        TextField(
          decoration: InputDecoration(label: Text("Enter Triangle Hypotenuse")),
          controller: _TeFi2,
          onChanged: (String input) {
            var TeFi1Str = _TeFi2.text;
            setState(() {
              cHyp = double.parse(TeFi1Str);
              bLeg = findLeg(a: aLeg, c: cHyp);
            });
          },
        ),
        Text("The leg is : $bLeg"),
      ],
    ));
  }
}

TriFind(choice) {
  if (choice == 0) {
    return (TriFindHyp());
  } else {
    return (TriFindLeg());
  }
}

double findHyp({required a, required b}) {
  double c = sqrt(((a * a) + (b * b)));
  return (c);
}

double findLeg({required a, required c}) {
  double b = sqrt(((c * c) - (a * a)));
  return (b);
}
