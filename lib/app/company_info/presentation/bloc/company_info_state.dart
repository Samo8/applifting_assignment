part of 'company_info_bloc.dart';

abstract class CompanyInfoState extends Equatable {
  const CompanyInfoState();

  @override
  List<Object> get props => [];
}

class CompanyInfoInitial extends CompanyInfoState {
  const CompanyInfoInitial();
}

class CompanyInfoLoadingState extends CompanyInfoState {
  const CompanyInfoLoadingState();
}

class CompanyInfoLoadedState extends CompanyInfoState {
  final CompanyInfo companyInfo;

  const CompanyInfoLoadedState(this.companyInfo);

  @override
  List<Object> get props => [companyInfo];
}

class CompanyInfoErrorState extends CompanyInfoState {
  final String error;

  const CompanyInfoErrorState(this.error);

  @override
  List<Object> get props => [error];
}
