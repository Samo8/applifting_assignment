import 'package:applifting_assignment/app/launch/domain/enums/filter_by_enum.dart';
import 'package:applifting_assignment/app/launch/domain/launch.dart';
import 'package:applifting_assignment/app/launch/presentation/bloc/launch_bloc.dart';
import 'package:applifting_assignment/app/launch/presentation/launch_detail_screen.dart';
import 'package:applifting_assignment/i18n/strings.g.dart';
import 'package:collection/collection.dart';
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
  final _searchTextController = TextEditingController();
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      autocorrect: false,
                      controller: _searchTextController,
                      onChanged: (value) => _launchBloc.add(
                        LaunchSearchEvent(value),
                      ),
                      decoration: InputDecoration(
                        hintText: t.launch.search,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _searchTextController.clear();
                            _launchBloc.add(
                              const LaunchClearSearchEvent(),
                            );
                          },
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: DropdownButton<FilterBy>(
                      value: state.filter?.filterBy ?? FilterBy.id,
                      elevation: 16,
                      onChanged: (FilterBy? value) {
                        if (value == FilterBy.id) {
                          _launchBloc.add(
                            LaunchSortByLaunchIdEvent(
                              descending: state.filter?.isDescending ?? false,
                            ),
                          );
                        } else if (value == FilterBy.date) {
                          _launchBloc.add(
                            LaunchSortByLaunchDateEvent(
                              descending: state.filter?.isDescending ?? false,
                            ),
                          );
                        }
                      },
                      items: FilterBy.values
                          .mapIndexed<DropdownMenuItem<FilterBy>>((i, FilterBy value) {
                        return DropdownMenuItem<FilterBy>(
                          value: value,
                          child: Text(t.launch.filterBy[i]),
                        );
                      }).toList(),
                    ),
                  ),
                  IconButton(
                    onPressed: () => _launchBloc.add(
                      const LaunchUpdateDescendingSortEvent(),
                    ),
                    icon: Icon(
                      Icons.sort_by_alpha,
                      color: (state.filter != null && state.filter!.isDescending)
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                ],
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
  final LaunchBloc launchBloc;
  final bool isLoading;
  final String error;
  final List<Launch> launches;

  const LaunchScreenBody({
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
        return Center(
          child: Text(t.launch.noLaunches),
        );
      }
      return RefreshIndicator(
        onRefresh: () async => launchBloc.add(
          const LaunchFetchDataEvent(),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final launch = launches[index];

            return ListTile(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => LaunchDetailScreen(
                    args: LaunchDetailScreenArgs(launch),
                  ),
                ),
              ),
              title: Text(
                launch.name,
                style: TextStyle(
                  color:
                      launch.success != null ? (launch.success! ? Colors.green : Colors.red) : null,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    launchBloc.launchesService.formatDate(launch.date),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text('id: ${launch.id}'),
                ],
              ),
              trailing: Text(
                launch.flightNumber?.toString() ?? '',
              ),
            );
          },
          itemCount: launches.length,
        ),
      );
    }
  }
}
