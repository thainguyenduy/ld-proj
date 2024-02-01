import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// A file defined by its remote identifier. The remote identifier is
/// guaranteed to be usable only if the corresponding file is still accessible
/// to the user and known to TDLib. For example, if the file is from a
/// message, then the message must be not deleted and accessible to the user.
/// If the file database is disabled, then the corresponding object with the
/// file must be preloaded by the application
@immutable
class InputFileRemote extends InputFile {
  const InputFileRemote({
    required this.id,
  });

  /// [id] Remote file identifier
  final String id;

  static const String constructor = 'inputFileRemote';

  static InputFileRemote? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return InputFileRemote(
      id: json['id'] as String,
    );
  }

  @override
  String getConstructor() => constructor;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        '@type': constructor,
      };

  @override
  bool operator ==(Object other) => overriddenEquality(other);

  @override
  int get hashCode => overriddenHashCode;
}
