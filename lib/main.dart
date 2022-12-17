import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Home()
));

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
      body:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey
              ),
              child: const Text("Hello World"),
          ),
          Container(
            color: Colors.amber,
            padding: const EdgeInsets.all(30),
            child:  ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey
                ),
                child: const Text('Press Me'),
              ) ,
            ),
        ],
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

