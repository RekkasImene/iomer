part of 'journal_bloc.dart';

@immutable
abstract class JournalState {
  const JournalState();

  @override
  List<Object> get props => [];
}

class JournalInitial extends JournalState {}

class JounalStateLoaded extends JournalState {
  final List<Ot> ots;

  const JounalStateLoaded(this.ots);
}

class JournalStateLoading extends JournalState {}

class JournalStateError extends JournalState {}

class JournalStatePushSuccess extends JournalState {
  String message;
  JournalStatePushSuccess(this.message);
}

class JournalStatePushFail extends JournalState {
  String message;
  JournalStatePushFail(this.message);
}
