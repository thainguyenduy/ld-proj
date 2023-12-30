import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// Describes a video file
@immutable
class Video extends TdObject {
  const Video({
    required this.duration,
    required this.width,
    required this.height,
    required this.fileName,
    required this.mimeType,
    required this.hasStickers,
    required this.supportsStreaming,
    this.minithumbnail,
    this.thumbnail,
    required this.video,
  });

  /// [duration] Duration of the video, in seconds; as defined by the sender
  final int duration;

  /// [width] Video width; as defined by the sender
  final int width;

  /// [height] Video height; as defined by the sender
  final int height;

  /// [fileName] Original name of the file; as defined by the sender
  final String fileName;

  /// [mimeType] MIME type of the file; as defined by the sender
  final String mimeType;

  /// [hasStickers] True, if stickers were added to the video. The list of
  /// corresponding sticker sets can be received using getAttachedStickerSets
  final bool hasStickers;

  /// [supportsStreaming] True, if the video is supposed to be streamed
  final bool supportsStreaming;

  /// [minithumbnail] Video minithumbnail; may be null
  final Minithumbnail? minithumbnail;

  /// [thumbnail] Video thumbnail in JPEG or MPEG4 format; as defined by the
  /// sender; may be null
  final Thumbnail? thumbnail;

  /// [video] File containing the video
  final File video;

  static const String constructor = 'video';

  static Video? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return Video(
      duration: json['duration'] as int,
      width: json['width'] as int,
      height: json['height'] as int,
      fileName: json['file_name'] as String,
      mimeType: json['mime_type'] as String,
      hasStickers: json['has_stickers'] as bool,
      supportsStreaming: json['supports_streaming'] as bool,
      minithumbnail: Minithumbnail.fromJson(
          json['minithumbnail'] as Map<String, dynamic>?),
      thumbnail: Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>?),
      video: File.fromJson(json['video'] as Map<String, dynamic>?)!,
    );
  }

  @override
  String getConstructor() => constructor;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'duration': duration,
        'width': width,
        'height': height,
        'file_name': fileName,
        'mime_type': mimeType,
        'has_stickers': hasStickers,
        'supports_streaming': supportsStreaming,
        'minithumbnail': minithumbnail?.toJson(),
        'thumbnail': thumbnail?.toJson(),
        'video': video.toJson(),
        '@type': constructor,
      };

  @override
  bool operator ==(Object other) => overriddenEquality(other);

  @override
  int get hashCode => overriddenHashCode;
}
