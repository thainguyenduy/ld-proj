import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// A user changed the answer to a poll; for bots only
@immutable
class UpdatePollAnswer extends Update {
  const UpdatePollAnswer({
    required this.pollId,
    required this.voterId,
    required this.optionIds,
  });

  /// [pollId] Unique poll identifier
  final int pollId;

  /// [voterId] Identifier of the message sender that changed the answer to the
  /// poll
  final MessageSender voterId;

  /// [optionIds] 0-based identifiers of answer options, chosen by the user
  final List<int> optionIds;

  static const String constructor = 'updatePollAnswer';

  static UpdatePollAnswer? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return UpdatePollAnswer(
      pollId: int.tryParse(json['poll_id']) ?? 0,
      voterId:
          MessageSender.fromJson(json['voter_id'] as Map<String, dynamic>?)!,
      optionIds: List<int>.from(
          ((json['option_ids'] as List<dynamic>?) ?? <dynamic>[])
              .map((item) => item)
              .toList()),
    );
  }

  @override
  String getConstructor() => constructor;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'poll_id': pollId.toString(),
        'voter_id': voterId.toJson(),
        'option_ids': optionIds.map((item) => item).toList(),
        '@type': constructor,
      };

  @override
  bool operator ==(Object other) => overriddenEquality(other);

  @override
  int get hashCode => overriddenHashCode;
}
