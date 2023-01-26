import 'package:applifting_assignment/app/launch/domain/launch.dart';
import 'package:applifting_assignment/app/launch/presentation/bloc/launch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({
    super.key,
  });

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  late final LaunchBloc _launchBloc;

  @override
  void initState() {
    _launchBloc = context.read<LaunchBloc>();
    _launchBloc.add(const LaunchFetchDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchBloc, LaunchState>(
      builder: (context, state) {
        return Column(
          children: [
            TextField(
              autocorrect: false,
              onChanged: (value) => _launchBloc.add(
                LaunchSearchEvent(value),
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Theme.of(context).primaryColor,
                      tabs: const [
                        Tab(
                          icon: Icon(Icons.punch_clock_outlined),
                        ),
                        Tab(
                          icon: Icon(Icons.next_plan),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          LaunchScreenBody(
                            launchBloc: _launchBloc,
                            isLoading: state.isLoading,
                            error: state.error,
                            launches: state.pastLaunches,
                          ),
                          LaunchScreenBody(
                            launchBloc: _launchBloc,
                            isLoading: state.isLoading,
                            error: state.error,
                            launches: state.upcomingLaunches,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class LaunchScreenBody extends StatelessWidget {
  final _dateFormat = DateFormat('dd.MM.yyyy HH:mm');

  final LaunchBloc launchBloc;
  final bool isLoading;
  final String error;
  final List<Launch> launches;

  LaunchScreenBody({
    required this.launchBloc,
    required this.isLoading,
    required this.error,
    required this.launches,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (error.isNotEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(error),
          IconButton(
            onPressed: () => launchBloc.add(
              const LaunchFetchDataEvent(),
            ),
            icon: const Icon(Icons.refresh),
          ),
        ],
      );
    } else {
      if (launches.isEmpty) {
        return const Center(
          child: Text('There are no launches'),
        );
      }
      return RefreshIndicator(
        onRefresh: () async => launchBloc.add(
          const LaunchFetchDataEvent(),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final pastLaunch = launches[index];

            return ListTile(
              title: Text(
                pastLaunch.name,
                style: TextStyle(
                  color: pastLaunch.success != null
                      ? (pastLaunch.success! ? Colors.green : Colors.red)
                      : null,
                ),
              ),
              subtitle: Text(_dateFormat.format(pastLaunch.date)),
              trailing: Text(
                pastLaunch.flightNumber?.toString() ?? '',
              ),
            );
          },
          itemCount: launches.length,
        ),
      );
    }
  }
}
