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

  @override
  void initState() {
    _otBloc = getIt.get<OtBloc>();
    _otBloc.add(SelectEventOt());
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
        child: BlocBuilder<OtBloc, OtState>(
          builder: (context, state) {
            print(state);
            if (state is OtSelected) {
              return SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                        child: Text(
                      state.ot.LIBELLEOT,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                    Align(
                        child: Text(
                      state.ot.CODEOT,
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
