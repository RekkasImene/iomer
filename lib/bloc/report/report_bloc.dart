
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:iomere/config/injection.dart';
import 'package:iomere/models/bdd/iomer_database.dart';
import 'package:iomere/models/repository/local_repository.dart';
import 'package:meta/meta.dart';

part 'report_event.dart';
part 'report_state.dart';
/// Cette classe contient le Bloc de l'Ui [report]
/// Elle reçoit et traite les évenements définis dans [report_ot], et déclenche par ce fait des méthodes de [LocalRepository]
/// Emet un etat de [ot_state]
@Environment(Env.prod)
@injectable
class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final LocalRepository _repository;

  ReportBloc(this._repository) : super(ReportInitial()) {
    on<ReportEvent>((event, emit) async {
      if (event is ValidateReport) {
        Ot ot = await _repository.getOt();
        event.listAttachements.forEach((element) async {
          await _repository.insertDocument(ot.IDOT, element);
        });


      } else {
        emit(const ReportError('Error'));
      }
    });
  }
}
