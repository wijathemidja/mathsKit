
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
          NavigationDestination(
              icon: Icon(Icons.hexagon),
              label: "Triangle"),
          NavigationDestination(
              icon: Icon(Icons.settings),
              label: "Settings"),

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
  versionNumber version = versionNumber(majorRelease: 0, minorRelease: 1, FeatureUpdate: 0, MajorBugfix: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Column(children: [Text("Version : $version"),],),
    );
  }
}

// Functions

String testSolve(a, b, c) {
  Quadratic quadq = Quadratic(a: a, b: b, c: c);
    return (quadq.qslve());
}

// Classes

class versionNumber{
  int majorRelease = 0;
  int minorRelease = 0;
  int FeatureUpdate = 0;
  int MajorBugfix = 0;
  String? hotfix;
  versionNumber({required this.majorRelease,required this.minorRelease,required this.FeatureUpdate,required this.MajorBugfix, this.hotfix});
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
  String? findTri;
  int? findTriInt = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Triangle Kit")), body: Column(children: [
      RadioGroup(
        onChanged: (int? RadioChoice) {
          setState(() {
            findTriInt = RadioChoice;
            if (RadioChoice == 0){
              findTri = "findHyp";
            } else if (RadioChoice == 1){
              findTri = "findLeg";
            }
          });
        },
        groupValue: findTriInt,
        child: Column(children: [RadioListTile(value: 0, title: Text("Find Hypotenuse"),), RadioListTile(value: 1, title: Text("Find Leg"),)],)),
    TextField(
    decoration: InputDecoration(
    label: Text("Enter triangle leg")),
    ),
    TextField(decoration: InputDecoration(label: Text(TriTextInputText2(findTriInt)))), Text("Placeholder Answer")],
    ),);
  }
}

String TriTextInputText2(choice){
  if(choice==0){
    return("Enter triangle leg");
  } else {
    return("Enter triangle hypotenuse");
  }
}