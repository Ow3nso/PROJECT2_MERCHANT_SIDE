import 'package:freezed_annotation/freezed_annotation.dart';
import 'fields.dart';

part 'social_media.freezed.dart';
part 'social_media.g.dart';

@freezed
class SocialMedia with _$SocialMedia {
  @JsonSerializable(explicitToJson: true)
  factory SocialMedia({
    @JsonKey(name: UserFields.instagram) String? instagram,
    @JsonKey(name: UserFields.facebook) String? facebook,
    @JsonKey(name: UserFields.whatsapp) String? whatsapp,
    @JsonKey(name: UserFields.twitter) String? twitter,
  }) = _SocialMedia;

  factory SocialMedia.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaFromJson(json);

  factory SocialMedia.empty() => SocialMedia(
        instagram: '',
        facebook: '',
        whatsapp: '',
        twitter: '',
      );
}
