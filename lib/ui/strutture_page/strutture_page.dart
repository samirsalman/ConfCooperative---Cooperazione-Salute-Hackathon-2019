import 'package:confsalute/models/struttura.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StrutturePage extends StatefulWidget {
  @override
  _StrutturePageState createState() => _StrutturePageState();
  List<Struttura> strutture;
  StrutturePage(this.strutture);
}

class _StrutturePageState extends State<StrutturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Strutture",
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: widget.strutture.map((el) => buildCard(el)).toList(),
          ),
        ));
  }

  Widget buildCard(Struttura s) {
    return Container(
      margin: EdgeInsets.all(24),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                s.denominazione,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Text(s.regione + ", " + s.comune),
              Text(
                s.indirizzo,
                style: TextStyle(color: Colors.grey),
              ),
              Image.asset("assets/hospital.jpg"),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Valutazione :"),
                    RatingBar(
                      initialRating: s.isCooperativa ? 4 : s.rating,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: 20,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
              s.isCooperativa
                  ? Chip(
                      label: Text("Cooperativa"),
                      backgroundColor: Colors.yellow,
                    )
                  : Container(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: EdgeInsets.all(24),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "Prenota",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
