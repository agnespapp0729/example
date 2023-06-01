import 'package:equatable/equatable.dart';

class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object?> get props => [];
}

class TimerStarted extends TimerEvent {
  const TimerStarted(this.duration);
  final int duration;
}

class TimerPaused extends TimerEvent {
  const TimerPaused();
}

class TimerResumed extends TimerEvent {
  const TimerResumed(this.duration);
  final int duration;
}

class TimerReset extends TimerEvent {
  const TimerReset();
}

class TimerTicked extends TimerEvent {
  const TimerTicked(this.duration);
  final int duration;

  @override
  List<Object> get props => [duration];
}
