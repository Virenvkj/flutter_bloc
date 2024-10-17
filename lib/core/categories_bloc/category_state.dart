class CategoryStates {}

class InitialState extends CategoryStates {
  final List<String> categoriesList;
  InitialState({this.categoriesList = const []});
}

class SuccessState extends CategoryStates {
  final List<String> categoriesList;
  SuccessState({required this.categoriesList});
}

class FailureState extends CategoryStates {}

class LoadingState extends CategoryStates {}
