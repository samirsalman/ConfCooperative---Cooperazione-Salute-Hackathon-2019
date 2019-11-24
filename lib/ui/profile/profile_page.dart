import 'package:confsalute/global_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GlobalBloc globalBloc;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
    ));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Profilo",
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: globalBloc.user.sesso == "M"
                                ? AssetImage("assets/man.png")
                                : AssetImage("assets/girl.png")),
                        border: Border.fromBorderSide(BorderSide(
                            color: Colors.lightBlue.withOpacity(0.4),
                            width: 2))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      globalBloc.user.nome.toUpperCase() +
                          " " +
                          globalBloc.user.cognome.toUpperCase(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.blueAccent.withOpacity(0.5)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Divider(
                  color: Colors.blueAccent.withOpacity(0.2),
                  indent: 0,
                  thickness: 1.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.calendar_today,
                            color: Colors.blueAccent.withOpacity(0.5),
                          ),
                        ),
                        Text(globalBloc.user.eta.toString() + " Anni")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.place,
                            color: Colors.blueAccent.withOpacity(0.5),
                          ),
                        ),
                        Text(globalBloc.user.citta.toString())
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Divider(
                  color: Colors.blueAccent.withOpacity(0.2),
                  indent: 0,
                  thickness: 1.5,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.phone,
                            color: Colors.blueAccent.withOpacity(0.5),
                          ),
                        ),
                        Text(globalBloc.user.telefono.toString())
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.mail,
                            color: Colors.blueAccent.withOpacity(0.5),
                          ),
                        ),
                        Text(globalBloc.user.email)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.description,
                            color: Colors.blueAccent.withOpacity(0.5),
                          ),
                        ),
                        Text(globalBloc.user.coopRif.toUpperCase())
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Divider(
                  color: Colors.blueAccent.withOpacity(0.2),
                  indent: 0,
                  thickness: 1.5,
                ),
              ),
              Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularPercentIndicator(
                                radius: 80.0,
                                lineWidth: 5.0,
                                percent: 0.5,
                                center: new Text("50%"),
                                progressColor: Colors.yellow,
                              ),
                            ),
                            Text("Prestazioni")
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularPercentIndicator(
                                radius: 80.0,
                                lineWidth: 5.0,
                                percent: 0.2,
                                center: new Text("20%"),
                                progressColor: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text("Analisi")
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularPercentIndicator(
                                radius: 80,
                                lineWidth: 5.0,
                                percent: 0.94,
                                center: new Text("94%"),
                                progressColor: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text("Odontoiatria")
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    globalBloc = BlocProvider.of(context);
    super.initState();
  }
}
