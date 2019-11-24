import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'alert.dart';
import 'storico_bloc/bloc.dart';

class Storico extends StatefulWidget {
  @override
  _StoricoState createState() => _StoricoState();
}

class _StoricoState extends State<Storico> {
  StoricoBloc storicoBloc;
  int media;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
    ));

    return BlocBuilder(
      builder: (context, state) {
        if (state is LoadingStorico) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                "Storico Appuntamenti",
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

        if (state is Loaded) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                "Storico Appuntamenti",
                style: TextStyle(fontSize: 16),
              ),
              centerTitle: true,
            ),
            body: Container(
              margin: EdgeInsets.all(12),
              height: 180,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                  storicoBloc.struct.denominazione,
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              storicoBloc.struct.comune,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              storicoBloc.res[0]["DataPrenotazione"]
                                  .toString()
                                  .substring(0, 10),
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          )
                        ],
                      ),
                      media == null
                          ? Container(
                              height: 100,
                              width: 100,
                              child: RaisedButton(
                                color: Theme.of(context).primaryColor,
                                child: Text(
                                  "Vota",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: (context),
                                      builder: (context) {
                                        return ConstrainedBox(
                                          child: Rating(),
                                          constraints: BoxConstraints(
                                              maxHeight: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5),
                                        );
                                      }).then((value) {
                                        print(value);
                                        setState(() {
                                          media = value[0];
                                        });
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Media:"),
                                  RatingBar(
                                    initialRating: media.toDouble(),
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                    itemSize: 15,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
              ),
            ),
          );
        }
      },
      bloc: storicoBloc,
    );
  }

  @override
  void initState() {
    storicoBloc = StoricoBloc();
    storicoBloc.add(GetData());
    super.initState();
  }
}
