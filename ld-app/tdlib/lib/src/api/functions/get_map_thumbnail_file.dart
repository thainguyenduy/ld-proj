import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// Returns information about a file with a map thumbnail in PNG format. Only
/// map thumbnail files with size less than 1MB can be downloaded
/// Returns [File]
@immutable
class GetMapThumbnailFile extends TdFunction {
  const GetMapThumbnailFile({
    required this.location,
    required this.zoom,
    required this.width,
    required this.height,
    required this.scale,
    required this.chatId,
  });

  /// [location] Location of the map center
  final Location location;

  /// [zoom] Map zoom level; 13-20
  final int zoom;

  /// [width] Map width in pixels before applying scale; 16-1024
  final int width;

  /// [height] Map height in pixels before applying scale; 16-1024
  final int height;

  /// [scale] Map scale; 1-3
  final int scale;

  /// [chatId] Identifier of a chat in which the thumbnail will be shown. Use 0
  /// if unknown
  final int chatId;

  static const String constructor = 'getMapThumbnailFile';

  @override
  String getConstructor() => constructor;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'location': location.toJson(),
        'zoom': zoom,
        'width': width,
        'height': height,
        'scale': scale,
        'chat_id': chatId,
        '@type': constructor,
      };

  @override
  bool operator ==(Object other) => overriddenEquality(other);

  @override
  int get hashCode => overriddenHashCode;
}
