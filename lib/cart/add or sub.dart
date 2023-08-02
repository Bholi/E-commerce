

import 'package:flutter/material.dart';

class NumberCounter extends StatefulWidget {
  const NumberCounter({super.key});

  @override
  _NumberCounterState createState() => _NumberCounterState();
}

class _NumberCounterState extends State<NumberCounter> {
  int _number = 0;

  void _incrementNumber() {
    setState(() {
      _number++;
    });
  }

  void _decrementNumber() {
    setState(() {
      _number--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$_number',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              color: Colors.black,
              onPressed: _decrementNumber,
            ),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.black,
              onPressed: _incrementNumber,
            ),
          ],
        ),
      ],
    );
  }
}
