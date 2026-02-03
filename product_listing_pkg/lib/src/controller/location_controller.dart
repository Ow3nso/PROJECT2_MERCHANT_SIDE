import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppDBConstants,
        FirebaseFirestore,
        Helpers,
        LocationFields,
        LocationModel,
        ShortMessageType,
        ShortMessages,
        StringExtension,
        Uuid;

class LocationController extends ChangeNotifier {
  final db = FirebaseFirestore.instance;
  LocationController() {
    init();
  }

  Map<String, LocationModel> _userLocation = {};
  Map<String, LocationModel> get userLocation => _userLocation;
  set userLocation(Map<String, LocationModel> value) {
    _userLocation = value;
    notifyListeners();
  }

  String? _locationType;
  String? get locationType => _locationType;
  set locationType(String? value) {
    _locationType = value;
    notifyListeners();
  }

  Map<String, Map<String, LocationModel>> similarLocation = {};

  late GlobalKey<FormState> setLocationFormKey;
  // late TextEditingController locationController;
  // late TextEditingController buildingHouseController;

  TextEditingController _locationController = TextEditingController();
  TextEditingController _buildingHouseController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  TextEditingController get locationController => _locationController;
  TextEditingController get buildingHouseController => _buildingHouseController;
  TextEditingController get phoneNumberController => _phoneNumberController;

  bool _uploading = false;

  /// A variable that is used to determine if the app is uploading a file.
  bool get uploading => _uploading;
  set uploading(bool value) {
    _uploading = value;
    notifyListeners();
  }

  void init() {
    setLocationFormKey = GlobalKey();
  }

  void validateLoation(BuildContext context) {
    if (setLocationFormKey.currentState!.validate()) {
      Navigator.of(context).pop();
    }
  }

  LocationModel? _location;

  /// A getter and setter for the product.
  LocationModel? get location => _location;
  set location(LocationModel? value) {
    _location = value;
    notifyListeners();
  }

  /// This function retrieves user locations from a database and stores them in a map.
  ///
  /// Args:
  ///   isrefreshMode (bool): A boolean value that indicates whether the function is being called in
  /// refresh mode or not. If it is set to true, it means that the function is being called to refresh
  /// the user locations. Defaults to false
  ///   limit (int): The limit parameter is an integer that specifies the maximum number of location
  /// documents to retrieve from the database. In this case, it is set to 8. Defaults to 8
  ///   userId (String): The ID of the user whose location is being retrieved.
  ///
  /// Returns:
  ///   A `Future<bool>` is being returned.
  Future<bool> getUserLocations(
      {bool isrefreshMode = false,
      int limit = 8,
      required String userId}) async {
    if (similarLocation[userId] != null && !isrefreshMode) return true;
    try {
      var locationDocs = await db
          .collection(AppDBConstants.locationCollection)
          .where(LocationFields.userId, isEqualTo: userId)
          .limit(limit)
          .get();

      if (locationDocs.docs.isNotEmpty) {
        userLocation = {
          for (var e in locationDocs.docs)
            e.id: LocationModel.fromJson(
              e.data(),
            )
        };
        similarLocation[userId] = userLocation;

        return true;
      }
    } catch (e) {
      Helpers.debugLog('An error occurred while getting location: $e');
    }
    return false;
  }

  void resetLocation() {
    for (var loc in userLocation.values) {
      userLocation[loc.id!] = loc.copyWith(isSelected: false);
    }
  }

  bool get hasPickedLocation => userLocation.keys.isNotEmpty;

  int? _selectedLabel;
  int? get selectedLabel => _selectedLabel;
  set selectedLabel(int? value) {
    _selectedLabel = value;
    notifyListeners();
  }

  bool isLabelSelected(int index) => _selectedLabel == index;

  bool _retainLocation = false;
  bool get retainLocation => _retainLocation;
  set retainLocation(bool value) {
    _retainLocation = value;
    notifyListeners();
  }

  Future<bool> addLocation(
      {required String userId,
      LocationModel? locationValue,
      bool status = false}) async {
    if (locationValue != null) {
      return updateLocation(location: locationValue);
    }
    resetLocation();
    uploading = true;
    final id = const Uuid().v4();
    location = LocationModel.empty();
    location = location!.copyWith(
      id: id,
      userId: userId,
      location: locationController.text.trim(),
      createdAt: DateTime.now(),
      buildingHouse: buildingHouseController.text.trim(),
      locationType: locationType?.trim(),
      isSelected: true,
      phoneNumber: phoneNumberController.text.isEmpty
          ? null
          : phoneNumberController.text.toLukhuNumber().trim(),
    );

    final locationData = location!.toJson();
    if (status) {
      ShortMessages.showShortMessage(
        message: 'Invalid location data all the required',
        type: ShortMessageType.warning,
      );
      location = LocationModel.fromJson(locationData);
      uploading = false;
      return true;
    }

    if (!isLocationValid(data: locationData)) {
      ShortMessages.showShortMessage(
        message: 'Invalid location data all the required',
        type: ShortMessageType.warning,
      );
      location = null;
      uploading = false;
      return false;
    }
    location = LocationModel.fromJson(locationData);

    return saveLocation();
  }

  Future<bool> saveLocation() async {
    if (location == null) return false;
    try {
      final locationRef =
          db.collection(AppDBConstants.locationCollection).doc(location!.id!);

      await locationRef.set(location!.toJson());
      await getUserLocations(
          userId: location!.userId!, isrefreshMode: true, limit: 4);
    } catch (e) {
      uploading = false;

      location = null;
      Helpers.debugLog('Error saving location: $e');
      return false;
    }

    clear();
    uploading = false;
    return true;
  }

  LocationModel? getLocation(int index, Map<String, LocationModel> value) {
    return value[_singleLocation(index, value)];
  }

  String _singleLocation(int index, Map<String, LocationModel> value) {
    return value.keys.elementAt(index);
  }

  final List<String> requiredLocationField = [
    LocationFields.location,
    LocationFields.userId,
    LocationFields.locationType
  ];

  /// The function checks if all required fields in a location data map are not null or empty.
  ///
  /// Args:
  ///   data (Map<String, dynamic>): A map containing location data with keys as strings and values as
  /// dynamic types.
  ///
  /// Returns:
  ///   The function `isLocationValid` is returning a boolean value. It returns `true` if all the
  /// required fields in the `data` map are not null or empty strings, and `false` otherwise.
  bool isLocationValid({required Map<String, dynamic> data}) {
    for (final field in requiredLocationField) {
      if (data[field] == null || data[field] == '') {
        return false;
      }
    }
    return true;
  }

  /// The function updates a location in the database if the location data is valid.
  ///
  /// Args:
  ///   location (LocationModel): The `location` parameter is of type `LocationModel` and it represents
  /// the location data that needs to be updated.
  ///
  /// Returns:
  ///   a `Future<bool>`.
  Future<bool> updateLocation({required LocationModel location}) async {
    location = location.copyWith(
      userId: location.userId,
      location: locationController.text.trim(),
      createdAt: DateTime.now(),
      buildingHouse: buildingHouseController.text.trim(),
      locationType: locationType?.trim(),
    );
    final locationData = location.toJson();
    if (!isLocationValid(data: locationData)) {
      ShortMessages.showShortMessage(
        message: 'Invalid location data all the required',
        type: ShortMessageType.warning,
      );

      return false;
    }
    location = LocationModel.fromJson(locationData);
    return updateLocationInDb(location);
  }

  void clear() {
    _buildingHouseController = TextEditingController();
    _phoneNumberController = TextEditingController();
    uploading = false;
    locationType = null;
    if (!retainLocation) {
      location = null;
      _locationController = TextEditingController();
    }
    selectedLabel = null;
  }

  Future<bool> updateLocationInDb(LocationModel location) async {
    uploading = true;
    try {
      final productRef =
          db.collection(AppDBConstants.productsCollection).doc(location.id);

      await productRef.update(location.toJson());
    } catch (e) {
      uploading = false;
      Helpers.debugLog('Error saving location: $e');
      return false;
    }

    uploading = true;
    clear();
    return true;
  }

  /// The function `deleteLocation` deletes a location document from a Firestore collection and returns
  /// a boolean indicating whether the deletion was successful.
  ///
  /// Returns:
  ///   The function `deleteLocation()` returns a `Future<bool>`.
  Future<bool> deleteLocation() async {
    uploading = true;
    try {
      final locationRef =
          db.collection(AppDBConstants.locationCollection).doc(location?.id);

      await locationRef.delete();
      uploading = false;
      return true;
    } catch (e) {
      uploading = false;
      Helpers.debugLog('Error deleting location: $e');
      return false;
    }
  }
}
