import 'package:flutter/material.dart';

class ServicesScreen extends StatefulWidget {
  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('$args services'),
        actions: <Widget>[Icon(Icons.shopping_basket)],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            ...List.generate(15, (index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Test service $index'),
                    RaisedButton(child: Text('Order'), onPressed: (){}, color: Colors.green[100],)
                  ],
                ),
              );
            }),
          ]),
        ),
      ),
    );
  }
}
