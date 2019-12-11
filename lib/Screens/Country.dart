
import 'package:flutter/material.dart';

class Country extends StatelessWidget {

  final String name;

  Country(this.name);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(name),
      ),
    );
  }

}