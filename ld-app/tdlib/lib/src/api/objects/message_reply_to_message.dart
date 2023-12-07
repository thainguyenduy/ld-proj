import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// Describes a message replied by a given message
@immutable
class MessageReplyToMessage extends MessageReplyTo {
  const MessageReplyToMessage({
    required this.chatId,
    required this.messageId,
    this.quote,
    required this.isQuoteManual,
    this.origin,
    required this.originSendDate,
    this.content,
  });

  /// [chatId] The identifier of the chat to which the message belongs; may be 0
  /// if the replied message is in unknown chat
  final int chatId;

  /// [messageId] The identifier of the message; may be 0 if the replied message
  /// is in unknown chat
  final int messageId;

  /// [quote] Manually or automatically chosen quote from the replied message;
  /// may be null if none. Only Bold, Italic, Underline, Strikethrough, Spoiler,
  /// and CustomEmoji entities can be present in the quote
  final FormattedText? quote;

  /// [isQuoteManual] True, if the quote was manually chosen by the message
  /// sender
  final bool isQuoteManual;

  /// [origin] Information about origin of the message if the message was from
  /// another chat or topic; may be null for messages from the same chat
  final MessageOrigin? origin;

  /// [originSendDate] Point in time (Unix timestamp) when the message was sent
  /// if the message was from another chat or topic; 0 for messages from the
  /// same chat
  final int originSendDate;

  /// [content] Media content of the message if the message was from another
  /// chat or topic; may be null for messages from the same chat and messages
  /// without media. Can be only one of the following types: messageAnimation,
  /// messageAudio, messageContact, messageDice, messageDocument, messageGame,
  /// messageInvoice, messageLocation, messagePhoto, messagePoll,
  /// messagePremiumGiveaway, messageSticker, messageStory, messageText (for
  /// link preview), messageVenue, messageVideo, messageVideoNote, or
  /// messageVoiceNote
  final MessageContent? content;

  static const String constructor = 'messageReplyToMessage';

  static MessageReplyToMessage? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return MessageReplyToMessage(
      chatId: json['chat_id'] as int,
      messageId: json['message_id'] as int,
      quote: FormattedText.fromJson(json['quote'] as Map<String, dynamic>?),
      isQuoteManual: json['is_quote_manual'] as bool,
      origin: MessageOrigin.fromJson(json['origin'] as Map<String, dynamic>?),
      originSendDate: json['origin_send_date'] as int,
      content:
          MessageContent.fromJson(json['content'] as Map<String, dynamic>?),
    );
  }

  @override
  String getConstructor() => constructor;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'chat_id': chatId,
        'message_id': messageId,
        'quote': quote?.toJson(),
        'is_quote_manual': isQuoteManual,
        'origin': origin?.toJson(),
        'origin_send_date': originSendDate,
        'content': content?.toJson(),
        '@type': constructor,
      };

  @override
  bool operator ==(Object other) => overriddenEquality(other);

  @override
  int get hashCode => overriddenHashCode;
}
