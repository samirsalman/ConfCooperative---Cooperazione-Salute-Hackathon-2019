import 'package:confsalute/global_bloc/bloc.dart';
import 'package:confsalute/global_bloc/global_bloc.dart';
import 'package:confsalute/ui/calendar/calendar.dart';
import 'package:confsalute/ui/cashback/cashback.dart';
import 'package:confsalute/ui/home_page/home_page.dart';
import 'package:confsalute/ui/login/login_ui.dart';
import 'package:confsalute/ui/notifiche/notifiche.dart';
import 'package:confsalute/ui/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [
    HomePage(),
    CashBack(),
    ProfilePage(),
    Calendar(),
    Notifiche(),
  ];
  GlobalBloc globalBloc;

  int index = 0;

  changeIndex(value) {
    setState(() {
      index = value;
    });
  }

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
    BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), title: Text("Cashback")),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle), title: Text("Profilo")),
    BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today), title: Text("Calendario")),
    BottomNavigationBarItem(
        icon: Icon(Icons.notifications_active), title: Text("Notifiche")),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
    ));
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Color.fromRGBO(130, 160, 204, 1),
          unselectedItemColor: Colors.grey.withOpacity(0.6),
          selectedIconTheme: IconThemeData(size: 30),
          items: items,
          currentIndex: index,
          onTap: (value) => changeIndex(value),
        ),
        body: pages[index]);
  }

  @override
  void initState() {
    globalBloc = BlocProvider.of(context);
    super.initState();
  }
}
