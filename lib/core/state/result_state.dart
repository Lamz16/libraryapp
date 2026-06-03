sealed class ResultState<T> {}

class ResultNone<T> extends ResultState<T>{}

class ResultLoading<T> extends ResultState<T>{}

class ResultLoaded<T> extends ResultState<T> {
  final T data;

  ResultLoaded(this.data);
}

class ResultError<T> extends ResultState<T> {
  final String message;

  ResultError(this.message);
}