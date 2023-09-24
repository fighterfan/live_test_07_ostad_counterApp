import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CountScreen(),
    );
  }
}

class CountScreen extends StatefulWidget {
  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Count Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Count: $count",
              style: TextStyle(fontSize: 24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: incrementCount,
                  child: Text(
                    "+",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: decrementCount,
                  child: Text(
                    "-",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void incrementCount() {
    setState(() {
      count++;
    });

    if (count >= 5) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Button pressed!"),
          content: Text("Button pressed $count times."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  void decrementCount() {
    if (count > 0) {
      setState(() {
        count--;
      });
    }
  }
}
