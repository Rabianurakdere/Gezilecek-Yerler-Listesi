import 'package:flutter/material.dart';
import 'pages/travel.dart';

class Travels extends StatelessWidget {
  final List<Map<String, dynamic>> travelpictures;

  Travels(this.travelpictures);
  Widget _buildTravelItems(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(travelpictures[index]['image']),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(travelpictures[index]['title'],
                    style: TextStyle(fontSize: 25.0, fontFamily: 'Oswald')),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      '\$${travelpictures[index]['price'].toString()}',
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Detaylar'),
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/travel/' + index.toString()),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTravelList() {
    Widget travelCard;
    if (travelpictures.length > 0) {
      travelCard = ListView.builder(
        itemBuilder: _buildTravelItems,
        itemCount: travelpictures.length,
      );
    } else {
      travelCard = Container();
    }
    
    return travelCard;
  }

  @override
  Widget build(BuildContext context) {
    
    return _buildTravelList();
  }
}
