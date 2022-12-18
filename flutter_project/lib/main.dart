import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MainPage(),
    ));

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentAge = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
          title: const Text('Flutter APP'),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          elevation: 0 //drop shadow
          ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/hacker.png'),
                radius: 30,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[600],
            ),
            const Text('NAME',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2,
                )),
            const SizedBox(height: 10),
            Text('Aravinth Kumar',
                style: TextStyle(
                    color: Colors.amberAccent[200],
                    letterSpacing: 2,
                    fontSize: 28,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            const Text('AGE',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2,
                )),
            const SizedBox(height: 10),
            Text('$currentAge',
                style: TextStyle(
                    color: Colors.amberAccent[200],
                    letterSpacing: 2,
                    fontSize: 28,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                const SizedBox(width: 8),
                Text('aravinth@gmail.com',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[400],
                  letterSpacing: 1,
                  fontSize: 18
                ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            currentAge +=1;
          });
        },
        backgroundColor: Colors.grey[800],
        foregroundColor: Colors.cyan,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

