// Questa classe fornisce alcuni metodi utili per costruire test efficaci
import 'dart:math';
import 'package:flutter/material.dart';

class HelperTest {
  // Metodo per la creazione di un widget testabile senza il bisogno di racchiuderlo in un Material widget
  static Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(), 
      child: MaterialApp(home: widget)
    );
  }
  // Metodo per creare un widget testabile che deve essere racchiuso in un Material widget
  static Widget buildMaterialTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(), 
      child: MaterialApp(
        home: Scaffold(
          body: widget
        )
      )
    );
  }
  // Generazione di una stringa casuale con una lunghezza specifica
  static String getRandomText(int length) {
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))
      )
    );
  }
}