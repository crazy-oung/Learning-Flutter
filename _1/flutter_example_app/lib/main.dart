import 'package:flutter/material.dart';
import './home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const MyHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}


// home.dart imported 
// class MyHome extends StatefulWidget {
//   const MyHome({super.key});

//   @override
//   State<MyHome> createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('타이틀'),
//       ),
//       body: Center(
//         child: Text('바디'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Text('버튼'),
//       ),
//     );
//   }
// }
