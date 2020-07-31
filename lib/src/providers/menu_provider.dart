import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];
  _MenuProvider() {
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');

    Map mapData = json.decode(resp);
    // print(mapData['rutas']);
    opciones = mapData['rutas'];

    return opciones;
  }
}

final menuProvider = _MenuProvider();
