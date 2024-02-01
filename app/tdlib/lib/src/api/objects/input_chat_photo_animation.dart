import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// An animation in MPEG4 format; must be square, at most 10 seconds long,
/// have width between 160 and 1280 and be at most 2MB in size
@immutable
class InputChatPhotoAnimation extends InputChatPhoto {
  const InputChatPhotoAnimation({
    required this.animation,
    required this.mainFrameTimestamp,
  });

  /// [animation] Animation to be set as profile photo. Only inputFileLocal and
  /// inputFileGenerated are allowed
  final InputFile animation;

  /// [mainFrameTimestamp] Timestamp of the frame, which will be used as static
  /// chat photo
  final double mainFrameTimestamp;

  static const String constructor = 'inputChatPhotoAnimation';

  static InputChatPhotoAnimation? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return InputChatPhotoAnimation(
      animation:
          InputFile.fromJson(json['animation'] as Map<String, dynamic>?)!,
      mainFrameTimestamp: (json['main_frame_timestamp'] as num).toDouble(),
    );
  }

  @override
  String getConstructor() => constructor;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'animation': animation.toJson(),
        'main_frame_timestamp': mainFrameTimestamp,
        '@type': constructor,
      };

  @override
  bool operator ==(Object other) => overriddenEquality(other);

  @override
  int get hashCode => overriddenHashCode;
}
