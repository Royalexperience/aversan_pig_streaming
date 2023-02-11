import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class API {
  static String connectionString = '';

  static Future<void> buildConnectionString() async {
    // Permette di accedere al file contenente le variabili d'ambiente
    // come se fosse una mappa
    await dotenv.load();
    // Leggi i valori dal file di configurazione
    String username = dotenv.get('USERSDB_USERNAME');
    String password = dotenv.get('USERSDB_PASSWORD');
    String ip = dotenv.get('USERSDB_IP');
    String name = dotenv.get('USERSDB_NAME');
    // Ritorna la stringa di connessione al db
    connectionString = "postgres://$username:$password@$ip/$name?sslmode=disable";
  }

  static Future<http.Response> post(data) async {
    return await http.post(
        Uri.parse(connectionString),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
  }
}