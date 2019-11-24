import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Notifiche extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
    ));

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Notifiche",
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(4),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Container(
                    margin: EdgeInsets.all(12),
                    child: ListTile(
                      leading: Icon(
                        Icons.notifications,
                        color: Colors.blueAccent.withOpacity(0.3),
                      ),
                      title: Text(
                          "Benvenuto sulla nuova App di Cooperazione Salute"),
                      subtitle: Text(
                          "Prova tutte le nuove funzionalità dell'app di Cooperazione Salute"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
