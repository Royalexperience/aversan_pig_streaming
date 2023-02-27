import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/models/user_avatar.dart';

class Utils {
  // Questa metodo è usata per costruire una lista di avatar
  static List<UserAvatar> getUserAvatarList() {
    return [
      UserAvatar(AVATAR_DEFAULT_IMAGE, UserAvatar.getUserAvatarPathFromName(AVATAR_PATH, AVATAR_DEFAULT_IMAGE)),
      UserAvatar(AVATAR_NAME_LAURA, UserAvatar.getUserAvatarPathFromName(AVATAR_PATH, AVATAR_NAME_LAURA)),
      UserAvatar(AVATAR_NAME_CASSANDRA, UserAvatar.getUserAvatarPathFromName(AVATAR_PATH, AVATAR_NAME_CASSANDRA)),
      UserAvatar(AVATAR_NAME_SUSANNE, UserAvatar.getUserAvatarPathFromName(AVATAR_PATH, AVATAR_NAME_SUSANNE)),
      UserAvatar(AVATAR_NAME_MARIA, UserAvatar.getUserAvatarPathFromName(AVATAR_PATH, AVATAR_NAME_MARIA)),
      UserAvatar(AVATAR_NAME_ROBERTA, UserAvatar.getUserAvatarPathFromName(AVATAR_PATH, AVATAR_NAME_ROBERTA)),
      UserAvatar(AVATAR_NAME_JOE, UserAvatar.getUserAvatarPathFromName(AVATAR_PATH, AVATAR_NAME_JOE)),
      UserAvatar(AVATAR_NAME_MARIO, UserAvatar.getUserAvatarPathFromName(AVATAR_PATH, AVATAR_NAME_MARIO)),
      UserAvatar(AVATAR_NAME_JACK, UserAvatar.getUserAvatarPathFromName(AVATAR_PATH, AVATAR_NAME_JACK)),
      UserAvatar(AVATAR_NAME_GENNY, UserAvatar.getUserAvatarPathFromName(AVATAR_PATH, AVATAR_NAME_GENNY)),
    ];
  }
}