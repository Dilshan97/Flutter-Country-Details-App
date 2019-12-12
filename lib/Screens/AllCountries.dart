import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'Country.dart';

class AllContries extends StatefulWidget {

  @override
  _AllContriesState createState() => _AllContriesState();
}

class _AllContriesState extends State<AllContries> {

  void getCountries() async {
    var response = await Dio().get('https://restcountries.eu/rest/v2/all');
    print(response.data);
  }

  @override
  Widget build(BuildContext context) {

    getCountries();

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
                      builder: (context) => Country('Sri Lanaka'),
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
