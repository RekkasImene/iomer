import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/ot/ot_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/ui/machine/components/ot_button.dart';
import 'package:iomer/ui/scan/scan_screen.dart';

class OTListWidget extends StatefulWidget {
  const OTListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OTListState();
}

class _OTListState extends State<OTListWidget> {

  late OtBloc _otbloc;

  @override
  void initState() {
    _otbloc = getIt.get<OtBloc>();
    _otbloc.add(FetchEventOt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
          child: Text(
            'Listes des ordres de travaux',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Expanded(
          child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Column(
                children: [
                  Expanded(
                    child: BlocProvider(
                      create: (context) => _otbloc,
                      child: BlocBuilder<OtBloc, OtState>(
                      builder: (context, state) {
                        if(state is OtLoaded) {
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: state.ots.length,
                            itemBuilder: (context, index) {
                            return ListTile(title: Text(state.ots[index].LIBELLEOT));
                            },
                          );
                        } else if (state is OtError) {
                          return Text(state.message);
                        }
                        return const Center(
                          child: SizedBox(
                              width: 32, height: 32, child: CircularProgressIndicator()),
                        );
                      }
                      ),
                    ),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: OTButtonWidget(),
                      ),
                    ],
                  ),
                ],
              )
          ),
        ),







        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ScanScreen()),
              );
            },
            child: const Text('Scan machine'),
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
          ),
        )
      ],
    );
  }
}
