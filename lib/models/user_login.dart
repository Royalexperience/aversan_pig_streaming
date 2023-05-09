/// Questa classe è usata per creare un oggetto di tipo UserLogin
/// da condividere tra le varie schermate, dopo che il login è
/// andato a buon fine.

class UserLogin {
  final String _email;
  final String _username;

  UserLogin(this._email, this._username);

  String get email => _email;

  String get username => _username;
}