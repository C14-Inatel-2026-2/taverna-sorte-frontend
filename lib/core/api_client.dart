import 'package:http/http.dart' as http;

abstract class IApiClient {
  Future get({required String url});
}

class ApiClient implements IApiClient {

  final client = http.Client();

  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse(url));
  }
}