import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// The user or the chat was banned (and hence is not a member of the chat).
/// Implies the user can't return to the chat, view messages, or be used as a
/// participant identifier to join a video chat of the chat
@immutable
class ChatMemberStatusBanned extends ChatMemberStatus {
  const ChatMemberStatusBanned({
    required this.bannedUntilDate,
  });

  /// [bannedUntilDate] Point in time (Unix timestamp) when the user will be
  /// unbanned; 0 if never. If the user is banned for more than 366 days or for
  /// less than 30 seconds from the current time, the user is considered to be
  /// banned forever. Always 0 in basic groups
  final int bannedUntilDate;

  static const String constructor = 'chatMemberStatusBanned';

  static ChatMemberStatusBanned? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return ChatMemberStatusBanned(
      bannedUntilDate: json['banned_until_date'] as int,
    );
  }

  @override
  String getConstructor() => constructor;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'banned_until_date': bannedUntilDate,
        '@type': constructor,
      };

  @override
  bool operator ==(Object other) => overriddenEquality(other);

  @override
  int get hashCode => overriddenHashCode;
}
