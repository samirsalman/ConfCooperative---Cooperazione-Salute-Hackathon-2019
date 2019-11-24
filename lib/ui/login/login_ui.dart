import 'package:confsalute/global_bloc/bloc.dart';
import 'package:confsalute/global_bloc/global_bloc.dart';
import 'package:confsalute/ui/register/register_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalBloc globalBloc;
  bool visible = false;
  bool check = false;

  changeCheck(value) {
    setState(() {
      check = value;
    });
  }

  changeVisible() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
    ));
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Accedi",
                style: TextStyle(fontSize: 32),
              ),
              Container(
                margin: EdgeInsets.all(24),
                width: width,
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      labelText: "Username",
                      prefixIcon: Icon(Icons.account_circle)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(24),
                width: width,
                child: TextField(
                  obscureText: !visible,
                  controller: password,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: () {
                            changeVisible();
                          }),
                      labelText: "Password",
                      prefixIcon: Icon(Icons.vpn_key)),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Checkbox(
                          value: check,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (value) {
                            changeCheck(value);
                          }),
                      Text(
                        "Ricordami",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      )
                    ],
                  ),
                  Text(
                    "Password dimenticata?",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.grey),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(24),
                width: width,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    print("Accedi");
                    globalBloc.add(Login(username.text, password.text));
                  },
                  child: Text(
                    "ACCEDI",
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Text(
                "oppure",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Container(
                margin: EdgeInsets.all(24),
                width: width,
                height: 50,
                child: OutlineButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegisterPage()));
                  },
                  child: Text(
                    "REGISTRATI",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  color: Colors.blue,
                ),
              )
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
