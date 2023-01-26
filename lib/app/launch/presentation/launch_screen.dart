import 'package:applifting_assignment/app/launch/presentation/bloc/launch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({
    super.key,
  });

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  late final LaunchBloc _launchesBloc;

  @override
  void initState() {
    _launchesBloc = context.read<LaunchBloc>();
    _launchesBloc.add(const LaunchFetchDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchBloc, LaunchState>(
      builder: (context, state) {
        if (state is LaunchLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LaunchErrorState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(state.error),
              IconButton(
                onPressed: () => _launchesBloc.add(
                  const LaunchFetchDataEvent(),
                ),
                icon: const Icon(Icons.refresh),
              ),
            ],
          );
        } else if (state is LaunchLoadedState) {
          final pastLaunches = state.pastLaunches;

          return RefreshIndicator(
            onRefresh: () async => _launchesBloc.add(
              const LaunchFetchDataEvent(),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final pastLaunch = pastLaunches[index];

                return ListTile(
                  title: Text(
                    pastLaunch.name,
                    style: TextStyle(
                      color: pastLaunch.success != null
                          ? (pastLaunch.success! ? Colors.green : Colors.red)
                          : null,
                    ),
                  ),
                );
              },
              itemCount: pastLaunches.length,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
