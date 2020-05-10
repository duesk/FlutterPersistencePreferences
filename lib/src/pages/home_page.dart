import 'package:flutter/material.dart';
 
 

class HomePage extends StatelessWidget {

  static final String routeName = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
      ),
      drawer: _crearMenu() ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Color Secundario"),
            Divider(),
            Text("Género:"),
            Divider(),
            Text("Nombre de usuario:"),
            Divider(),
          ],)
      )
    );
  }

  Drawer _crearMenu(){

    return Drawer(); 

  }

}