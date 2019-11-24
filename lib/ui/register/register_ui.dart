import 'package:confsalute/global_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController id = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nome = TextEditingController();
  TextEditingController cognome = TextEditingController();
  GlobalBloc globalBloc;

  @override
  void initState() {
    globalBloc = BlocProvider.of<GlobalBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cooperazione Salute"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(24),
                width: width * 0.7,
                child: TextField(
                  controller: id,
                  decoration: InputDecoration(
                      labelText: "Codice identificativo",
                      prefixIcon: Icon(Icons.perm_identity)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(24),
                width: width * 0.7,
                child: TextField(
                  controller: nome,
                  decoration: InputDecoration(
                      labelText: "Nome",
                      prefixIcon: Icon(Icons.account_circle)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(24),
                width: width * 0.7,
                child: TextField(
                  controller: cognome,
                  decoration: InputDecoration(
                      labelText: "Cognome",
                      prefixIcon: Icon(Icons.account_circle)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(24),
                width: width * 0.7,
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      labelText: "Indirizzo email",
                      prefixIcon: Icon(Icons.mail)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(24),
                width: width * 0.7,
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                      ),
                      labelText: "Password",
                      prefixIcon: Icon(Icons.vpn_key)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(24),
                width: width * 0.5,
                height: 50,
                child: OutlineButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegisterPage()));
                  },
                  child: Text(
                    "REGISTRATI",
                    style: TextStyle(color: Colors.blue),
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
}
