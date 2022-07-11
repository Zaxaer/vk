enum ApiClientExceptionTipe { network }

class ApiClientException implements Exception {
  final ApiClientExceptionTipe type;

  ApiClientException(this.type);
}
