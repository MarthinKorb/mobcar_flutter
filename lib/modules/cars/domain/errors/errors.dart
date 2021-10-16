abstract class Failure implements Exception {}

class SearchBrandsFailure extends Failure {
  String message;
  SearchBrandsFailure({this.message});
}
