import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/ot/ot_bloc.dart';
import 'package:iomer/config/injection.dart';

class Info extends StatefulWidget {
  Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  late OtBloc _otBloc;

  void initState() {
    _otBloc = getIt.get<OtBloc>();
    _otBloc.add(FetchEventOt()); /////////////////////incertain
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),
      child: BlocProvider<OtBloc>(
        create: (context) => _otBloc,
        child: BlocConsumer<OtBloc, OtState>(
          listener: (context, state) {
            print("info state as changed: ");
          },
          builder: (context, state) {
            if (state is OtSelected) {
              return SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Align(
                        child: Text(
                      "tt",
                      //widget.OtCode,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                    Align(
                        child: Text(
                      "tt",
                      //widget.OtLibelle,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ))
                  ],
                ),
              );
            }
            return const Center(
              child: SizedBox(
                  width: 32, height: 32, child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
