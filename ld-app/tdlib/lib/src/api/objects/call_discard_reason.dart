import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// Describes the reason why a call was discarded
@immutable
abstract class CallDiscardReason extends TdObject {
  const CallDiscardReason();

  static const String constructor = 'callDiscardReason';

  /// Inherited by:
  /// [CallDiscardReasonDeclined]
  /// [CallDiscardReasonDisconnected]
  /// [CallDiscardReasonEmpty]
  /// [CallDiscardReasonHungUp]
  /// [CallDiscardReasonMissed]
  static CallDiscardReason? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    switch (json['@type']) {
      case CallDiscardReasonDeclined.constructor:
        return CallDiscardReasonDeclined.fromJson(json);
      case CallDiscardReasonDisconnected.constructor:
        return CallDiscardReasonDisconnected.fromJson(json);
      case CallDiscardReasonEmpty.constructor:
        return CallDiscardReasonEmpty.fromJson(json);
      case CallDiscardReasonHungUp.constructor:
        return CallDiscardReasonHungUp.fromJson(json);
      case CallDiscardReasonMissed.constructor:
        return CallDiscardReasonMissed.fromJson(json);
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
