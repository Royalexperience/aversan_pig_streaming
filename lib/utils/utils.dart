import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/models/user_avatar.dart';

// Questa classe è usata per costruire il percorso delle immagini
class Utils {
  static List<UserAvatar> getUserAvatarList() {
    return [
      UserAvatar(AVATAR_DEFAULT_IMAGE, '$AVATAR_PATH${AVATAR_DEFAULT_IMAGE.toLowerCase()}.png'),
      UserAvatar(AVATAR_NAME_LAURA, '$AVATAR_PATH${AVATAR_NAME_LAURA.toLowerCase()}.png'),
      UserAvatar(AVATAR_NAME_CASSANDRA, '$AVATAR_PATH${AVATAR_NAME_CASSANDRA.toLowerCase()}.png'),
      UserAvatar(AVATAR_NAME_SUSANNE, '$AVATAR_PATH${AVATAR_NAME_SUSANNE.toLowerCase()}.png'),
      UserAvatar(AVATAR_NAME_MARIA, '$AVATAR_PATH${AVATAR_NAME_MARIA.toLowerCase()}.png'),
      UserAvatar(AVATAR_NAME_ROBERTA, '$AVATAR_PATH${AVATAR_NAME_ROBERTA.toLowerCase()}.png'),
      UserAvatar(AVATAR_NAME_JOE, '$AVATAR_PATH${AVATAR_NAME_JOE.toLowerCase()}.png'),
      UserAvatar(AVATAR_NAME_MARIO, '$AVATAR_PATH${AVATAR_NAME_MARIO.toLowerCase()}.png'),
      UserAvatar(AVATAR_NAME_JACK, '$AVATAR_PATH${AVATAR_NAME_JACK.toLowerCase()}.png'),
      UserAvatar(AVATAR_NAME_GENNY, '$AVATAR_PATH${AVATAR_NAME_GENNY.toLowerCase()}.png'),
    ];
  }
}