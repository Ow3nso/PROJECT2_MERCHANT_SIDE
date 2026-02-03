// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      buildNumber: json['buildNumber'] as String?,
      userName: json['userName'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      lastLoggedIn:
          DateUtils.timestampToDateTime(json['lastLoggedIn'] as Timestamp?),
      imageUrl: json['imageUrl'] as String?,
      storageDir: json['storageDir'] as String?,
      userId: json['userId'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      dob: json['dob'] as String?,
      userSellingExperience: json['userSellingExperience'] as String?,
      accountType: json['accountType'] as String?,
      lastSeen: (json['lastSeen'] as num?)?.toInt(),
      userPin: json['userPin'] as String?,
      selectedCategories: (json['selectedCategories'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      sizesData: (json['sizesData'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(
                  k,
                  (e as Map<String, dynamic>).map(
                    (k, e) => MapEntry(k,
                        (e as List<dynamic>).map((e) => e as String).toList()),
                  )),
            )),
      ),
      sizes:
          (json['sizes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      bioDescription: json['bioDescription'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'buildNumber': instance.buildNumber,
      'userName': instance.userName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'lastLoggedIn': DateUtils.dateTimeToTimestamp(instance.lastLoggedIn),
      'imageUrl': instance.imageUrl,
      'storageDir': instance.storageDir,
      'userId': instance.userId,
      'phoneNumber': instance.phoneNumber,
      'dob': instance.dob,
      'userSellingExperience': instance.userSellingExperience,
      'accountType': instance.accountType,
      'lastSeen': instance.lastSeen,
      'userPin': instance.userPin,
      'selectedCategories': instance.selectedCategories,
      'sizesData': instance.sizesData,
      'sizes': instance.sizes,
      'bioDescription': instance.bioDescription,
    };
