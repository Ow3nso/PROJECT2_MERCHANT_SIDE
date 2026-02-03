import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Timestamp;

import '../../utils/date/date_utils.dart';
import 'fields.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@unfreezed
class UserModel with _$UserModel, DateUtils {
  factory UserModel({
    // Here we define the members of this data model.
    // These @JsonKey annotations will be put in the correct places and
    // will work despite what the linter says.
    // the name: parameter sets the key name for each field on json (firebase doc)
    @JsonKey(name: UserFields.buildNumber) String? buildNumber,
    @JsonKey(name: UserFields.userName) String? userName,
    @JsonKey(name: UserFields.firstName) String? firstName,
    @JsonKey(name: UserFields.lastName) String? lastName,
    @JsonKey(name: UserFields.email) String? email,
    @JsonKey(name: UserFields.lastLoggedIn, fromJson: DateUtils.timestampToDateTime, toJson: DateUtils.dateTimeToTimestamp)
        DateTime? lastLoggedIn,
    @JsonKey(name: UserFields.imageUrl) String? imageUrl,
    @JsonKey(name: UserFields.storageDir) String? storageDir,
    @JsonKey(name: UserFields.userId) String? userId,
    @JsonKey(name: UserFields.phoneNumber) String? phoneNumber,
    @JsonKey(name: UserFields.dob) String? dob,
    @JsonKey(name: UserFields.userSellingExperience)
        String? userSellingExperience,
    @JsonKey(name: UserFields.accountType) String? accountType,
    @JsonKey(name: UserFields.lastSeen) int? lastSeen,
    @JsonKey(name: UserFields.userPin) String? userPin,
    @JsonKey(name: UserFields.selectedCategories)
        List<String?>? selectedCategories,
    @JsonKey(name: UserFields.sizesData)
        Map<String, Map<String, Map<String, List<String>>>>? sizesData,
         @JsonKey(name: UserFields.sizes) List<String>? sizes,
          @JsonKey(name: UserFields.bioDescription) String? bioDescription,
    
  }) = _UserModel;

  // This is required to make freezed use json_serializable to get
  // fromJson() and toJson() generated for this model
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // This is essentially an alias of UserModel.fromJson
  // flutter_firebase_starter uses .fromDS()
  factory UserModel.fromDS(String id, Map<String, dynamic> json) =>
      UserModel.fromJson(json);
}
