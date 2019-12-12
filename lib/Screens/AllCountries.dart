import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'Country.dart';

class AllContries extends StatefulWidget {
  @override
  _AllContriesState createState() => _AllContriesState();
}

class _AllContriesState extends State<AllContries> {
  bool isSearching = false;

  List countries = [];

  getCountries() async {
    var response = await Dio().get('https://restcountries.eu/rest/v2/all');
    return response.data;
  }

  @override
  void initState() {
    getCountries().then((data) {
      setState(() {
        countries = data;
      });
    });
    super.initState();
  }

  void _filterCountry(value) {}

  @override
  Widget build(BuildContext context) {
    getCountries();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: !isSearching
            ? Text('All Countries')
            : TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'Search Country Here',
                ),
                onChanged: (value) {
                  _filterCountry(value);
                },
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                )
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: countries.length > 0
              ? ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Country(countries[index]),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 10,
                        color: Colors.blueGrey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 8),
                          child: Text(
                            countries[index]['name'],
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
