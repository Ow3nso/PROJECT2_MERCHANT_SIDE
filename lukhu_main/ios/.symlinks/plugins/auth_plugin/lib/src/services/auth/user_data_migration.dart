import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:auth_plugin/src/services/api/external_request_service.dart';

class UserDataMigrationService {
  static Future<Map<String, dynamic>?> isOldUser(
      Map<String, String?> data) async {
    final url =
        '${AuthConstants.prod ? AuthConstants.prodBaseUrl : AuthConstants.stagingBaseUrl}users/';
    final responseData = await ExternalRequestService.makeRequest(
            url: url, body: data, request: 'post')
        .catchError((e) => null);
    return responseData;
  }

  static Future<bool> updateUserId(Map<String, String> data) async {
    final url =
        '${AuthConstants.prod ? AuthConstants.prodBaseUrl : AuthConstants.stagingBaseUrl}users/';
    final responseData = await ExternalRequestService.makeRequest(
            url: url, body: data, request: 'put')
        .catchError((e) => null);
    if (responseData == null) return false;
    return responseData['status'] =='success';
  }
}
