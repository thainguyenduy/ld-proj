import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// Describes a text object inside an instant-view web page
@immutable
abstract class RichText extends TdObject {
  const RichText();

  static const String constructor = 'richText';

  /// Inherited by:
  /// [RichTextAnchorLink]
  /// [RichTextAnchor]
  /// [RichTextBold]
  /// [RichTextEmailAddress]
  /// [RichTextFixed]
  /// [RichTextIcon]
  /// [RichTextItalic]
  /// [RichTextMarked]
  /// [RichTextPhoneNumber]
  /// [RichTextPlain]
  /// [RichTextReference]
  /// [RichTextStrikethrough]
  /// [RichTextSubscript]
  /// [RichTextSuperscript]
  /// [RichTextUnderline]
  /// [RichTextUrl]
  /// [RichTexts]
  static RichText? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    switch (json['@type']) {
      case RichTextAnchor.constructor:
        return RichTextAnchor.fromJson(json);
      case RichTextAnchorLink.constructor:
        return RichTextAnchorLink.fromJson(json);
      case RichTextBold.constructor:
        return RichTextBold.fromJson(json);
      case RichTextEmailAddress.constructor:
        return RichTextEmailAddress.fromJson(json);
      case RichTextFixed.constructor:
        return RichTextFixed.fromJson(json);
      case RichTextIcon.constructor:
        return RichTextIcon.fromJson(json);
      case RichTextItalic.constructor:
        return RichTextItalic.fromJson(json);
      case RichTextMarked.constructor:
        return RichTextMarked.fromJson(json);
      case RichTextPhoneNumber.constructor:
        return RichTextPhoneNumber.fromJson(json);
      case RichTextPlain.constructor:
        return RichTextPlain.fromJson(json);
      case RichTextReference.constructor:
        return RichTextReference.fromJson(json);
      case RichTextStrikethrough.constructor:
        return RichTextStrikethrough.fromJson(json);
      case RichTextSubscript.constructor:
        return RichTextSubscript.fromJson(json);
      case RichTextSuperscript.constructor:
        return RichTextSuperscript.fromJson(json);
      case RichTextUnderline.constructor:
        return RichTextUnderline.fromJson(json);
      case RichTextUrl.constructor:
        return RichTextUrl.fromJson(json);
      case RichTexts.constructor:
        return RichTexts.fromJson(json);
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
