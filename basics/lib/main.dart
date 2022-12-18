import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
        centerTitle: true,
        backgroundColor: Colors.cyan[500],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(child: Image.asset('assets/unnamed.jpg')),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.cyan,
                child: Text('1'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.pinkAccent,
                child: Text('2'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.amber,
                child: Text('3'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.cyan[500],
        child: const Text('Press'),
      ),
    );
  }
}
