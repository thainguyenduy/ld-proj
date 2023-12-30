import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// The chat has illegal drugs related content
@immutable
class ReportReasonIllegalDrugs extends ReportReason {
  const ReportReasonIllegalDrugs();

  static const String constructor = 'reportReasonIllegalDrugs';

  static ReportReasonIllegalDrugs? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return const ReportReasonIllegalDrugs();
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
