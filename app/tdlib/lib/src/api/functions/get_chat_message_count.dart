import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// Returns approximate number of messages of the specified type in the chat
/// Returns [Count]
@immutable
class GetChatMessageCount extends TdFunction {
  const GetChatMessageCount({
    required this.chatId,
    required this.filter,
    required this.returnLocal,
  });

  /// [chatId] Identifier of the chat in which to count messages
  final int chatId;

  /// [filter] Filter for message content; searchMessagesFilterEmpty is
  /// unsupported in this function
  final SearchMessagesFilter filter;

  /// [returnLocal] Pass true to get the number of messages without sending
  /// network requests, or -1 if the number of messages is unknown locally
  final bool returnLocal;

  static const String constructor = 'getChatMessageCount';

  @override
  String getConstructor() => constructor;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'chat_id': chatId,
        'filter': filter.toJson(),
        'return_local': returnLocal,
        '@type': constructor,
      };

  @override
  bool operator ==(Object other) => overriddenEquality(other);

  @override
  int get hashCode => overriddenHashCode;
}
