import 'package:flutter/material.dart';

class TravelPage extends StatelessWidget {
  final String title;
  final String imgUrl;
  TravelPage(this.title, this.imgUrl);
  void _showAlertDialogForDelete(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Emin misiniz?'),
            content: Text('Bu islem geri alinamaz !'),
            actions: <Widget>[
              FlatButton(
                child: Text('iptal'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('Devam'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Geri Tusuna Basildi');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imgUrl),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(title),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text('DELETE'),
                onPressed: () {
                  _showAlertDialogForDelete(context);
                },
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
