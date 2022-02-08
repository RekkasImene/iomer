part of 'report_bloc.dart';

@immutable
abstract class ReportState {
  const ReportState();

  @override
  List<Object> get props => [];
}

class ReportInitial extends ReportState {}

class ReportError extends ReportState {
  final String message;

  const ReportError(this.message);
}

class ReportLoaded extends ReportState {}
