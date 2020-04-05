import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:survival_kit/entities/service_provider.dart';
import 'package:survival_kit/entities/user.dart';
import 'package:survival_kit/services/server_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service providers'),
        actions: <Widget>[Icon(Icons.shopping_basket)],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder<List<ServiceProvider>>(
            future: ServerService.getServiceProviders(),
            builder: (context, snapShot) {
              return snapShot.connectionState != ConnectionState.done
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      children: <Widget>[
                        ...snapShot.data.map((provider) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/services', arguments: provider.name);
                            },
                            child: Card(
                                margin: EdgeInsets.all(10),
                                elevation: 5,
                                color: Colors.grey[350],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                    padding: EdgeInsets.all(15),
                                    height: 100,
                                    width: double.infinity,
                                    child: Text(provider.name))),
                          );
                        })
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
