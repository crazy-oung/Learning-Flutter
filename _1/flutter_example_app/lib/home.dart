import 'dart:ui';
import 'package:flutter/material.dart';

List<String> titles = ['red', 'ornage', 'yellow', 'green', 'blue', 'purple'];
List<Color> colors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.purple
];

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {},
        //   color: Colors.white,
        // ),
        title: Text('타이틀'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Colors.white,
          )
        ],
        backgroundColor: Colors.amber,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
      drawer: Drawer(
        child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.search),
                title: Text(titles[index]),
                trailing: Icon(Icons.menu),
                tileColor: colors[index],
                onTap: () {
                  print(index);
                  print(titles[index]);
                  print(colors[index]);
                },
              );
            }),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/text.png'),
          CircleAvatar(
            backgroundImage: AssetImage('assets/text.png'),
            radius: 60,
          )
        ],
      ),
      // Center(
      //   child: Text(
      //     '안녕하세요',
      //     style: TextStyle(
      //         backgroundColor: Colors.amber,
      //         fontSize: 50,
      //         fontWeight: FontWeight.bold),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('cliked!');
        },
        child: Text(
          'button',
          style: TextStyle(color: Colors.white),
        ),
        tooltip: 'tooltip',
        backgroundColor: Colors.black87,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.list),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
