import 'package:confsalute/ui/login/login_ui.dart';
import 'package:confsalute/ui/main-page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'global_bloc/bloc.dart';

void main() {
  runApp(BlocProvider<GlobalBloc>(
      builder: (context) => GlobalBloc()..add(StartApp()), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ConfSalute',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: "Alatsi",
        primaryColor: Color.fromRGBO(98, 125, 232, 1),
        primaryColorDark: Color.fromRGBO(98, 125, 232, 1),
      ),
      home: MyHomePage(title: 'ConfSalute'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<GlobalBloc>(context),
        builder: (context, state) {
          if (state is SplashScreen) {
            return Scaffold(
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

          if (state is NotAuthorized) {
            return LoginPage();
          }

          if (state is Authorized) {
            return MainPage();
          }
        });
  }
}
