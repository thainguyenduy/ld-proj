import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// Contains settings for the authentication of the user's phone number
@immutable
class PhoneNumberAuthenticationSettings extends TdObject {
  const PhoneNumberAuthenticationSettings({
    required this.allowFlashCall,
    required this.allowMissedCall,
    required this.isCurrentPhoneNumber,
    required this.allowSmsRetrieverApi,
    this.firebaseAuthenticationSettings,
    required this.authenticationTokens,
  });

  /// [allowFlashCall] Pass true if the authentication code may be sent via a
  /// flash call to the specified phone number
  final bool allowFlashCall;

  /// [allowMissedCall] Pass true if the authentication code may be sent via a
  /// missed call to the specified phone number
  final bool allowMissedCall;

  /// [isCurrentPhoneNumber] Pass true if the authenticated phone number is used
  /// on the current device
  final bool isCurrentPhoneNumber;

  /// [allowSmsRetrieverApi] For official applications only. True, if the
  /// application can use Android SMS Retriever API (requires Google Play
  /// Services
  final bool allowSmsRetrieverApi;

  /// [firebaseAuthenticationSettings] For official Android and iOS applications
  /// only; pass null otherwise. Settings for Firebase Authentication
  final FirebaseAuthenticationSettings? firebaseAuthenticationSettings;

  /// [authenticationTokens] List of up to 20 authentication tokens, recently
  /// received in updateOption("authentication_token") in previously logged out
  /// sessions
  final List<String> authenticationTokens;

  static const String constructor = 'phoneNumberAuthenticationSettings';

  static PhoneNumberAuthenticationSettings? fromJson(
      Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return PhoneNumberAuthenticationSettings(
      allowFlashCall: json['allow_flash_call'] as bool,
      allowMissedCall: json['allow_missed_call'] as bool,
      isCurrentPhoneNumber: json['is_current_phone_number'] as bool,
      allowSmsRetrieverApi: json['allow_sms_retriever_api'] as bool,
      firebaseAuthenticationSettings: FirebaseAuthenticationSettings.fromJson(
          json['firebase_authentication_settings'] as Map<String, dynamic>?),
      authenticationTokens: List<String>.from(
          ((json['authentication_tokens'] as List<dynamic>?) ?? <dynamic>[])
              .map((item) => item)
              .toList()),
    );
  }

  @override
  String getConstructor() => constructor;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'allow_flash_call': allowFlashCall,
        'allow_missed_call': allowMissedCall,
        'is_current_phone_number': isCurrentPhoneNumber,
        'allow_sms_retriever_api': allowSmsRetrieverApi,
        'firebase_authentication_settings':
            firebaseAuthenticationSettings?.toJson(),
        'authentication_tokens':
            authenticationTokens.map((item) => item).toList(),
        '@type': constructor,
      };

  @override
  bool operator ==(Object other) => overriddenEquality(other);

  @override
  int get hashCode => overriddenHashCode;
}
