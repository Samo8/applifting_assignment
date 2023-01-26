import 'package:applifting_assignment/app/launch/domain/launch.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LaunchDetailScreenArgs extends Equatable {
  final Launch launch;

  const LaunchDetailScreenArgs(this.launch);

  @override
  List<Object> get props => [launch];
}

class LaunchDetailScreen extends StatelessWidget {
  static const routeName = '/launch-detail';

  final LaunchDetailScreenArgs args;

  const LaunchDetailScreen({
    required this.args,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.launch.name,
        ),
      ),
    );
  }
}
