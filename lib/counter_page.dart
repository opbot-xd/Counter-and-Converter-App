import 'package:flutter/material.dart';
import 'package:conversion/conversion.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  Convert convert = Convert();
  int _count = 0;
  bool _isBinary = false;

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _count = _count > 0 ? _count - 1 : 0;
    });
  }

  String _getBinaryString() {
    // return utf8.encode(_count.toString()).toList().map((b) => b.toRadixString(2).padLeft(8, '0')).join();
    return convert.decimalToBinary(values: [_count])[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _isBinary ? _getBinaryString() : _count.toString(),
              style: TextStyle(fontSize: 24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _incrementCounter,
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: _decrementCounter,
                ),
              ],
            ),
            Switch(
              value: _isBinary,
              onChanged: (value) => setState(() => _isBinary = value),
            ),
          ],
        ),
      ),
    );
  }
}