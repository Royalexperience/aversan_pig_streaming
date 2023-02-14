import 'package:crypt/crypt.dart';

// Questa classe serve per la gestione della criptazione e decriptazione
// della password
class APSEncrypt {
  static String encrypt(String text) {
    String textEncrypted = (Crypt.sha256(text).toString());
    return textEncrypted;
  }
}