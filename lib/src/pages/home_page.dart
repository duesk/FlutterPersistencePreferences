import 'package:flutter/material.dart';
import 'package:preferencias/src/Share_prefs/preferencias_usuario.dart';
import 'package:preferencias/src/widgets/menu_widget.dart';
 


class HomePage extends StatelessWidget {

  static final String routeName = "home";
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    prefs.ultimaPagina = "home";
    return Scaffold (
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget() ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Color Secundario : ${prefs.colorSecundario}"),
            Divider(),
            _generoText(),
            Divider(),
            Text("Nombre de usuario: ${prefs.nombreUsuario}"),
            Divider(),
          ],)
      )
    );
  }

  Text _generoText(){
    if (prefs.genero == 1){
      return Text("Género: Masculino");
    }else{
      return Text("Género: Femenino");
    }
  }

}