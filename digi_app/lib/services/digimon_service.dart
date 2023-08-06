
import 'dart:convert';
import 'dart:io';

import 'package:digi_app/models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../_environments/index.dart';

const digiStorage = FlutterSecureStorage();
MensajesAlertas digiMensajesProspectoService = MensajesAlertas();
ResponseValidation digiResponseValidationService = ResponseValidation();

class DigimonService extends ChangeNotifier{

  final String endPoint = CadenaConexion().apiDigimons;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProspectoType? objRspProsp;
  ProspectoTypeResponse? varObjTipoRsp;
  ClientTypeResponse? varObjRspRegistro;
  String varPassWordActual = '';
  String varPassWord = '';
  String varPassWordConfirm = '';
  DigimonModel? digiModel;

  bool isOscuredConfirm = true;
  bool get varIsOscuredConfirm => isOscuredConfirm;
  set varIsOscuredConfirm (bool value){
    isOscuredConfirm = value;
    notifyListeners();
  }

  bool tieneUbicacion = false;
  bool get varTieneUbicacion => tieneUbicacion;
  set varTieneUbicacion(bool value){
    tieneUbicacion = value;
    notifyListeners();
  }

  String varDireccion = '';
  String varCorreo = '';
  String varUbicacionLat = '';
  String varUbicacionLong = '';


  String cedulaSelect = 'assets/BtnCedula_Gris.png';
  String pasaporteSelect = 'assets/BtnPasaporte_Blanco.png';

  String get varCedulaSelect => cedulaSelect;
  set varCedulaSelect (String value){
    cedulaSelect = value;
    notifyListeners();
  }

  String get varPasaporteSelect => pasaporteSelect;
  set varPasaporteSelect (String value){
    pasaporteSelect = value;
    notifyListeners();
  }

  String varCedula = '';
  String varPasaporte = '';

  bool isOscuredAntigua = true;
  bool get varIsOscuredAntigua => isOscuredAntigua;
  set varIsOscuredAntigua (bool value){
    isOscuredAntigua = value;
    notifyListeners();
  }

  bool isOscured = true;
  bool get varIsOscured => isOscured;
  set varIsOscured (bool value){
    isOscured = value;
    notifyListeners();
  }


  getDigimons(String cantidadPage) async {
    try{
      final baseURL = '$endPoint?pageSize=$cantidadPage';//endPoint;//20

      final varResponse = await http.get(Uri.parse(baseURL));
      if(varResponse.statusCode != 200) return null;

      final prospRsp = DigimonModel.fromJson(varResponse.body);
      digiModel = prospRsp;
      
      notifyListeners();
    }
    on SocketException catch (_) {
      Fluttertoast.showToast(
        msg: digiMensajesProspectoService.mensajeFallaInternet,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
          
    }
  }

  Future<bool> llenaData(ProspectoType objPrpTp) async {
    bool frmValido = true;

    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp  = RegExp(pattern);

    if(!regExp.hasMatch(objPrpTp.email)) {
      frmValido = false;
    }
    

    if(objPrpTp.fechaNacimiento.trim() == '' || objPrpTp.genero.trim() == null || objPrpTp.genero.trim() == 'S' || objPrpTp.direccion.trim() == null || objPrpTp.direccion.trim() == ''  || objPrpTp.email.trim() == '' || objPrpTp.longitud == 0 || objPrpTp.longitud == 0) {
      frmValido = false;
    }
    return frmValido;
  }

  registraProspecto(ProspectoType objLlenoProsp) async {
    String fechaNacimientoProsp = DateFormat('yyyy-MM-dd').format(objLlenoProsp.fechaNacDate);

    final baseURL = '${endPoint}Clientes/CreateCliente';

    String latitudString = objLlenoProsp.latitud.toString();
    String longitudString = objLlenoProsp.longitud.toString();

    final response = await http.post(
        Uri.parse(baseURL),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>
          {
            "tipoidentificacion": objLlenoProsp.tipoIdentificacion,
            "identificacion": objLlenoProsp.identificacion,
            "genero": objLlenoProsp.genero,
            "latitud": latitudString,
            "longitud": longitudString,
            "direccion": objLlenoProsp.direccion,
            "fechaNacimiento": fechaNacimientoProsp,
            "correo": objLlenoProsp.email,
            "password": varPassWord,      
            "tipoCliente": objLlenoProsp.tipoCliente,
          }
        ),
      );

      final prospRsp = ClientTypeResponse.fromJson(response.body);//aquí va a variar el objeto de respuesta cuando se cree el token por el api
      varObjRspRegistro = prospRsp;
    
    notifyListeners();
  }

}
