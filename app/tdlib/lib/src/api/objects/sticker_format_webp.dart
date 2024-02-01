import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// The sticker is an image in WEBP format
@immutable
class StickerFormatWebp extends StickerFormat {
  const StickerFormatWebp();

  static const String constructor = 'stickerFormatWebp';

  static StickerFormatWebp? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return const StickerFormatWebp();
  }

  @override
  String getConstructor() => constructor;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        '@type': constructor,
      };

  @override
  bool operator ==(Object other) => overriddenEquality(other);

  @override
  int get hashCode => overriddenHashCode;
}
