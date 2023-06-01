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
      //buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          if (state is TimerInitial) ...[
            FloatingActionButton(
                child: const Icon(Icons.play_arrow),

                /// changes from current state to TimerStarted state
                onPressed: () => context
                    .read<TimerBloc>()
                    .add(TimerStarted(state.duration))),
          ] else if (state is TimerRunInProgress) ...[
            FloatingActionButton(
                child: const Icon(Icons.pause),

                /// changes from current state to TimerPaused state
                onPressed: () =>
                    context.read<TimerBloc>().add(const TimerPaused())),
            FloatingActionButton(
                child: const Icon(Icons.refresh),

                /// changes from current state to TimerReset state
                onPressed: () => context.read<TimerBloc>().add(TimerReset())),
          ] else if (state is TimerRunPause) ...[
            FloatingActionButton(
                child: const Icon(Icons.play_arrow),

                /// changes from current state to TimerRunPause state
                onPressed: () => context
                    .read<TimerBloc>()
                    .add(TimerResumed(state.duration))),
            FloatingActionButton(
                child: const Icon(Icons.refresh),
                onPressed: () => context.read<TimerBloc>().add(TimerReset())),
          ] else if (state is TimerRunComplete) ...[
            /// changes from current state to TimerReset state
            FloatingActionButton(
                child: const Icon(Icons.refresh),
                onPressed: () => context.read<TimerBloc>().add(TimerReset()))
          ],
          /*FloatingActionButton(
            onPressed: () {
              if (state is TimerInitial) {
                FloatingActionButton(
                  child: const Icon(Icons.play_arrow),
                  onPressed: () => context
                      .read<TimerBloc>()
                      .add(TimerStarted(duration: state.duration)),
                );
              } else if (state is TimerRunInProgress) {
                FloatingActionButton(
                  child: const Icon(Icons.pause),
                  onPressed: () =>
                      context.read<TimerBloc>().add(const TimerPaused()),
                );
                FloatingActionButton(
                  child: const Icon(Icons.replay),
                  onPressed: () =>
                      context.read<TimerBloc>().add(const TimerReset()),
                );
              } else if (state is TimerRunPause) {
                FloatingActionButton(
                  child: const Icon(Icons.play_arrow),
                  onPressed: () =>
                      context.read<TimerBloc>().add(const TimerResumed()),
                );
                FloatingActionButton(
                  child: const Icon(Icons.replay),
                  onPressed: () =>
                      context.read<TimerBloc>().add(const TimerReset()),
                );
              } else if (state is TimerRunComplete) {
                FloatingActionButton(
                  child: const Icon(Icons.replay),
                  onPressed: () =>
                      context.read<TimerBloc>().add(const TimerReset()),
                );
              }
            },
          ),*/
        ]);
      },
    );
  }
}
