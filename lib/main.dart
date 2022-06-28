import 'package:bloc_demo/bloc/bottom_nav_bar_bloc/bottom_nav_bar_bloc.dart';
import 'package:bloc_demo/constants/app_styles.dart';
import 'package:bloc_demo/cubit/countercubit_cubit.dart';
import 'package:bloc_demo/pages/bloc_demo.dart';
import 'package:bloc_demo/pages/form_demo.dart';
import 'package:bloc_demo/pages/nav_demo1.dart';
import 'package:bloc_demo/pages/nav_demo2.dart';
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
        home: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => BottomNavBarBloc()..add(ChangePageEvent(0)),
          ),
          BlocProvider(
            create: (context) => DemoBloc()..add(BlocDemoEvent()),
          )
        ], child: const MyHomePage()),
        //  home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> tabPage = [
    const MyWidget(title: "title"),
    const FormDemoPage(),
    const NavDemo1(),
    const NavDemo2()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
        builder: ((context, state) {
          if (state is BottomNavBarSuccess) {
            return BottomNavigationBar(
              backgroundColor: const Color.fromARGB(255, 238, 194, 62),
              selectedIconTheme: const IconThemeData(color: Colors.amber),
              elevation: 3,
              currentIndex: state.currentIndex,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              unselectedLabelStyle: const TextStyle(color: Colors.grey),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Bloc Demo"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.assignment), label: "Form Demo"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.build), label: "Demo 3"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Demo 4"),
              ],
              onTap: (index) {
                BlocProvider.of<BottomNavBarBloc>(context)
                    .add(ChangePageEvent(index));
              },
            );
          } else {
            return Container();
          }
        }),
      ),
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
          builder: (context, state) {
            if (state is BottomNavBarSuccess) {
              return CommonAppBar.commonAppBar(
                title: [
                  ("Bloc Demo"),
                  ("Form Demo"),
                  ("Demo 3"),
                  ("Demo 4"),
                ][state.currentIndex],
                ontapleading: () {
                  BlocProvider.of<BottomNavBarBloc>(context)
                      .add(ChangePageEvent(0));
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
          builder: ((context, state) {
            if (state is BottomNavBarSuccess) {
              return WillPopScope(
                  onWillPop: () async {
                    if (state.currentIndex == 0) {
                      return true;
                    } else {
                      BlocProvider.of<BottomNavBarBloc>(context)
                          .add(ChangePageEvent(0));
                      return false;
                    }
                  },
                  child: tabPage[state.currentIndex]);
            } else {
              return const SizedBox();
            }
          }),
        ),
      ),
    ));
  }
}
