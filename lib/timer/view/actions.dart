import 'package:example/timer/bloc/timer_bloc.dart';
import 'package:example/timer/bloc/timer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/timer_event.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          if (state is TimerInitial) ...[
            FloatingActionButton(
                child: const Icon(Icons.play_arrow),
                onPressed: () => context
                    .read<TimerBloc>()
                    .add(TimerStarted(state.duration))),
          ] else if (state is TimerRunInProgress) ...[
            FloatingActionButton(
                child: const Icon(Icons.pause),
                onPressed: () =>
                    context.read<TimerBloc>().add(const TimerPaused())),
            FloatingActionButton(
                child: const Icon(Icons.refresh),
                onPressed: () =>
                    context.read<TimerBloc>().add(const TimerReset())),
          ] else if (state is TimerRunPause) ...[
            FloatingActionButton(
                child: const Icon(Icons.play_arrow),
                onPressed: () => context
                    .read<TimerBloc>()
                    .add(TimerResumed(state.duration))),
            FloatingActionButton(
                child: const Icon(Icons.refresh),
                onPressed: () =>
                    context.read<TimerBloc>().add(const TimerReset())),
          ] else if (state is TimerRunComplete) ...[
            FloatingActionButton(
                child: const Icon(Icons.refresh),
                onPressed: () =>
                    context.read<TimerBloc>().add(const TimerReset()))
          ],
        ]);
      },
    );
  }
}
