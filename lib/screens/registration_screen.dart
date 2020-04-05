import 'package:flutter/material.dart';
import 'package:survival_kit/entities/user.dart';
import 'package:survival_kit/services/auth_service.dart';
import 'package:survival_kit/services/service_status.dart';
import 'package:survival_kit/widgets/drop_down_list_widget.dart';

class RegistrationSrceen extends StatefulWidget {
  @override
  _RegistrationSrceenState createState() => _RegistrationSrceenState();
}

class _RegistrationSrceenState extends State<RegistrationSrceen> {
  final GlobalKey<FormState> _regFormKey = GlobalKey<FormState>();
  final User _user = User();

  final _passwordController = TextEditingController();

  var _regStatus = ServiceStatus.NOT_STATED;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _regFormKey,
            child: Column(
              children: <Widget>[
                DropDownList(
                  items: [1, 2, 3, 4],
                  lableText: 'Select role',
                  user: _user,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (input) =>
                      input.isEmpty ? 'Please enter name' : null,
                  onSaved: (input) => _user.name = input,
                  initialValue: 'andrey',
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  onSaved: (input) => _user.email = input,
                  initialValue: 'test@test.com',
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'User name'),
                  onSaved: (input) => _user.userName = input,
                  initialValue: 'Andrey',
                  validator: (input) =>
                      input.isEmpty ? 'Please enter user name' : null,
                ),
                TextFormField(
                    decoration: InputDecoration(labelText: 'Phone number'),
                    onSaved: (input) => _user.phoneNumber = input,
                    initialValue: '11-22-33-44',
                    keyboardType: TextInputType.number),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  onSaved: (input) => _user.password = input,
                  controller: _passwordController,
                  validator: (input) =>
                      input.isEmpty ? 'Please enter your password' : null,
                  obscureText: true,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: _regStatus == ServiceStatus.PROGRESS
                      ? CircularProgressIndicator()
                      : RaisedButton(
                          child: Text('Register'),
                          onPressed: () {
                            if (_regFormKey.currentState.validate()) {
                              _regFormKey.currentState.save();
                              setState(() {
                                _regStatus = ServiceStatus.PROGRESS;
                              });

                              AuthService.registrate(_user).then(
                                (regStatus) {
                                  if (regStatus.statusCode == 201) {
                                    Navigator.pop(context);
                                  } else {
                                    setState(() {
                                      _regStatus = ServiceStatus.ERROR;
                                    });
                                  }
                                },
                              );
                            }
                          },
                        ),
                ),
                if (_regStatus == ServiceStatus.ERROR)
                  Text(
                    'Cannot registrate user',
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
