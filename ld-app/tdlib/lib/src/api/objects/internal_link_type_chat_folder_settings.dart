import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// The link is a link to the folder section of the app settings
@immutable
class InternalLinkTypeChatFolderSettings extends InternalLinkType {
  const InternalLinkTypeChatFolderSettings();

  static const String constructor = 'internalLinkTypeChatFolderSettings';

  static InternalLinkTypeChatFolderSettings? fromJson(
      Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return const InternalLinkTypeChatFolderSettings();
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
