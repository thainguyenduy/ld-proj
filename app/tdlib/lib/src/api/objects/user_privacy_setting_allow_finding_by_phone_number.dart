import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// A privacy setting for managing whether the user can be found by their
/// phone number. Checked only if the phone number is not known to the other
/// user. Can be set only to "Allow contacts" or "Allow all"
@immutable
class UserPrivacySettingAllowFindingByPhoneNumber extends UserPrivacySetting {
  const UserPrivacySettingAllowFindingByPhoneNumber();

  static const String constructor =
      'userPrivacySettingAllowFindingByPhoneNumber';

  static UserPrivacySettingAllowFindingByPhoneNumber? fromJson(
      Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return const UserPrivacySettingAllowFindingByPhoneNumber();
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
