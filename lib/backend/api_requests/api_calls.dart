import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class KycCall {
  static Future<ApiCallResponse> call({
    String docFrontImage = '',
    String docBackImage = '',
    String selfieImage = '',
    String token = '',
  }) {
    final body = '''
{
  "doc_front_image": "${docFrontImage}",
  "doc_back_image": "${docBackImage}",
  "selfie_image": "${selfieImage}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'KYC',
      apiUrl: 'https://apps.faceki.com/kyc-verification',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ${token}',
        'authorization': 'Bearer ${token}',
      },
      params: {
        'doc_front_image': docFrontImage,
        'doc_back_image': docBackImage,
        'selfie_image': selfieImage,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class KYCtokenCall {
  static Future<ApiCallResponse> call({
    String clientId = '',
    String email = '',
  }) {
    final body = '''
{
  "client_id": "${clientId}",
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'KYCtoken',
      apiUrl: 'https://app.faceki.com/getToken',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'Application/json',
        'client_id': 'b3755fb0-0816-11ed-a9a4-eb09c9fc8606',
        'email': 'leo.bikuri@strathmore.edu',
      },
      params: {
        'client_id': clientId,
        'email': email,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
