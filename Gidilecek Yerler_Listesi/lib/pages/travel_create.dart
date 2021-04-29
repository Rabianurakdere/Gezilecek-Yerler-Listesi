import 'package:flutter/material.dart';

class TravelCreatePage extends StatefulWidget {
  final Function addTravels;
  TravelCreatePage(this.addTravels);
  @override
  State<StatefulWidget> createState() {
    
    return _TravelCreatePageState();
  }
}

class _TravelCreatePageState extends State<TravelCreatePage> {
  String _titleValue;
  String _descriptionValue;
  double _priceValue;
  bool _accept = false;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Gidilecek Yer Adı'),
            onChanged: (String value) {
              setState(() {
                _titleValue = value;
              });
            },
          ),
          
          TextField(
            maxLines: 4,
            decoration: InputDecoration(labelText: 'Ülke-Şehir'),
            onChanged: (String value) {
              setState(() {
                _descriptionValue = value;
              });
            },
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Yaklaşık Maliyet'),
            onChanged: (String value) {
              setState(() {
                _priceValue = double.parse(value);
              });
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: Colors.black,
            child: Text('Kaydet'),
            onPressed: () {
              final Map<String, dynamic> travel = {
                'title': _titleValue,
                'description': _descriptionValue,
                'price': _priceValue,
                'image': 'assets/travel.jpg'
              };
              widget.addTravels(travel);
              Navigator.pushReplacementNamed(context, '/admin');
            },
          )
        ],
      ),
    );
  }
}
