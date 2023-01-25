import 'package:applifting_assignment/app/company_info/domain/company_info.dart';
import 'package:applifting_assignment/app/company_info/domain/headquarters.dart';
import 'package:applifting_assignment/app/company_info/domain/links.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'company_info_event.dart';
part 'company_info_state.dart';

class CompanyInfoBloc extends Bloc<CompanyInfoEvent, CompanyInfoState> {
  CompanyInfoBloc() : super(const CompanyInfoInitial()) {
    on<CompanyInfoFetchDataEvent>((_, emit) async {
      emit(const CompanyInfoLoadingState());

      try {
        await Future.delayed(const Duration(seconds: 2));
        const companyInfo = CompanyInfo(
          headquarters: Headquarters(
            address: 'Kuzmanyho',
            city: 'Banska Bystrica',
            state: 'Slovakia',
          ),
          links: Links(website: 'web stranka', twitter: 'twitter'),
          name: 'SpaceX',
          founded: 1242144124,
          employees: 2,
          vehicles: 2,
          launchSites: 4,
          testSites: 3,
          ceo: 'Elon',
          cto: 'Elon',
          valuation: 2,
          summary: 'Long summary',
        );
        emit(const CompanyInfoLoadedState(companyInfo));
      } catch (e) {
        emit(CompanyInfoErrorState(e.toString()));
      }
    });
  }
}
