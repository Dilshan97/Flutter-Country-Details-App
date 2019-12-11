import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: AllContries(),
  ));
}

class AllContries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('All Countries'),
      ),
    );
  }
}
