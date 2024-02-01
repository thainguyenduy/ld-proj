import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// The ability to hide the fact that the user viewed other's stories
@immutable
class PremiumStoryFeatureStealthMode extends PremiumStoryFeature {
  const PremiumStoryFeatureStealthMode();

  static const String constructor = 'premiumStoryFeatureStealthMode';

  static PremiumStoryFeatureStealthMode? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return const PremiumStoryFeatureStealthMode();
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
