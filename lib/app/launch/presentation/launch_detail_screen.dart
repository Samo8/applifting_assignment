import 'package:applifting_assignment/app/launch/domain/failure.dart';
import 'package:applifting_assignment/app/launch/domain/launch.dart';
import 'package:applifting_assignment/app/launch/presentation/bloc/launch_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaunchDetailScreenArgs extends Equatable {
  final Launch launch;

  const LaunchDetailScreenArgs(this.launch);

  @override
  List<Object> get props => [launch];
}

class LaunchDetailScreen extends StatelessWidget {
  static const routeName = '/launch-detail';

  final LaunchDetailScreenArgs args;

  Launch get launch => args.launch;

  const LaunchDetailScreen({
    required this.args,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          launch.name,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
        ),
        children: [
          Text(
            'Launched at: ${context.read<LaunchBloc>().launchesService.formatDate(launch.date)}',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20.0),
          if (launch.links.patch.small != null)
            Image.network(
              launch.links.patch.small!,
              height: 150.0,
              fit: BoxFit.fitHeight,
              loadingBuilder: (
                BuildContext context,
                Widget child,
                ImageChunkEvent? loadingProgress,
              ) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          Failures(failures: launch.failures),
          const SizedBox(height: 10.0),
          if (launch.details != null)
            Text(
              'Detial: ${launch.details}',
              textAlign: TextAlign.center,
            ),
          Column(
            children: [
              const SizedBox(height: 10.0),
              Text(
                'Crew:',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              if (launch.crew.isNotEmpty)
                Column(
                  children: launch.crew.map((e) => Text(e.role ?? '')).toList(),
                )
              else
                const Text('No info about crew'),
            ],
          ),
        ],
      ),
    );
  }
}

class Failures extends StatelessWidget {
  final List<Failure> failures;

  const Failures({
    required this.failures,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (failures.isNotEmpty) {
      return Column(
        children: [
          const SizedBox(height: 20.0),
          Text(
            'The flight has failed',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const Text('Failures:'),
          Column(
            children: failures
                .map(
                  (e) => ListTile(
                    title: Text(e.reason),
                    subtitle: e.altitude != null ? Text('Altitude: ${e.altitude}') : null,
                  ),
                )
                .toList(),
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}
