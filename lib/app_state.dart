class AppSates {
  int counter;

  AppSates({required this.counter});
}

class InitStates extends AppSates {
  InitStates() : super(counter: 0);
}
