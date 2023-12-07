import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// Describes a chat or user profile photo
@immutable
class ChatPhoto extends TdObject {
  const ChatPhoto({
    required this.id,
    required this.addedDate,
    this.minithumbnail,
    required this.sizes,
    this.animation,
    this.smallAnimation,
    this.sticker,
  });

  /// [id] Unique photo identifier
  final int id;

  /// [addedDate] Point in time (Unix timestamp) when the photo has been added
  final int addedDate;

  /// [minithumbnail] Photo minithumbnail; may be null
  final Minithumbnail? minithumbnail;

  /// [sizes] Available variants of the photo in JPEG format, in different size
  final List<PhotoSize> sizes;

  /// [animation] A big (up to 1280x1280) animated variant of the photo in MPEG4
  /// format; may be null
  final AnimatedChatPhoto? animation;

  /// [smallAnimation] A small (160x160) animated variant of the photo in MPEG4
  /// format; may be null even the big animation is available
  final AnimatedChatPhoto? smallAnimation;

  /// [sticker] Sticker-based version of the chat photo; may be null
  final ChatPhotoSticker? sticker;

  static const String constructor = 'chatPhoto';

  static ChatPhoto? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return ChatPhoto(
      id: int.tryParse(json['id']) ?? 0,
      addedDate: json['added_date'] as int,
      minithumbnail: Minithumbnail.fromJson(
          json['minithumbnail'] as Map<String, dynamic>?),
      sizes: List<PhotoSize>.from(
          ((json['sizes'] as List<dynamic>?) ?? <dynamic>[])
              .map((item) => PhotoSize.fromJson(item))
              .toList()),
      animation: AnimatedChatPhoto.fromJson(
          json['animation'] as Map<String, dynamic>?),
      smallAnimation: AnimatedChatPhoto.fromJson(
          json['small_animation'] as Map<String, dynamic>?),
      sticker:
          ChatPhotoSticker.fromJson(json['sticker'] as Map<String, dynamic>?),
    );
  }

  @override
  String getConstructor() => constructor;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id.toString(),
        'added_date': addedDate,
        'minithumbnail': minithumbnail?.toJson(),
        'sizes': sizes.map((item) => item.toJson()).toList(),
        'animation': animation?.toJson(),
        'small_animation': smallAnimation?.toJson(),
        'sticker': sticker?.toJson(),
        '@type': constructor,
      };

  @override
  bool operator ==(Object other) => overriddenEquality(other);

  @override
  int get hashCode => overriddenHashCode;
}
