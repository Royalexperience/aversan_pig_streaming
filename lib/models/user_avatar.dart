/// Questa classe rappresenta le informazioni di ogni avatar presente nella avata gallery
class UserAvatar {
  final String _avatarName;
  final String _avatarImagePath;

  const UserAvatar(this._avatarName, this._avatarImagePath);

  static String getUserAvatarPathFromName(String folderPath, String avatarName, {String imageFormat = "png"}) {
    return '$folderPath${avatarName.toLowerCase()}.$imageFormat';
  }

  get getAvatarName {
    return _avatarName;
  }

  get getAvatarImagePath {
    return _avatarImagePath;
  }
}