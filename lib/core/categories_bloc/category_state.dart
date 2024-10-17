class CategoryStates {
  List<String> categoriesList = [];
  CategoryStates({required this.categoriesList});
}

class InitialState extends CategoryStates {
  InitialState() : super(categoriesList: []);
}