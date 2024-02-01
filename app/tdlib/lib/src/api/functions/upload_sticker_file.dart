import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// Uploads a file with a sticker; returns the uploaded file
/// Returns [File]
@immutable
class UploadStickerFile extends TdFunction {
  const UploadStickerFile({
    required this.userId,
    required this.stickerFormat,
    required this.sticker,
  });

  /// [userId] Sticker file owner; ignored for regular users
  final int userId;

  /// [stickerFormat] Sticker format
  final StickerFormat stickerFormat;

  /// [sticker]_format Sticker format
  final InputFile sticker;

  static const String constructor = 'uploadStickerFile';

  @override
  String getConstructor() => constructor;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'user_id': userId,
        'sticker_format': stickerFormat.toJson(),
        'sticker': sticker.toJson(),
        '@type': constructor,
      };

  @override
  bool operator ==(Object other) => overriddenEquality(other);

  @override
  int get hashCode => overriddenHashCode;
}
