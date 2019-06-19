import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

String _search;
int _offset = 0;

Future<Map> _getGifs()async{
  http.Response response;
  if(_search == null || _search.isEmpty)
    response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=RqYAY2JMuii9ZAhPIgynweYX9gRc3X2r&limit=20&rating=G");
  else
    response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=RqYAY2JMuii9ZAhPIgynweYX9gRc3X2r&q=$_search&limit=20&offset=$_offset&rating=G&lang=en");

  return json.decode(response.body);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network("https://developers.giphy.com/branch/master/static/header-logo-8974b8ae658f704a5b48a2d039b8ad93.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                decoration: InputDecoration(
                  labelText: "Pesquise Aqui!",
                  labelStyle: TextStyle(color: Colors.white,),
                  border: OutlineInputBorder()
                ),
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
              ),),
          ],),
        ),
    );
  }
}

