import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Country extends StatelessWidget {
  final Map country;

  Country(this.country);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(country['name']),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            FlipCard(
              direction: FlipDirection.HORIZONTAL, // default
              front: CountryCard(title: 'Capital'),
              back: DetailCard(title: country['capital'], bgcolor: Colors.deepOrange,),
            ),
            FlipCard(
              direction: FlipDirection.HORIZONTAL, // default
              front: CountryCard(title: 'Population'),
              back: DetailCard(title: country['population'].toString(),bgcolor: Colors.deepPurple,),
            ),
            FlipCard(
              direction: FlipDirection.HORIZONTAL, // default
              front: CountryCard(title: 'Flag'),
              back: Card(
                color: Colors.white,
                elevation: 10,
                child: Center(
                  child: SvgPicture.network(
                    country['flag'],
                    width: 200,
                  ),
                ),
              ),
            ),
            FlipCard(
              direction: FlipDirection.HORIZONTAL, // default
              front: CountryCard(title: 'Currency'),
              back: DetailCard(title: country['currencies'][0]['name'], bgcolor: Colors.blue,),
            ),
            FlipCard(
              direction: FlipDirection.HORIZONTAL, // default
              front: CountryCard(title: 'Show On Map'),
              back: DetailCard(title: 'hello', bgcolor: Colors.green,),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;

  const CountryCard({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Center(
          child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}

class DetailCard extends StatelessWidget {
  final String title;
  final MaterialColor bgcolor;

  DetailCard({this.title, this.bgcolor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: bgcolor,
      elevation: 10,
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
