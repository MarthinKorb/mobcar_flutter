abstract class Failure implements Exception {}

class SearchBrandsFailure extends Failure {
  String message;
  SearchBrandsFailure({this.message});
}

class SQFLiteException extends Failure {
  String message;

  SQFLiteException({this.message});
}
