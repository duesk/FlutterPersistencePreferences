
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();
  
  factory PreferenciasUsuario(){
      return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }


  // bool _colorSecundario;
  // int _genero;
  // String _nombre;

  //GET y SET del Género 
  get genero{
    return _prefs.getInt("genero") ?? 1;
  }
  set genero(int value){
    _prefs.setInt("genero", value);
  }

    //GET y SET del colorSecundario 
  get colorSecundario{
    return _prefs.getBool("color") ?? false;
  }
  set colorSecundario(bool value){
    _prefs.setBool("color", value);
  }

    //GET y SET del nombreUsuario 
  get nombreUsuario{
    return _prefs.getString("nombre") ?? "";
  }
  set nombreUsuario(String value){
    _prefs.setString("nombre", value);
  }

      //GET y SET del ultimaPagina 
  get ultimaPagina{
    return _prefs.getString("ultimaPagina") ?? "home";
  }
  set ultimaPagina(String value){
    _prefs.setString("ultimaPagina", value);
  }

 
}