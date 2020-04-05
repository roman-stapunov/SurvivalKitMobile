import 'package:flutter/material.dart';
import 'package:survival_kit/services/auth_service.dart';
import 'package:survival_kit/services/service_status.dart';

class LoginSrceen extends StatefulWidget {
  @override
  _LoginSrceenState createState() => _LoginSrceenState();
}

class _LoginSrceenState extends State<LoginSrceen> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String _login;
  String _password;

  var _loginStatus = ServiceStatus.NOT_STATED;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _loginFormKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Login'),
                  validator: (input) =>
                      input.isEmpty ? 'Please enter your login' : null,
                  onSaved: (input) => _login = input,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (input) =>
                      input.isEmpty ? 'Please enter your password' : null,
                  onSaved: (input) => _password = input,
                  obscureText: true,
                ),
                FlatButton(
                  child: Text(
                    'Registrate new user',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/reg'),
                ),
                _loginStatus == ServiceStatus.PROGRESS
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        child: Text('Login'),
                        onPressed: () {
                          if (_loginFormKey.currentState.validate()) {
                            _loginFormKey.currentState.save();
                            setState(() {
                              _loginStatus = ServiceStatus.PROGRESS;
                            });
                            AuthService.login(_login, _password)
                                .then((loginResult) {
                              if (loginResult) {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              } else {
                                setState(() {
                                  _loginStatus = ServiceStatus.ERROR;
                                });
                              }
                            });
                          }
                        },
                      ),
                if (_loginStatus == ServiceStatus.ERROR)
                  Text(
                    'Log in error',
                    style: TextStyle(color: Colors.red),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
