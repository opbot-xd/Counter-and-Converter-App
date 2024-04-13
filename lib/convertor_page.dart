import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  String _binaryInput = "";
  int _convertedNumber = 0;

  void _convertBinary() {
    int? value = int.tryParse(_binaryInput, radix: 2);
    if (value != null) {
      setState(() {
        _convertedNumber = value;
      });
    } else {
      // Handle invalid input
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binary Converter'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Binary String',
              ),
              onChanged: (value) => setState(() => _binaryInput = value),
            ),
            ElevatedButton(
              onPressed: _convertBinary,
              child: Text('Convert'),
            ),
            Text(
              'Converted Number: $_convertedNumber',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}