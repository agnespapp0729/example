import 'package:equatable/equatable.dart';

class TimerState extends Equatable {
  const TimerState(this.duration);
  final int duration;
  @override
  List<Object?> get props => [duration];
}

class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() => 'Timerinitial {duration: $duration}';
}

class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);

  @override
  String toString() => 'TimerPause {duration: $duration}';
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);

  @override
  String toString() => 'TimerRunInProgress {duration: $duration}';
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}
