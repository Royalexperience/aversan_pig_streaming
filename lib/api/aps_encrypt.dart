import 'package:crypt/crypt.dart';

class APSEncrypt {
  static String encrypt(String text) {
    String textEncrypted = (Crypt.sha256(text).toString());
    return textEncrypted;
  }
}