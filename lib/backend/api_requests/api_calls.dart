import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class KycCall {
  static Future<ApiCallResponse> call({
    String id = '',
    String firstName = '',
    String lastName = '',
    String middleName = '',
    String dateOfBirth = '',
    String gender = '',
  }) {
    final body = '''
{
  "id": "${id}",
  "first_name": "${firstName}",
  "middle_name": "${middleName}",
  "last_name": "${lastName}",
  "date_of_birth": "${dateOfBirth}",
  "gender": "${gender}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'KYC',
      apiUrl:
          'https://docs.appruve.co/appruve-identity/kenya/verify-kenya-national-id',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaS5hcHBydXZlLmNvIiwianRpIjoiNmE4ZTY1OGMtNjI3ZS00NDgwLWFkMDMtNTQ2YThhZDQyYTE0IiwiYXVkIjoiODYyNWFiNTUtNzExZS00YTllLTkxY2QtZmQzYWY0ODI0MDdkIiwic3ViIjoiYWM1NmNmYzEtYzhiNS00YTdlLWFlNzMtMmFkNDgzNjVhODA3IiwibmJmIjowLCJzY29wZXMiOlsidmVyaWZpY2F0aW9uX3ZpZXciLCJ2ZXJpZmljYXRpb25fbGlzdCIsInZlcmlmaWNhdGlvbl9kb2N1bWVudCIsInZlcmlmaWNhdGlvbl9pZGVudGl0eSJdLCJleHAiOjMyMzUzODYxOTUsImlhdCI6MTY1NzQ2Mjk5NX0.bUFNtvjqWVp2PSQuQzj_bnYZM404_32qvzt9G6O_le8',
      },
      params: {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'middle_name': middleName,
        'date_of_birth': dateOfBirth,
        'gender': gender,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
