// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
// Here we define the members of this data model.
// These @JsonKey annotations will be put in the correct places and
// will work despite what the linter says.
// the name: parameter sets the key name for each field on json (firebase doc)
  @JsonKey(name: UserFields.buildNumber)
  String? get buildNumber =>
      throw _privateConstructorUsedError; // Here we define the members of this data model.
// These @JsonKey annotations will be put in the correct places and
// will work despite what the linter says.
// the name: parameter sets the key name for each field on json (firebase doc)
  @JsonKey(name: UserFields.buildNumber)
  set buildNumber(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.userName)
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.userName)
  set userName(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.firstName)
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.firstName)
  set firstName(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.lastName)
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.lastName)
  set lastName(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.email)
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.email)
  set email(String? value) => throw _privateConstructorUsedError;
  @JsonKey(
      name: UserFields.lastLoggedIn,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get lastLoggedIn => throw _privateConstructorUsedError;
  @JsonKey(
      name: UserFields.lastLoggedIn,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  set lastLoggedIn(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.imageUrl)
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.imageUrl)
  set imageUrl(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.storageDir)
  String? get storageDir => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.storageDir)
  set storageDir(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.userId)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.userId)
  set userId(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.phoneNumber)
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.phoneNumber)
  set phoneNumber(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.dob)
  String? get dob => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.dob)
  set dob(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.userSellingExperience)
  String? get userSellingExperience => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.userSellingExperience)
  set userSellingExperience(String? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.accountType)
  String? get accountType => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.accountType)
  set accountType(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.lastSeen)
  int? get lastSeen => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.lastSeen)
  set lastSeen(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.userPin)
  String? get userPin => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.userPin)
  set userPin(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.selectedCategories)
  List<String?>? get selectedCategories => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.selectedCategories)
  set selectedCategories(List<String?>? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.sizesData)
  Map<String, Map<String, Map<String, List<String>>>>? get sizesData =>
      throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.sizesData)
  set sizesData(Map<String, Map<String, Map<String, List<String>>>>? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.sizes)
  List<String>? get sizes => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.sizes)
  set sizes(List<String>? value) => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.bioDescription)
  String? get bioDescription => throw _privateConstructorUsedError;
  @JsonKey(name: UserFields.bioDescription)
  set bioDescription(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: UserFields.buildNumber) String? buildNumber,
      @JsonKey(name: UserFields.userName) String? userName,
      @JsonKey(name: UserFields.firstName) String? firstName,
      @JsonKey(name: UserFields.lastName) String? lastName,
      @JsonKey(name: UserFields.email) String? email,
      @JsonKey(
          name: UserFields.lastLoggedIn,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
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
      @JsonKey(name: UserFields.bioDescription) String? bioDescription});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buildNumber = freezed,
    Object? userName = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? lastLoggedIn = freezed,
    Object? imageUrl = freezed,
    Object? storageDir = freezed,
    Object? userId = freezed,
    Object? phoneNumber = freezed,
    Object? dob = freezed,
    Object? userSellingExperience = freezed,
    Object? accountType = freezed,
    Object? lastSeen = freezed,
    Object? userPin = freezed,
    Object? selectedCategories = freezed,
    Object? sizesData = freezed,
    Object? sizes = freezed,
    Object? bioDescription = freezed,
  }) {
    return _then(_value.copyWith(
      buildNumber: freezed == buildNumber
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLoggedIn: freezed == lastLoggedIn
          ? _value.lastLoggedIn
          : lastLoggedIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      storageDir: freezed == storageDir
          ? _value.storageDir
          : storageDir // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      userSellingExperience: freezed == userSellingExperience
          ? _value.userSellingExperience
          : userSellingExperience // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSeen: freezed == lastSeen
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as int?,
      userPin: freezed == userPin
          ? _value.userPin
          : userPin // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCategories: freezed == selectedCategories
          ? _value.selectedCategories
          : selectedCategories // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      sizesData: freezed == sizesData
          ? _value.sizesData
          : sizesData // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, Map<String, List<String>>>>?,
      sizes: freezed == sizes
          ? _value.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      bioDescription: freezed == bioDescription
          ? _value.bioDescription
          : bioDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: UserFields.buildNumber) String? buildNumber,
      @JsonKey(name: UserFields.userName) String? userName,
      @JsonKey(name: UserFields.firstName) String? firstName,
      @JsonKey(name: UserFields.lastName) String? lastName,
      @JsonKey(name: UserFields.email) String? email,
      @JsonKey(
          name: UserFields.lastLoggedIn,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
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
      @JsonKey(name: UserFields.bioDescription) String? bioDescription});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buildNumber = freezed,
    Object? userName = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? lastLoggedIn = freezed,
    Object? imageUrl = freezed,
    Object? storageDir = freezed,
    Object? userId = freezed,
    Object? phoneNumber = freezed,
    Object? dob = freezed,
    Object? userSellingExperience = freezed,
    Object? accountType = freezed,
    Object? lastSeen = freezed,
    Object? userPin = freezed,
    Object? selectedCategories = freezed,
    Object? sizesData = freezed,
    Object? sizes = freezed,
    Object? bioDescription = freezed,
  }) {
    return _then(_$UserModelImpl(
      buildNumber: freezed == buildNumber
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLoggedIn: freezed == lastLoggedIn
          ? _value.lastLoggedIn
          : lastLoggedIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      storageDir: freezed == storageDir
          ? _value.storageDir
          : storageDir // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      userSellingExperience: freezed == userSellingExperience
          ? _value.userSellingExperience
          : userSellingExperience // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSeen: freezed == lastSeen
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as int?,
      userPin: freezed == userPin
          ? _value.userPin
          : userPin // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCategories: freezed == selectedCategories
          ? _value.selectedCategories
          : selectedCategories // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      sizesData: freezed == sizesData
          ? _value.sizesData
          : sizesData // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, Map<String, List<String>>>>?,
      sizes: freezed == sizes
          ? _value.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      bioDescription: freezed == bioDescription
          ? _value.bioDescription
          : bioDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl(
      {@JsonKey(name: UserFields.buildNumber) this.buildNumber,
      @JsonKey(name: UserFields.userName) this.userName,
      @JsonKey(name: UserFields.firstName) this.firstName,
      @JsonKey(name: UserFields.lastName) this.lastName,
      @JsonKey(name: UserFields.email) this.email,
      @JsonKey(
          name: UserFields.lastLoggedIn,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      this.lastLoggedIn,
      @JsonKey(name: UserFields.imageUrl) this.imageUrl,
      @JsonKey(name: UserFields.storageDir) this.storageDir,
      @JsonKey(name: UserFields.userId) this.userId,
      @JsonKey(name: UserFields.phoneNumber) this.phoneNumber,
      @JsonKey(name: UserFields.dob) this.dob,
      @JsonKey(name: UserFields.userSellingExperience)
      this.userSellingExperience,
      @JsonKey(name: UserFields.accountType) this.accountType,
      @JsonKey(name: UserFields.lastSeen) this.lastSeen,
      @JsonKey(name: UserFields.userPin) this.userPin,
      @JsonKey(name: UserFields.selectedCategories) this.selectedCategories,
      @JsonKey(name: UserFields.sizesData) this.sizesData,
      @JsonKey(name: UserFields.sizes) this.sizes,
      @JsonKey(name: UserFields.bioDescription) this.bioDescription});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

// Here we define the members of this data model.
// These @JsonKey annotations will be put in the correct places and
// will work despite what the linter says.
// the name: parameter sets the key name for each field on json (firebase doc)
  @override
  @JsonKey(name: UserFields.buildNumber)
  String? buildNumber;
  @override
  @JsonKey(name: UserFields.userName)
  String? userName;
  @override
  @JsonKey(name: UserFields.firstName)
  String? firstName;
  @override
  @JsonKey(name: UserFields.lastName)
  String? lastName;
  @override
  @JsonKey(name: UserFields.email)
  String? email;
  @override
  @JsonKey(
      name: UserFields.lastLoggedIn,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? lastLoggedIn;
  @override
  @JsonKey(name: UserFields.imageUrl)
  String? imageUrl;
  @override
  @JsonKey(name: UserFields.storageDir)
  String? storageDir;
  @override
  @JsonKey(name: UserFields.userId)
  String? userId;
  @override
  @JsonKey(name: UserFields.phoneNumber)
  String? phoneNumber;
  @override
  @JsonKey(name: UserFields.dob)
  String? dob;
  @override
  @JsonKey(name: UserFields.userSellingExperience)
  String? userSellingExperience;
  @override
  @JsonKey(name: UserFields.accountType)
  String? accountType;
  @override
  @JsonKey(name: UserFields.lastSeen)
  int? lastSeen;
  @override
  @JsonKey(name: UserFields.userPin)
  String? userPin;
  @override
  @JsonKey(name: UserFields.selectedCategories)
  List<String?>? selectedCategories;
  @override
  @JsonKey(name: UserFields.sizesData)
  Map<String, Map<String, Map<String, List<String>>>>? sizesData;
  @override
  @JsonKey(name: UserFields.sizes)
  List<String>? sizes;
  @override
  @JsonKey(name: UserFields.bioDescription)
  String? bioDescription;

  @override
  String toString() {
    return 'UserModel(buildNumber: $buildNumber, userName: $userName, firstName: $firstName, lastName: $lastName, email: $email, lastLoggedIn: $lastLoggedIn, imageUrl: $imageUrl, storageDir: $storageDir, userId: $userId, phoneNumber: $phoneNumber, dob: $dob, userSellingExperience: $userSellingExperience, accountType: $accountType, lastSeen: $lastSeen, userPin: $userPin, selectedCategories: $selectedCategories, sizesData: $sizesData, sizes: $sizes, bioDescription: $bioDescription)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
          {@JsonKey(name: UserFields.buildNumber) String? buildNumber,
          @JsonKey(name: UserFields.userName) String? userName,
          @JsonKey(name: UserFields.firstName) String? firstName,
          @JsonKey(name: UserFields.lastName) String? lastName,
          @JsonKey(name: UserFields.email) String? email,
          @JsonKey(
              name: UserFields.lastLoggedIn,
              fromJson: DateUtils.timestampToDateTime,
              toJson: DateUtils.dateTimeToTimestamp)
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
          @JsonKey(name: UserFields.bioDescription) String? bioDescription}) =
      _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override // Here we define the members of this data model.
// These @JsonKey annotations will be put in the correct places and
// will work despite what the linter says.
// the name: parameter sets the key name for each field on json (firebase doc)
  @JsonKey(name: UserFields.buildNumber)
  String? get buildNumber; // Here we define the members of this data model.
// These @JsonKey annotations will be put in the correct places and
// will work despite what the linter says.
// the name: parameter sets the key name for each field on json (firebase doc)
  @JsonKey(name: UserFields.buildNumber)
  set buildNumber(String? value);
  @override
  @JsonKey(name: UserFields.userName)
  String? get userName;
  @JsonKey(name: UserFields.userName)
  set userName(String? value);
  @override
  @JsonKey(name: UserFields.firstName)
  String? get firstName;
  @JsonKey(name: UserFields.firstName)
  set firstName(String? value);
  @override
  @JsonKey(name: UserFields.lastName)
  String? get lastName;
  @JsonKey(name: UserFields.lastName)
  set lastName(String? value);
  @override
  @JsonKey(name: UserFields.email)
  String? get email;
  @JsonKey(name: UserFields.email)
  set email(String? value);
  @override
  @JsonKey(
      name: UserFields.lastLoggedIn,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get lastLoggedIn;
  @JsonKey(
      name: UserFields.lastLoggedIn,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  set lastLoggedIn(DateTime? value);
  @override
  @JsonKey(name: UserFields.imageUrl)
  String? get imageUrl;
  @JsonKey(name: UserFields.imageUrl)
  set imageUrl(String? value);
  @override
  @JsonKey(name: UserFields.storageDir)
  String? get storageDir;
  @JsonKey(name: UserFields.storageDir)
  set storageDir(String? value);
  @override
  @JsonKey(name: UserFields.userId)
  String? get userId;
  @JsonKey(name: UserFields.userId)
  set userId(String? value);
  @override
  @JsonKey(name: UserFields.phoneNumber)
  String? get phoneNumber;
  @JsonKey(name: UserFields.phoneNumber)
  set phoneNumber(String? value);
  @override
  @JsonKey(name: UserFields.dob)
  String? get dob;
  @JsonKey(name: UserFields.dob)
  set dob(String? value);
  @override
  @JsonKey(name: UserFields.userSellingExperience)
  String? get userSellingExperience;
  @JsonKey(name: UserFields.userSellingExperience)
  set userSellingExperience(String? value);
  @override
  @JsonKey(name: UserFields.accountType)
  String? get accountType;
  @JsonKey(name: UserFields.accountType)
  set accountType(String? value);
  @override
  @JsonKey(name: UserFields.lastSeen)
  int? get lastSeen;
  @JsonKey(name: UserFields.lastSeen)
  set lastSeen(int? value);
  @override
  @JsonKey(name: UserFields.userPin)
  String? get userPin;
  @JsonKey(name: UserFields.userPin)
  set userPin(String? value);
  @override
  @JsonKey(name: UserFields.selectedCategories)
  List<String?>? get selectedCategories;
  @JsonKey(name: UserFields.selectedCategories)
  set selectedCategories(List<String?>? value);
  @override
  @JsonKey(name: UserFields.sizesData)
  Map<String, Map<String, Map<String, List<String>>>>? get sizesData;
  @JsonKey(name: UserFields.sizesData)
  set sizesData(Map<String, Map<String, Map<String, List<String>>>>? value);
  @override
  @JsonKey(name: UserFields.sizes)
  List<String>? get sizes;
  @JsonKey(name: UserFields.sizes)
  set sizes(List<String>? value);
  @override
  @JsonKey(name: UserFields.bioDescription)
  String? get bioDescription;
  @JsonKey(name: UserFields.bioDescription)
  set bioDescription(String? value);
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
