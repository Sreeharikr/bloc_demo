import 'package:bloc_demo/bloc/pincode_bloc/pincode_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormDemoPage extends StatefulWidget {
  const FormDemoPage({Key? key}) : super(key: key);

  @override
  State<FormDemoPage> createState() => _FormDemoPageState();
}

class Values {
  String pin1 = "";
  String pin2 = "";
  set settpin1(String s) {
    pin1 = s;
  }

  set settpin2(String s) {
    pin2 = s;
  }
}

class _FormDemoPageState extends State<FormDemoPage> {
  dynamic seleted;
  Values values = Values();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PincodeBlocBloc>(
      create: (context) => PincodeBlocBloc()..add(const FetchPicodeEvent("")),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 252, 199, 240),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                BlocBuilder<PincodeBlocBloc, PincodeBlocState>(
                  builder: (context, state) {
                    if (state is PincodeBlocSuccess) {
                      return Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(10),
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              child: DropdownButtonFormField(
                                onChanged: ((value) {
                                  values.settpin1 = value.toString();
                                }),
                                items: state.pincodeModel.result
                                    .map((e) => DropdownMenuItem(
                                          child: Text(e.pincode),
                                          value: e.pincode,
                                        ))
                                    .toList(),
                                hint: const Text("Select Pincode"),
                              )),
                          Container(
                              padding: const EdgeInsets.all(10),
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              child: DropdownButtonFormField(
                                onChanged: ((value) {
                                  values.settpin2 = value.toString();
                                }),
                                items: state.pincodeModel.result
                                    .map((e) => DropdownMenuItem(
                                          child: Text(e.pincode),
                                          value: e.pincode,
                                        ))
                                    .toList(),
                                hint: const Text("Select Pincode"),
                              )),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () {
                    print(values.pin1);
                    print(values.pin2);
                  },
                  child: const Text("data"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
