import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double acc = 0;
  double conf = 0;
  double ser = 0;
  double ass = 0;

  changeAcc(val) {
    setState(() {
      acc = val;
    });
  }

  changeConf(val) {
    setState(() {
      conf = val;
    });
  }

  changeSer(val) {
    setState(() {
      ser = val;
    });
  }

  changeAss(val) {
    setState(() {
      ass = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24))),
      title: Text(
        "Recensisci la struttura, servirà a noi a migliorare il servizio e a te per scegliere le strutture migliori",
        style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
        textAlign: TextAlign.center,
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("Accoglienza:"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RatingBar(
                    initialRating: acc,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 40,
                    onRatingUpdate: (val) => changeAcc(val),
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Confort"),
                  RatingBar(
                    initialRating: conf,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 40,
                    onRatingUpdate: (val) => changeConf(val),
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Servizi"),
                  RatingBar(
                    initialRating: ser,
                    onRatingUpdate: (val) => changeSer(val),
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 40,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Assistenza"),
                  RatingBar(
                    initialRating: ass,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 40,
                    onRatingUpdate: (val) => changeAss(val),
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              height: 60,
              width: 200,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  "Vota",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  int media = ((acc + ser + conf + ass) / 4).toInt();
                  Navigator.pop(context, [media]);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
