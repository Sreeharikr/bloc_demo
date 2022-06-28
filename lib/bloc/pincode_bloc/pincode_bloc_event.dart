part of 'pincode_bloc_bloc.dart';

class FetchPicodeEvent extends PincodeBlocEvent {
  const FetchPicodeEvent(String selected) : super(selected);
}

@immutable
abstract class PincodeBlocEvent {
  final String selected;
  const PincodeBlocEvent(this.selected);
  String get obj1 => selected;
}

class SelectPicodeEvent extends PincodeBlocEvent {
  @override
  final String selected;
  final PincodeModel pincodeModel;
  const SelectPicodeEvent(
    this.pincodeModel,
    this.selected,
  ) : super("");
}
