import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/matricule/matricule_bloc.dart';
import 'package:iomer/config/injection.dart';

class Matricule extends StatefulWidget {
  const Matricule({Key? key}) : super(key: key);

  @override
  State<Matricule> createState() => _MatriculeState();
}

class _MatriculeState extends State<Matricule> {
  late MatriculeBloc _matriculeBloc;
  late bool? ischecked;

  @override
  void initState() {
    _matriculeBloc = getIt.get<MatriculeBloc>();
    //_matriculeBloc.add(FetchMatriculeEvenet());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        //padding: const EdgeInsets.all(16.0) ,
        child: BlocProvider(
          create: (context) => _matriculeBloc,
          child: BlocBuilder<MatriculeBloc, MatriculeState>(
            builder: (context, state) {
              if (state is MatriculeLoaded) {
                return ListView.builder(
                  itemCount: state.matricule.length,
                  itemBuilder: (context, index) {
                    ischecked = state.matricule[index].CHECKED;
                    log("ischecked = " + ischecked.toString());

                    return CheckboxListTile(
                      title:
                      Text(state.matricule[index].NOMMATRICULE),
                      value: ischecked,
                      onChanged: (value) {
                        setState( () {
                            ischecked = value!;
                            log(ischecked.toString());
                          },
                        );
                      },
                    );
                  },
                );
              } else if (state is MatriculeError) {
                return Text(state.message);
              }
              return const Center(
                child: SizedBox(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator()),
              );
            },
          ),
        )
    );
  }
}
