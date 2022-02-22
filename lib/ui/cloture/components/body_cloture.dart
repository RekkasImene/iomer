import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/cloture/cloture_bloc.dart';
import 'package:iomer/bloc/matricule/matricule_bloc.dart';
import 'package:iomer/bloc/taches/taches_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/ui/machine/machine_screen.dart';
import 'package:iomer/ui/utils/info.dart';
import 'package:iomer/ui/matricule/components/matricule.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();

}

class _BodyState extends State<Body> {
  late ClotureBloc _clotureBloc;
  late Matricule selectedMatricule;
  late List<String> listDuration;

  @override
  void initState() {
    _clotureBloc = getIt.get<ClotureBloc>();
    _clotureBloc.add(getOtOpenTime());
    listDuration=["00","00","00"];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Clôture de l'OT :",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Info(),
          ),
          const Expanded(
            child: MatriculeWidget(),
          ),
          BlocProvider(
            create: (context) => _clotureBloc,
            child: BlocConsumer<ClotureBloc, ClotureState>(
              listener: (context, state) {
                if(state is StateDurationOt) {
                  listDuration=state.listDuration;
                  print("Temps d'intervention : "+
                      listDuration.first+ "h "+
                      listDuration[1] + "mn "+ listDuration.last+ "s");
                }
                if(state is ClotureEnd){
                  navigation();
                }
              },
              builder: (context, state) {
                print( "Temps d'intervention : "+
                    listDuration.first+ "h "+
                    listDuration[1] + "mn "+ listDuration.last+ "s");
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Temps d'intervention : "+
                    listDuration.first+ "h "+
                    listDuration[1] + "mn "+ listDuration.last+ "s",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                DateTime now = DateTime.now();
               _clotureBloc.add(SetCloseOt(now));

              },
              child: const Text('Clôturer OT', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            ),
          ),
        ],
      ),
    );
  }

  navigation() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MachineScreen(text: "")),
    );
  }
}
