class BadRequestException implements Exception {
  final String message;

  BadRequestException(this.message);

  @override
  String toString() {
    return message;
  }
}

class UnauthorisedException implements Exception {
  final String message;

  UnauthorisedException(this.message);

  @override
  String toString() {
    return message;
  }
}

class InvalidInputException implements Exception {
  final String message;

  InvalidInputException(this.message);

  @override
  String toString() {
    return message;
  }
}

class FetchDataException implements Exception {
  final String message;

  FetchDataException(this.message);

  @override
  String toString() {
    return message;
  }
}

class SomethingWentWrongException implements Exception {
  final String? message;

  SomethingWentWrongException([this.message = 'Something went wrong']);

  @override
  String toString() {
    return message!;
  }
}
