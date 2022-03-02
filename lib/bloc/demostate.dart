import 'package:bloc_demo/model/model.dart';

abstract class BlocState {}

class BlocInitialState extends BlocState {}

class BlocLoadingState extends BlocState {}

class BlocSuccessState extends BlocState {
  final ModelClass modelClass;
  BlocSuccessState(this.modelClass);
}

class BlocErrorState extends BlocState {
  final String errorMessage;
  BlocErrorState(this.errorMessage);
}
