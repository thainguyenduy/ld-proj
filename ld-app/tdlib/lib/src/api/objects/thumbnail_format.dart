import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// Describes format of a thumbnail
@immutable
abstract class ThumbnailFormat extends TdObject {
  const ThumbnailFormat();

  static const String constructor = 'thumbnailFormat';

  /// Inherited by:
  /// [ThumbnailFormatGif]
  /// [ThumbnailFormatJpeg]
  /// [ThumbnailFormatMpeg4]
  /// [ThumbnailFormatPng]
  /// [ThumbnailFormatTgs]
  /// [ThumbnailFormatWebm]
  /// [ThumbnailFormatWebp]
  static ThumbnailFormat? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    switch (json['@type']) {
      case ThumbnailFormatGif.constructor:
        return ThumbnailFormatGif.fromJson(json);
      case ThumbnailFormatJpeg.constructor:
        return ThumbnailFormatJpeg.fromJson(json);
      case ThumbnailFormatMpeg4.constructor:
        return ThumbnailFormatMpeg4.fromJson(json);
      case ThumbnailFormatPng.constructor:
        return ThumbnailFormatPng.fromJson(json);
      case ThumbnailFormatTgs.constructor:
        return ThumbnailFormatTgs.fromJson(json);
      case ThumbnailFormatWebm.constructor:
        return ThumbnailFormatWebm.fromJson(json);
      case ThumbnailFormatWebp.constructor:
        return ThumbnailFormatWebp.fromJson(json);
      default:
        return null;
    }
  }

  @override
  String getConstructor() => constructor;

  @override
  bool operator ==(Object other) => overriddenEquality(other);

  @override
  int get hashCode => overriddenHashCode;
}
