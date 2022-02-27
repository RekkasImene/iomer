import 'package:equatable/equatable.dart';

abstract class JournalEvent extends Equatable {
  const JournalEvent();

  @override
  List<Object> get props => [];
}

class FetchEventJournal extends JournalEvent {}

class JournalEventSynchronisation extends JournalEvent {}
