import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'Country.dart';

class AllContries extends StatefulWidget {
  @override
  _AllContriesState createState() => _AllContriesState();
}

class _AllContriesState extends State<AllContries> {
  Future<List> countries;

  Future<List> getCountries() async {
    var response = await Dio().get('https://restcountries.eu/rest/v2/all');
    return response.data;
  }

  @override
  void initState() {
    countries = getCountries();
    super.initState();
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
          child: FutureBuilder<List>(
            future: countries,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot){

              if(snapshot.hasData){
                return ListView.builder(itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Country(snapshot.data[index]),
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
                          snapshot.data[index]['name'],
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  );
                });
              }
              return null;
            },
          )),
    );
  }
}
