part of 'report_bloc.dart';

///Cette classe contient tous les evenements lié à l'UI [report]
@immutable
abstract class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object> get props => [];
}

class ValidateReport extends ReportEvent {
  final List<Uint8List> listAttachements;
  final String textReport;

  ValidateReport(this.listAttachements, this.textReport);
}
