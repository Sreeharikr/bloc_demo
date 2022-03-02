import 'package:bloc_demo/bloc/demostate.dart';
import 'package:bloc_demo/cubit/countercubit_cubit.dart';
import 'package:bloc_demo/services/rest.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountercubitCubit>(
      create: (context) => CountercubitCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DemoBloc()..add(BlocDemoEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder<DemoBloc, BlocState>(
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
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                state.modelClass.result[index].productImage,
                            height: 50,
                          ),
                          Text(state.modelClass.result[index].productName),
                        ],
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
        ),
      ),
    );
  }
}

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
