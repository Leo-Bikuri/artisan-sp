import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class KycCall {
  static Future<ApiCallResponse> call({
    String docFrontImage = '',
    String docBackImage = '',
    String selfieImage = '',
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
        'authorization': 'Bearer b3755fb0-0816-11ed-a9a4-eb09c9fc8606',
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
