import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/demostate.dart';
import '../services/rest.dart';

class BlocDemoEvent {}

class DemoBloc extends Bloc<BlocDemoEvent, BlocState> {
  DemoBloc() : super(BlocInitialState()) {
    on<BlocDemoEvent>((event, emit) async {
      emit(BlocLoadingState());
      try {
        final result = await fetchList();
        emit(BlocSuccessState(result));
      } catch (e) {
        emit(BlocErrorState(e.toString()));
      }
    });
  }
}

class MyWidget extends StatefulWidget {
  final String title;
  const MyWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DemoBloc, BlocState>(
      builder: (context, state) {
        if (state is BlocLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BlocSuccessState) {
          return ListView.builder(
              itemCount: state.modelClass.result.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        // CachedNetworkImage(
                        //   imageUrl: state.modelClass.result[index].productImage,
                        //   height: 50,
                        //   errorWidget: (context, s, s1) => Container(),
                        // ),
                        Text(state.modelClass.result[index].productName),
                      ],
                    ),
                  ),
                );
              });
        } else if (state is BlocErrorState) {
          return Text(state.errorMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
      },
    );
  }
}
