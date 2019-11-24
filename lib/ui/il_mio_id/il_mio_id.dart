import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class IlMioId extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
    ));

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Il Tuo ID",
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 64),
              child: Text(
                "Questo è il tuo QR code, puoi usarlo per identificarti nelle strutture convenzionate",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 64),
              child: QrImage(
                data: "PLTLMC97E09H5003C",
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            Text("PLTLMC97E09H5003C")
          ],
        )));
  }
}
