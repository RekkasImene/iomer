import 'package:flutter/material.dart';
import 'package:iomer/bloc/matricule/matricule_bloc.dart';
import 'package:iomer/config/injection.dart';

import 'components/body_matricules.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();

}

class _FirstScreenState extends State<FirstScreen> {

  late MatriculeBloc _matriculeBloc;

  @override
  void initState() {
    _matriculeBloc = getIt.get<MatriculeBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iomere'),
      ),
      body: const Body(),
    );
  }
}
