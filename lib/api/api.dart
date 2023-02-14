import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Questa classe permette di gestire le http request
class API {
  static String _postURL = '';

  // Legge le variabili contenute nel file .env
  static Future<void> readEnvFile() async {
    // Permette di accedere al file contenente le variabili d'ambiente
    // come se fosse una mappa
    await dotenv.load();
    // Leggi i valori dal file di configurazione
    String serverIP = dotenv.get('SERVER_IP');
    String insertUser = dotenv.get('INSERT_USER');
    // Ritorna la stringa di connessione al db
    _postURL = "$serverIP$insertUser";
  }

  // Gestione dell'http post method
  static Future<http.Response> post(data) async {
    return await http.post(
        Uri.parse(_postURL),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
  }
}