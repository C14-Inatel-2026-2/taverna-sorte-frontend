import 'package:http/http.dart' as http;
import 'package:taverna/core/api_client.dart';

class FakeApiClient implements IApiClient {
  final http.Response? response;
  final Object? error;

  FakeApiClient({this.response, this.error});

  @override
  Future get({required String url}) async {
    if (error != null) throw error!;
    return response;
  }
}
