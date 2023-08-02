sealed class CommonState {}

class CommonInitialState extends CommonState {}

class CommonLoadingState extends CommonState {}

class CommonErrorState extends CommonState {
  final String message;
  CommonErrorState({required this.message});
}

class CommonSuccessState<T> extends CommonState {
  final T item;

  CommonSuccessState({required this.item});
  
}
