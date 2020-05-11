import 'package:flutter/material.dart';
import 'package:preferencias/src/Share_prefs/preferencias_usuario.dart';
import 'package:preferencias/src/widgets/menu_widget.dart';

 
class SettingsPage extends StatefulWidget {

  static final String routeName = "settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _textControler ;  

  final prefs = new PreferenciasUsuario();
  


  @override
  void initState() {
    super.initState();

    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombreUsuario;


    _textControler = new TextEditingController(text:_nombre);
  }

  _setSelectedRadio(int valor) {
    prefs.genero = valor;
    _genero = valor;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {

    prefs.ultimaPagina = "settings";

    return Scaffold (
      drawer: MenuWidget(),
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text("settings", 
                        style: TextStyle(fontSize: 45.0, fontWeight:FontWeight.bold) ,),
          ),

          Divider(),

          SwitchListTile(
            value: _colorSecundario, 
            title: Text("Color secundario"),
            onChanged:(value){
              _colorSecundario = value;
              prefs.colorSecundario = value;
              setState(() {  
              }); 
            },
          ),

          RadioListTile(
            value: 1, //identificador 
            title: Text("Masculino"),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          RadioListTile(
            value: 2, //identificador 
            title: Text("Femenino"),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          
          Divider(),
          
          Container(
            padding: EdgeInsets.symmetric(horizontal:20.0),
            child: TextField(
              controller: _textControler,
              decoration: InputDecoration(
                labelText: "Nombre",
                helperText: "Nombre del usuario"
              ),
              onChanged: (value){
                prefs.nombreUsuario = value;
              },
            ),
          ),


          
        ],
      )
    );
  }
}