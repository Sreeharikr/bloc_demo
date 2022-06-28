part of 'pincode_bloc_bloc.dart';

class PincodeBlocError extends PincodeBlocState {
  final String errorMessage;
  PincodeBlocError(this.errorMessage);
}

class PincodeBlocInitial extends PincodeBlocState {}

class PincodeBlocLoading extends PincodeBlocState {}

@immutable
abstract class PincodeBlocState {
  String pincode1 = "";
  String pincode2 = "";

  set setPin1(String pin) {
    pincode1 = pin;
  }
}

class PincodeBlocSuccess extends PincodeBlocState {
  final PincodeModel pincodeModel;
  final String selected1;
  final String selected2;
  PincodeBlocSuccess(this.pincodeModel, this.selected1, this.selected2);
}

class SetPincode1 extends PincodeBlocState {
  final String selected;

  SetPincode1(this.selected);
}
