import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// Contains the content of a message
@immutable
abstract class MessageContent extends TdObject {
  const MessageContent();

  static const String constructor = 'messageContent';

  /// Inherited by:
  /// [MessageAnimatedEmoji]
  /// [MessageAnimation]
  /// [MessageAudio]
  /// [MessageBasicGroupChatCreate]
  /// [MessageBotWriteAccessAllowed]
  /// [MessageCall]
  /// [MessageChatAddMembers]
  /// [MessageChatChangePhoto]
  /// [MessageChatChangeTitle]
  /// [MessageChatDeleteMember]
  /// [MessageChatDeletePhoto]
  /// [MessageChatJoinByLink]
  /// [MessageChatJoinByRequest]
  /// [MessageChatSetBackground]
  /// [MessageChatSetMessageAutoDeleteTime]
  /// [MessageChatSetTheme]
  /// [MessageChatShared]
  /// [MessageChatUpgradeFrom]
  /// [MessageChatUpgradeTo]
  /// [MessageContactRegistered]
  /// [MessageContact]
  /// [MessageCustomServiceAction]
  /// [MessageDice]
  /// [MessageDocument]
  /// [MessageExpiredPhoto]
  /// [MessageExpiredVideo]
  /// [MessageForumTopicCreated]
  /// [MessageForumTopicEdited]
  /// [MessageForumTopicIsClosedToggled]
  /// [MessageForumTopicIsHiddenToggled]
  /// [MessageGameScore]
  /// [MessageGame]
  /// [MessageGiftedPremium]
  /// [MessageInviteVideoChatParticipants]
  /// [MessageInvoice]
  /// [MessageLocation]
  /// [MessagePassportDataReceived]
  /// [MessagePassportDataSent]
  /// [MessagePaymentSuccessfulBot]
  /// [MessagePaymentSuccessful]
  /// [MessagePhoto]
  /// [MessagePinMessage]
  /// [MessagePoll]
  /// [MessagePremiumGiftCode]
  /// [MessagePremiumGiveawayCreated]
  /// [MessagePremiumGiveaway]
  /// [MessageProximityAlertTriggered]
  /// [MessageScreenshotTaken]
  /// [MessageSticker]
  /// [MessageStory]
  /// [MessageSuggestProfilePhoto]
  /// [MessageSupergroupChatCreate]
  /// [MessageText]
  /// [MessageUnsupported]
  /// [MessageUserShared]
  /// [MessageVenue]
  /// [MessageVideoChatEnded]
  /// [MessageVideoChatScheduled]
  /// [MessageVideoChatStarted]
  /// [MessageVideoNote]
  /// [MessageVideo]
  /// [MessageVoiceNote]
  /// [MessageWebAppDataReceived]
  /// [MessageWebAppDataSent]
  static MessageContent? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    switch (json['@type']) {
      case MessageAnimatedEmoji.constructor:
        return MessageAnimatedEmoji.fromJson(json);
      case MessageAnimation.constructor:
        return MessageAnimation.fromJson(json);
      case MessageAudio.constructor:
        return MessageAudio.fromJson(json);
      case MessageBasicGroupChatCreate.constructor:
        return MessageBasicGroupChatCreate.fromJson(json);
      case MessageBotWriteAccessAllowed.constructor:
        return MessageBotWriteAccessAllowed.fromJson(json);
      case MessageCall.constructor:
        return MessageCall.fromJson(json);
      case MessageChatAddMembers.constructor:
        return MessageChatAddMembers.fromJson(json);
      case MessageChatChangePhoto.constructor:
        return MessageChatChangePhoto.fromJson(json);
      case MessageChatChangeTitle.constructor:
        return MessageChatChangeTitle.fromJson(json);
      case MessageChatDeleteMember.constructor:
        return MessageChatDeleteMember.fromJson(json);
      case MessageChatDeletePhoto.constructor:
        return MessageChatDeletePhoto.fromJson(json);
      case MessageChatJoinByLink.constructor:
        return MessageChatJoinByLink.fromJson(json);
      case MessageChatJoinByRequest.constructor:
        return MessageChatJoinByRequest.fromJson(json);
      case MessageChatSetBackground.constructor:
        return MessageChatSetBackground.fromJson(json);
      case MessageChatSetMessageAutoDeleteTime.constructor:
        return MessageChatSetMessageAutoDeleteTime.fromJson(json);
      case MessageChatSetTheme.constructor:
        return MessageChatSetTheme.fromJson(json);
      case MessageChatShared.constructor:
        return MessageChatShared.fromJson(json);
      case MessageChatUpgradeFrom.constructor:
        return MessageChatUpgradeFrom.fromJson(json);
      case MessageChatUpgradeTo.constructor:
        return MessageChatUpgradeTo.fromJson(json);
      case MessageContact.constructor:
        return MessageContact.fromJson(json);
      case MessageContactRegistered.constructor:
        return MessageContactRegistered.fromJson(json);
      case MessageCustomServiceAction.constructor:
        return MessageCustomServiceAction.fromJson(json);
      case MessageDice.constructor:
        return MessageDice.fromJson(json);
      case MessageDocument.constructor:
        return MessageDocument.fromJson(json);
      case MessageExpiredPhoto.constructor:
        return MessageExpiredPhoto.fromJson(json);
      case MessageExpiredVideo.constructor:
        return MessageExpiredVideo.fromJson(json);
      case MessageForumTopicCreated.constructor:
        return MessageForumTopicCreated.fromJson(json);
      case MessageForumTopicEdited.constructor:
        return MessageForumTopicEdited.fromJson(json);
      case MessageForumTopicIsClosedToggled.constructor:
        return MessageForumTopicIsClosedToggled.fromJson(json);
      case MessageForumTopicIsHiddenToggled.constructor:
        return MessageForumTopicIsHiddenToggled.fromJson(json);
      case MessageGame.constructor:
        return MessageGame.fromJson(json);
      case MessageGameScore.constructor:
        return MessageGameScore.fromJson(json);
      case MessageGiftedPremium.constructor:
        return MessageGiftedPremium.fromJson(json);
      case MessageInviteVideoChatParticipants.constructor:
        return MessageInviteVideoChatParticipants.fromJson(json);
      case MessageInvoice.constructor:
        return MessageInvoice.fromJson(json);
      case MessageLocation.constructor:
        return MessageLocation.fromJson(json);
      case MessagePassportDataReceived.constructor:
        return MessagePassportDataReceived.fromJson(json);
      case MessagePassportDataSent.constructor:
        return MessagePassportDataSent.fromJson(json);
      case MessagePaymentSuccessful.constructor:
        return MessagePaymentSuccessful.fromJson(json);
      case MessagePaymentSuccessfulBot.constructor:
        return MessagePaymentSuccessfulBot.fromJson(json);
      case MessagePhoto.constructor:
        return MessagePhoto.fromJson(json);
      case MessagePinMessage.constructor:
        return MessagePinMessage.fromJson(json);
      case MessagePoll.constructor:
        return MessagePoll.fromJson(json);
      case MessagePremiumGiftCode.constructor:
        return MessagePremiumGiftCode.fromJson(json);
      case MessagePremiumGiveaway.constructor:
        return MessagePremiumGiveaway.fromJson(json);
      case MessagePremiumGiveawayCreated.constructor:
        return MessagePremiumGiveawayCreated.fromJson(json);
      case MessageProximityAlertTriggered.constructor:
        return MessageProximityAlertTriggered.fromJson(json);
      case MessageScreenshotTaken.constructor:
        return MessageScreenshotTaken.fromJson(json);
      case MessageSticker.constructor:
        return MessageSticker.fromJson(json);
      case MessageStory.constructor:
        return MessageStory.fromJson(json);
      case MessageSuggestProfilePhoto.constructor:
        return MessageSuggestProfilePhoto.fromJson(json);
      case MessageSupergroupChatCreate.constructor:
        return MessageSupergroupChatCreate.fromJson(json);
      case MessageText.constructor:
        return MessageText.fromJson(json);
      case MessageUnsupported.constructor:
        return MessageUnsupported.fromJson(json);
      case MessageUserShared.constructor:
        return MessageUserShared.fromJson(json);
      case MessageVenue.constructor:
        return MessageVenue.fromJson(json);
      case MessageVideo.constructor:
        return MessageVideo.fromJson(json);
      case MessageVideoChatEnded.constructor:
        return MessageVideoChatEnded.fromJson(json);
      case MessageVideoChatScheduled.constructor:
        return MessageVideoChatScheduled.fromJson(json);
      case MessageVideoChatStarted.constructor:
        return MessageVideoChatStarted.fromJson(json);
      case MessageVideoNote.constructor:
        return MessageVideoNote.fromJson(json);
      case MessageVoiceNote.constructor:
        return MessageVoiceNote.fromJson(json);
      case MessageWebAppDataReceived.constructor:
        return MessageWebAppDataReceived.fromJson(json);
      case MessageWebAppDataSent.constructor:
        return MessageWebAppDataSent.fromJson(json);
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
