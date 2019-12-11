import 'package:flutter/material.dart';

import 'Country.dart';

class AllContries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('All Countries'),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Country(),
                    ),
                  );
                },
                child: Card(
                  elevation: 10,
                  color: Colors.blueGrey,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: Text(
                      'Sri Lanaka',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
