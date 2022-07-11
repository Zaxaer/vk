import 'dart:convert';
import 'dart:io';

import 'package:vk_example/domain/api_client/api_client_exaption.dart';
import 'package:vk_example/domain/configuration/configuration.dart';

class NetworkApiClient {
  final _client = HttpClient();

  Future<T> get<T>(String metod, String parameters, String accesToken,
      T Function(dynamic json) parser) async {
    try {
      final url = _makeUri(metod, parameters, accesToken);
      final request = await _client.getUrl(url);
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionTipe.network);
    } catch (_) {
      throw ApiClientException(ApiClientExceptionTipe.network);
    }
  }

  Uri _makeUri(
    String metod,
    String parameters,
    String accesToken,
  ) {
    final uri = Uri.parse(
        '${Configuration.host}$metod$parameters$accesToken${Configuration.version}');
    return uri;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((v) => json.decode(v));
  }
}
