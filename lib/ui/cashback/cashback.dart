import 'package:confsalute/global_bloc/global_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CashBack extends StatefulWidget {
  @override
  _CashBackState createState() => _CashBackState();
}

class _CashBackState extends State<CashBack> {
  GlobalBloc globalBloc;

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
    ));

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Cashback",
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                margin: EdgeInsets.only(top: 24),
                child: Card(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24),
                            topLeft: Radius.circular(24))),
                    child: Container(
                      margin: EdgeInsets.all(12),
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
                                        color:
                                            Colors.lightBlue.withOpacity(0.4),
                                        width: 2))),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 24),
                                width: 200,
                                child: Text(
                                  "Il mio Cashback mutualistico:",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              )
                            ],
                          ),
                          Text(
                            "46,80€",
                            style: TextStyle(color: Colors.white, fontSize: 42),
                          )
                        ],
                      ),
                    )),
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: 450,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Card(
                          margin: EdgeInsets.only(left: 4, top: 24, bottom: 24),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(44))),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 48.0, top: 16),
                                child: Text(
                                  "Percentuale rimborso:",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularPercentIndicator(
                                  radius: 180.0,
                                  lineWidth: 15.0,
                                  percent: 0.20,
                                  center: new Text("20%"),
                                  progressColor: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          height: 225,
                          width: 150,
                          child: Card(
                              margin:
                                  EdgeInsets.only(left: 4, top: 24, bottom: 24),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(44))),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 24.0),
                                    child: Text(
                                      "Ti mancano:",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 24),
                                    child: Text(
                                      "3,20€",
                                      style: TextStyle(fontSize: 34),
                                    ),
                                  )
                                ],
                              ))),
                      Container(
                          height: 240,
                          width: 150,
                          child: Card(
                              margin:
                                  EdgeInsets.only(left: 4, top: 0, bottom: 24),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(44))),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 24.0, bottom: 12),
                                    child: Text(
                                      "Storico:",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        "04/18",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "6,00€",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        "08/18",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "40,20€",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        "02/19",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "100,00€",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        "04/19",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "3,45€",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                ],
                              ))),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }

  @override
  void initState() {
    globalBloc = BlocProvider.of<GlobalBloc>(context);
    super.initState();
  }
}
