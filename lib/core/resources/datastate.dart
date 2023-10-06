import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DataState<T> {
  final T? data;
  final FirebaseException? exception;

  const DataState({this.data, this.exception});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(FirebaseException exception) : super(exception: exception);
}
