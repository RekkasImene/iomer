part of 'report_bloc.dart';

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
