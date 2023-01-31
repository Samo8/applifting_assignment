import 'package:applifting_assignment/app/company_info/application/company_info_service_interface.dart';
import 'package:applifting_assignment/app/company_info/domain/company_info.dart';
import 'package:applifting_assignment/exception/http_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'company_info_event.dart';
part 'company_info_state.dart';

class CompanyInfoBloc extends Bloc<CompanyInfoEvent, CompanyInfoState> {
  final ICompanyInfoService companyInfoService;
  CompanyInfoBloc(this.companyInfoService) : super(const CompanyInfoInitial()) {
    on<CompanyInfoFetchDataEvent>((_, emit) async {
      emit(const CompanyInfoLoadingState());

      try {
        final companyInfo = await companyInfoService.getCompanyInfo();

        emit(CompanyInfoLoadedState(companyInfo));
      } on CustomHttpException catch (e) {
        emit(CompanyInfoErrorState(e.message));
      } catch (e) {
        emit(CompanyInfoErrorState(e.toString()));
      }
    });
    on<CompanyInfoOpenWebPageEvent>(
      (event, _) async => await companyInfoService.openWebPage(event.url),
    );
  }
}
