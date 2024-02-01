import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// The maximum number of chat folders
@immutable
class PremiumLimitTypeChatFolderCount extends PremiumLimitType {
  const PremiumLimitTypeChatFolderCount();

  static const String constructor = 'premiumLimitTypeChatFolderCount';

  static PremiumLimitTypeChatFolderCount? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return const PremiumLimitTypeChatFolderCount();
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
