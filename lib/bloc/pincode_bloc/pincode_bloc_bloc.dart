import 'package:bloc/bloc.dart';
import 'package:bloc_demo/model/pincode_model.dart';
import 'package:bloc_demo/services/get_pincode_service.dart';
import 'package:meta/meta.dart';

part 'pincode_bloc_event.dart';
part 'pincode_bloc_state.dart';

class PincodeBlocBloc extends Bloc<PincodeBlocEvent, PincodeBlocState> {
  PincodeBlocBloc() : super(PincodeBlocInitial()) {
    on<PincodeBlocEvent>((event, emit) async {
      emit(PincodeBlocInitial());

      if (event is FetchPicodeEvent) {
        try {
          final response = await getPincodes();
          emit(PincodeBlocSuccess(response, "", ""));
        } catch (e) {
          emit(PincodeBlocError(e.toString()));
        }
      } else if (event is SelectPicodeEvent) {
        emit(PincodeBlocSuccess(
            event.pincodeModel, event.selected, event.selected));
      }
    });
  }
}
