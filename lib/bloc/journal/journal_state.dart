part of 'journal_bloc.dart';

@immutable
abstract class JournalState {
  const JournalState();

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
  final String message;
  const JournalStatePushSuccess(this.message);
}

class JournalStatePushFail extends JournalState {
  final String message;
  const JournalStatePushFail(this.message);
}
