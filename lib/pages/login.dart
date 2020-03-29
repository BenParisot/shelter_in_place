import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth.dart';
import 'localization/localizations.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Form with validation
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate('welcome')),
        ),
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(height: 20.0),
                  Text(
                    AppLocalizations.of(context).translate('title'),
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                      onSaved: (value) => _email = value,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) {
                          return AppLocalizations.of(context).translate('enter email');
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: AppLocalizations.of(context).translate('email address'))),
                  TextFormField(
                      onSaved: (value) => _password = value,
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return AppLocalizations.of(context).translate('enter password');
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: AppLocalizations.of(context).translate('password'))),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    child: Text(AppLocalizations.of(context).translate('login button text')),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        // save the fields..
                        final form = _formKey.currentState;
                        form.save();

                        await Provider.of<AuthService>(context)
                            .loginUser(email: _email, password: _password);
                        // Jump into the questionnaire
                        Navigator.pushNamed(context, 'first-question');
                      }
                    },
                  )
                ]))));
  }

  Future _buildErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).translate('error message')),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text(AppLocalizations.of(context).translate('cancel')),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }
}
