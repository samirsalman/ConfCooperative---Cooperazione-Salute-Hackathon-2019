import 'package:confsalute/models/specializzazione.dart';
import 'package:confsalute/models/struttura.dart';
import 'package:confsalute/ui/strutture_page/strutture_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'struttura_bloc/bloc.dart';
import 'struttura_bloc/struttura_bloc.dart';

class StruttureTypePage extends StatefulWidget {
  @override
  _StruttureTypePageState createState() => _StruttureTypePageState();
}

class _StruttureTypePageState extends State<StruttureTypePage> {
  StrutturaBloc strutturaBloc;
  List<Struttura> strutture = List();
  List<Specializzazione> temp = List();
  List<Specializzazione> special = List();
  searchSpec(String word) {
    strutturaBloc.filter(word);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
    ));

    var width = MediaQuery.of(context).size.width;
    return BlocBuilder(
      builder: (context, state) {
        if (state is Loaded) {
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
                  child: Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      child: Column(children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(24),
                          width: width,
                          child: TextField(
                            onChanged: (value) {
                              searchSpec(value);
                            },
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor)),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor)),
                                hintText: "Cerca...",
                                suffixIcon: Icon(Icons.search)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionTile(
                              trailing: Icon(
                                Icons.keyboard_arrow_down,
                                color: Theme.of(context).primaryColor,
                                size: 30,
                              ),
                              title: Text(
                                "Specializzazione",
                                style: new TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              children: <Widget>[
                                Column(children: <Widget>[
                                  Column(
                                      children: strutturaBloc.temp
                                          .map((el) => GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            StrutturePage(
                                                                strutturaBloc
                                                                        .strutturaSpecializzazione[
                                                                    el.nome])));
                                              },
                                              child: ListTile(
                                                title: Text(el.nome),
                                              )))
                                          .toList()),
                                ]),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionTile(
                              trailing: Icon(
                                Icons.keyboard_arrow_down,
                                color: Theme.of(context).primaryColor,
                                size: 30,
                              ),
                              title: Text(
                                "Struttura",
                                style: new TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              children: <Widget>[
                                Column(
                                    children: strutturaBloc.strutturaTipo.keys
                                        .map((el) => GestureDetector(
                                              child: ListTile(
                                                title: Text(el.toString()),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            StrutturePage(
                                                                strutturaBloc
                                                                        .strutturaTipo[
                                                                    el])));
                                              },
                                            ))
                                        .toList()),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionTile(
                              trailing: Icon(
                                Icons.keyboard_arrow_down,
                                color: Theme.of(context).primaryColor,
                                size: 30,
                              ),
                              title: Text(
                                "Luogo",
                                style: new TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              children: <Widget>[
                                Column(
                                    children: strutturaBloc.strutturaLuogo.keys
                                        .map((el) => GestureDetector(
                                              child: ListTile(
                                                title: Text(el.toString()),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            StrutturePage(
                                                                strutturaBloc
                                                                        .strutturaLuogo[
                                                                    el])));
                                              },
                                            ))
                                        .toList()),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionTile(
                              trailing: Icon(
                                Icons.keyboard_arrow_down,
                                color: Theme.of(context).primaryColor,
                                size: 30,
                              ),
                              title: Text(
                                "Cooperativa",
                                style: new TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              children: <Widget>[
                                Column(children: <Widget>[
                                  Column(
                                      children: strutturaBloc.cooperative
                                          .map((el) => GestureDetector(
                                                child: ListTile(
                                                  title: Text(el.denominazione),
                                                ),
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              StrutturePage(
                                                                  strutturaBloc
                                                                      .cooperative)));
                                                },
                                              ))
                                          .toList()),
                                ]),
                              ]),
                        )
                      ]))));
        }

        if (state is Loading) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                "Strutture",
                style: TextStyle(fontSize: 16),
              ),
              centerTitle: true,
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  child: LoadingIndicator(
                    indicatorType: Indicator.semiCircleSpin,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )),
          );
        }
      },
      bloc: strutturaBloc,
    );
  }

  @override
  void initState() {
    strutturaBloc = StrutturaBloc();
    strutturaBloc.add(GetData());
    print(special);
    super.initState();
  }
}
