abstract class DataState<T> {
  final T? data;
  final String? exceptionMsg;
  DataState({
    this.data,
    this.exceptionMsg,
  });
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataError<T> extends DataState<T> {
  DataError(String exception) : super(exceptionMsg: exception);
}
