import 'package:applifting_assignment/app/company_info/presentation/bloc/company_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return BlocBuilder<CompanyInfoBloc, CompanyInfoState>(
      builder: (context, state) {
        if (state is CompanyInfoLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CompanyInfoErrorState) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  state.error,
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  onPressed: () => _companyInfoBloc.add(
                    const CompanyInfoFetchDataEvent(),
                  ),
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
          );
        } else if (state is CompanyInfoLoadedState) {
          final companyInfo = state.companyInfo;
          final headquarters = companyInfo.headquarters;

          return RefreshIndicator(
            onRefresh: () async => _companyInfoBloc.add(
              const CompanyInfoFetchDataEvent(),
            ),
            child: ListView(
              padding: const EdgeInsets.only(top: 10.0),
              children: [
                ListItem(
                  children: [
                    const TitleItem(text: 'Name:'),
                    BasicItem(
                      text: companyInfo.name,
                    ),
                  ],
                ),
                ListItem(
                  children: [
                    const TitleItem(text: 'Headquarters:'),
                    BasicItem(
                      text: '${headquarters.address}, ${headquarters.city}, ${headquarters.state}',
                    ),
                  ],
                ),
                ListItem(
                  children: [
                    const TitleItem(text: 'CEO & CTO:'),
                    BasicItem(
                      text: companyInfo.ceo == companyInfo.cto
                          ? companyInfo.ceo
                          : '${companyInfo.ceo} & ${companyInfo.cto}',
                    ),
                  ],
                ),
                ListItem(
                  children: [
                    const TitleItem(text: 'Number of employees:'),
                    BasicItem(
                      text: '${companyInfo.employees}',
                    ),
                  ],
                ),
                ListItem(
                  children: [
                    const TitleItem(text: 'Founded in:'),
                    BasicItem(
                      text: '${companyInfo.founded}',
                    ),
                  ],
                ),
                ListItem(
                  children: [
                    const TitleItem(text: 'Summary:'),
                    BasicItem(
                      text: companyInfo.summary,
                    ),
                  ],
                ),
                ListItem(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () => _companyInfoBloc.add(
                          CompanyInfoOpenWebPageEvent(
                            state.companyInfo.links.website,
                          ),
                        ),
                        icon: const FaIcon(FontAwesomeIcons.chrome),
                      ),
                      IconButton(
                        onPressed: () => _companyInfoBloc.add(
                          CompanyInfoOpenWebPageEvent(
                            state.companyInfo.links.twitter,
                          ),
                        ),
                        icon: const FaIcon(FontAwesomeIcons.twitter),
                      ),
                    ],
                  ),
                ]),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class ListItem extends StatelessWidget {
  final List<Widget> children;

  const ListItem({
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 20.0,
      ),
      child: Column(
        children: children,
      ),
    );
  }
}

class TitleItem extends StatelessWidget {
  final String text;

  const TitleItem({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

class BasicItem extends StatelessWidget {
  final String text;

  const BasicItem({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(text),
    );
  }
}
