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
        padding: const EdgeInsets.only(top: 10.0),
        children: [
          if (launch.links.patch.small != null)
            Image.network(
              launch.links.patch.small!,
              height: 150.0,
              fit: BoxFit.fitHeight,
              loadingBuilder:
                  (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
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
        ],
      ),
    );
  }
}
