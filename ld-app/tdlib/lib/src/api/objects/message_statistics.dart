import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// A detailed statistics about a message
@immutable
class MessageStatistics extends TdObject {
  const MessageStatistics({
    required this.messageInteractionGraph,
  });

  /// [messageInteractionGraph] A graph containing number of message views and
  /// shares
  final StatisticalGraph messageInteractionGraph;

  static const String constructor = 'messageStatistics';

  static MessageStatistics? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return MessageStatistics(
      messageInteractionGraph: StatisticalGraph.fromJson(
          json['message_interaction_graph'] as Map<String, dynamic>?)!,
    );
  }

  @override
  String getConstructor() => constructor;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'message_interaction_graph': messageInteractionGraph.toJson(),
        '@type': constructor,
      };

  @override
  bool operator ==(Object other) => overriddenEquality(other);

  @override
  int get hashCode => overriddenHashCode;
}
