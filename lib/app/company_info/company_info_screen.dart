import 'package:applifting_assignment/app/company_info/bloc/company_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyInfoScreen extends StatefulWidget {
  const CompanyInfoScreen({
    super.key,
  });

  @override
  State<CompanyInfoScreen> createState() => _CompanyInfoScreenState();
}

class _CompanyInfoScreenState extends State<CompanyInfoScreen> {
  late final CompanyInfoBloc _companyInfoBloc;

  @override
  void initState() {
    _companyInfoBloc = context.read<CompanyInfoBloc>();
    _companyInfoBloc.add(const CompanyInfoFetchDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Applifting SpaceX'),
      ),
      body: BlocBuilder<CompanyInfoBloc, CompanyInfoState>(
        builder: (context, state) {
          if (state is CompanyInfoLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CompanyInfoErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is CompanyInfoLoadedState) {
            final companyInfo = state.companyInfo;
            final headquarters = companyInfo.headquarters;

            return RefreshIndicator(
              onRefresh: () async => _companyInfoBloc.add(
                const CompanyInfoFetchDataEvent(),
              ),
              child: ListView(
                children: [
                  const Text('Headquarters:'),
                  const SizedBox(height: 10.0),
                  Text('${headquarters.address}, ${headquarters.city}, ${headquarters.state}'),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
