import 'package:confsalute/global_bloc/bloc.dart';
import 'package:confsalute/ui/chattiamo/chattiamo.dart';
import 'package:confsalute/ui/il_mio_id/il_mio_id.dart';
import 'package:confsalute/ui/storico/storico.dart';
import 'package:confsalute/ui/strutture_page/strutture_type_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            "Home",
            style: TextStyle(fontSize: 16),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "Funzionalità in sviluppo",
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 2),
                ));
              },
            )
          ],
          centerTitle: true,
        ),
        body: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: <Widget>[
              Container(
                height: 120,
                margin: EdgeInsets.all(24),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StruttureTypePage()));
                    },
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      elevation: 0.5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.location_city,
                              color: Colors.white,
                              size: 50,
                            ),
                            Text(
                              "Strutture",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )),
              ),
              Container(
                height: 120,
                margin: EdgeInsets.all(24),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Storico()));
                  },
                    child: Card(
                  color: Theme.of(context).primaryColor,
                  elevation: 0.5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.list,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "Storico Appuntamenti",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                )),
              ),
              Container(
                height: 120,
                margin: EdgeInsets.all(24),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => IlMioId()));
                    },
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      elevation: 0.5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person_outline,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            "Il mio ID",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    )),
              ),
              Container(
                height: 120,
                margin: EdgeInsets.all(24),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Chattiamo()));
                  },
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    elevation: 0.5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chat,
                          size: 50,
                          color: Colors.white,
                        ),
                        Text(
                          "Chattiamo",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]));
  }

  @override
  void initState() {
    globalBloc = BlocProvider.of(context);
    super.initState();
  }
}
